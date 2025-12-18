/**
 * Governor limit monitoring utility for rollup operations. Provides proactive limit checking
 * to enable graceful degradation to async processing before hitting hard limits. Monitors SOQL queries,
 * query rows, DML rows, CPU time, and org-level async job limits. Configurable thresholds via
 * RollupControl__mdt allow admins to tune behavior based on org-specific patterns.
 *
 * Key design decisions:
 * - Proactive checking: Tests limits BEFORE operations to allow async fallback
 * - Configurable thresholds: Admin-tunable via RollupControl__mdt metadata
 * - Timeout buffers: Different intervals for sync (1.5s) vs async (13s) to account for execution context
 * - Org limit awareness: Checks daily async job limits to prevent org-wide quota exhaustion
 *
 * @see RollupControl__mdt For threshold configuration
 * @see RollupAsyncProcessor For async fallback behavior
 * @group Apex Rollup
 */
public without sharing class RollupLimits {
  @TestVisible
  private static Integer stubbedQueryRows;
  @TestVisible
  private static Integer currentAsyncJobsUsed;
  @TestVisible
  private static Integer stubAsyncTimeoutInterval;

  /** @description CPU time buffer for synchronous execution (1.5 seconds) */
  private static final Integer SYNC_TIMEOUT_INTERVAL_MS = 1500;
  /** @description Standard SOQL query row limit */
  private static final Integer LIMIT_QUERY_ROWS = 50000;

  @SuppressWarnings('PMD.PropertyNamingConventions')
  private static final Integer ASYNC_TIMEOUT_INTERVAL_MS {
    get {
      ASYNC_TIMEOUT_INTERVAL_MS = ASYNC_TIMEOUT_INTERVAL_MS ?? stubAsyncTimeoutInterval ?? 13000;
      return ASYNC_TIMEOUT_INTERVAL_MS;
    }
    set;
  }

  @SuppressWarnings('PMD.PropertyNamingConventions')
  private static final Boolean HAS_EXCEEDED_ORG_ASYNC_JOB_LIMIT {
    get {
      Integer asyncJobLimit = 250000;
      if (HAS_EXCEEDED_ORG_ASYNC_JOB_LIMIT == null) {
        System.OrgLimit asyncOrgLimit = System.OrgLimits.getMap().get('DailyAsyncApexExecutions');
        asyncJobLimit = asyncOrgLimit.getLimit();
        Integer countOfJobsUsed = currentAsyncJobsUsed ?? asyncOrgLimit.getValue();
        HAS_EXCEEDED_ORG_ASYNC_JOB_LIMIT = countOfJobsUsed - asyncJobLimit > 0;
      }
      return HAS_EXCEEDED_ORG_ASYNC_JOB_LIMIT;
    }
    set;
  }

  /**
   * Stateful limit checker that evaluates multiple governor limits at construction time.
   * Exposes individual limit flags for granular decision-making and an aggregate hasExceededLimits()
   * for simple go/no-go decisions. Used throughout rollup processing to determine when to defer to
   * async execution or stop processing.
   */
  public class Tester {
    private final transient RollupControl__mdt control;
    private final transient Boolean isRunningAsync;
    private final Boolean hasExceededOverallLimits;

    /** @description True if SOQL query count exceeds configured MaxNumberOfQueries__c */
    public final Boolean hasExceededQueryNumberLimit;
    /** @description True if query rows consumed exceeds configured MaxQueryRows__c */
    public final Boolean hasExceededQueryRowLimit;
    /** @description True if DML rows consumed exceeds configured MaxParentRowsUpdatedAtOnce__c */
    public final Boolean hasExceededDMLRowLimit;
    /** @description True if remaining CPU time is less than the timeout buffer interval */
    public final Boolean hasExceededCPUTimeLimit;

    /**
     * Constructs a Tester and evaluates all limit conditions. The isRunningAsync flag
     * determines which timeout interval to use for CPU time checks.
     * @param control The RollupControl__mdt record with configured thresholds
     * @param isRunningAsync True if executing in async context (batch/queueable), affects CPU buffer
     */
    @SuppressWarnings('PMD.AvoidBooleanMethodParameters')
    public Tester(RollupControl__mdt control, Boolean isRunningAsync) {
      this.control = control;
      this.isRunningAsync = isRunningAsync;
      this.hasExceededQueryNumberLimit = this.control?.MaxNumberOfQueries__c < Limits.getQueries();
      this.hasExceededQueryRowLimit = this.getRemainingQueryRows() < 0;
      this.hasExceededDMLRowLimit = this.control?.MaxParentRowsUpdatedAtOnce__c < Limits.getDmlRows();

      Integer intervalTillTimeout = this.isRunningAsync ? ASYNC_TIMEOUT_INTERVAL_MS : SYNC_TIMEOUT_INTERVAL_MS;
      this.hasExceededCPUTimeLimit = (Limits.getCpuTime() + intervalTillTimeout) >= Limits.getLimitCpuTime();
      this.hasExceededOverallLimits =
        this.hasExceededQueryNumberLimit ||
        this.hasExceededQueryRowLimit ||
        this.hasExceededDMLRowLimit ||
        this.hasExceededCPUTimeLimit;
    }

    /**
     * Returns true if any monitored limit has been exceeded. Use for simple go/no-go
     * decisions about whether to continue processing or defer to async.
     * @return True if any limit condition is violated
     */
    public Boolean hasExceededLimits() {
      return this.hasExceededOverallLimits;
    }

    /**
     * Calculates remaining query rows based on configured maximum. Uses the lower of
     * MaxQueryRows__c or the standard 50,000 limit. Negative values indicate the limit is exceeded.
     * @return Number of remaining query rows available, or negative if exceeded
     */
    public Decimal getRemainingQueryRows() {
      Integer queryRowsUsed = stubbedQueryRows ?? Limits.getQueryRows();
      Decimal maxQueryRows = this.control.MaxQueryRows__c != null &&
        this.control.MaxQueryRows__c <= LIMIT_QUERY_ROWS
        ? this.control.MaxQueryRows__c
        : LIMIT_QUERY_ROWS;
      return maxQueryRows - queryRowsUsed;
    }

    /**
     * Checks if the org has exceeded its daily async Apex job limit. This is an org-wide
     * limit (typically 250,000) that affects all async operations, not just rollups.
     * @return True if the org's daily async job limit has been reached
     */
    public Boolean hasExceededOrgAsyncLimit() {
      return HAS_EXCEEDED_ORG_ASYNC_JOB_LIMIT;
    }
  }
}
