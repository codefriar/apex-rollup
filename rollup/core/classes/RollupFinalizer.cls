/**
 * Finalizer implementation for Queueable-based rollup operations. Provides post-execution handling
 * for both success and failure scenarios. On success, chains to the next pending "conductor" (batch processor)
 * in the queue. On unhandled exceptions, logs detailed error information including stack traces for debugging.
 *
 * Key responsibilities:
 * - Chain execution: Processes queued conductor jobs sequentially to avoid governor limits
 * - Error logging: Captures and logs unhandled exceptions with full context for troubleshooting
 * - State management: Prevents duplicate conductor starts via hasAlreadyStartedConductor flag
 *
 * The "caboose" pattern allows multiple rollup operations to queue behind the current job, ensuring
 * they execute in order after the current job completes. This is essential for managing async limits
 * and ensuring all rollups complete even when transaction limits are approached.
 *
 * @see RollupAsyncProcessor For the async processor that attaches this finalizer
 * @group Apex Rollup
 */
public without sharing virtual class RollupFinalizer implements Finalizer {
  @TestVisible
  private static Boolean wasExceptionLogged = false;

  /** @description Queue of pending rollup processors waiting to execute after the current job */
  protected final List<RollupAsyncProcessor> cabooses = new List<RollupAsyncProcessor>();
  /** @description Guard flag preventing multiple conductor starts in a single finalizer execution */
  protected Boolean hasAlreadyStartedConductor = false;

  /**
   * Serialization-safe wrapper for FinalizerContext exception data. The native Exception class
   * cannot be reliably serialized in Apex, so this class extracts the relevant fields into primitive types
   * for logging purposes.
   */
  private class FinalizerContextLoggable implements RollupLogger.ToStringObject {
    public final String exceptionMessage;
    public final String exceptionStacktrace;
    public final String exceptionType;
    public final String jobId;
    public final String requestId;
    public final String resultName;

    public FinalizerContextLoggable(System.FinalizerContext fc) {
      this.jobId = fc.getAsyncApexJobId();
      this.requestId = fc.getRequestId();
      this.resultName = fc.getResult().name();
      this.exceptionMessage = fc.getException()?.getMessage();
      this.exceptionStacktrace = fc.getException()?.getStackTraceString();
      this.exceptionType = fc.getException()?.getTypeName();
    }

    public override String toString() {
      return 'FinalizerContext:[ ' + JSON.serializePretty(this, true).removeStart('{').removeEnd('}') + ']';
    }
  }

  /**
   * Main finalizer execution method called by the platform after Queueable completion.
   * Routes to error logging for unhandled exceptions or chains to the next conductor on success.
   * @param fc The FinalizerContext provided by the platform containing execution result and any exception
   */
  public virtual void execute(FinalizerContext fc) {
    this.hasAlreadyStartedConductor = false;
    RollupLogger.Instance.log('Beginning finalizer with cabooses: ' + this.cabooses.size(), System.LoggingLevel.INFO);
    switch on fc?.getResult() {
      when UNHANDLED_EXCEPTION {
        this.logUnhandledException(fc);
      }
      when else {
        this.handleSuccess();
        this.recurseThroughConductors();
      }
    }
    RollupLogger.Instance.log('finalizer finished', System.LoggingLevel.INFO);
  }

  /**
   * Adds a conductor to the caboose queue. These will execute sequentially after the
   * current job completes successfully.
   * @param caboose The RollupAsyncProcessor to queue for later execution
   */
  public void addCaboose(RollupAsyncProcessor caboose) {
    this.cabooses.add(caboose);
  }

  @SuppressWarnings('PMD.EmptyStatementBlock')
  protected virtual void handleSuccess() {
  }

  protected void logUnhandledException(FinalizerContext fc) {
    if (wasExceptionLogged == false) {
      wasExceptionLogged = true;
      // a finalizer can be re-queued up to five times, but we view this as a one-time "get out of jail free" logger
      RollupLogger.Instance.log('Unhandled exception, stopping execution:', new FinalizerContextLoggable(fc), System.LoggingLevel.ERROR);
      RollupLogger.Instance.save();
    }
  }

  private void recurseThroughConductors() {
    if (this.cabooses.isEmpty() == false && this.hasAlreadyStartedConductor == false) {
      RollupAsyncProcessor conductor = this.cabooses.remove(0);
      RollupLogger.Instance.log('Starting up new conductor', conductor, System.LoggingLevel.INFO);
      String potentialProcessId = conductor.runCalc();
      Boolean hasStartedAsync = potentialProcessId != conductor.getNoProcessId();
      this.hasAlreadyStartedConductor = this.hasAlreadyStartedConductor || hasStartedAsync;
      if (hasStartedAsync == false && this.hasAlreadyStartedConductor == false && this.cabooses.isEmpty() == false) {
        this.recurseThroughConductors();
      }
    }
  }
}
