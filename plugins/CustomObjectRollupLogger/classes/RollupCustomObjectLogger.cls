/**
 * Logger plugin that persists rollup log entries to a custom object via platform events.
 * Publishes RollupLogEvent__e platform events which are consumed by a trigger to create RollupLog__c records.
 * This provides durable, queryable log storage for production debugging and audit trails.
 *
 * Configuration:
 * - Create a RollupPlugin__mdt record with DeveloperName containing 'Logger'
 * - Deploy the RollupLogEvent__e platform event and its trigger
 * - Optionally configure 'CustomLoggingDebugLevel' parameter for log level filtering
 *
 * Design considerations:
 * - Uses platform events for transaction-safe, async log persistence
 * - Truncates messages to field length limit with '...' indicator (platform events silently fail on overflow)
 * - Includes transaction Id for correlating logs across async boundaries
 * - Buffers events until save() is called to batch publishes
 *
 * @see RollupLogger For the base logging framework
 * @see RollupLogEvent__e For the platform event definition
 * @group Apex Rollup Plugins
 */
public class RollupCustomObjectLogger extends RollupLogger {
  private final List<RollupLogEvent__e> rollupLogEvents = new List<RollupLogEvent__e>();
  private static final Integer MAX_LENGTH = RollupLogEvent__e.Message__c.getDescribe().getLength();

  /**
   * Default constructor initializing the logger with base class configuration.
   */
  public RollupCustomObjectLogger() {
    super();
  }

  /**
   * Publishes all buffered log events to the event bus for async persistence.
   * Clears the buffer after publishing.
   */
  public override void save() {
    EventBus.publish(this.rollupLogEvents);
    this.rollupLogEvents.clear();
  }

  /**
   * Creates a platform event for the log entry and adds it to the buffer.
   * Truncates messages exceeding the field length limit to prevent silent publish failures.
   * @param logString The primary log message
   * @param logObject Optional context object for additional details
   * @param logLevel The severity level for this entry
   */
  protected override void innerLog(String logString, Object logObject, System.LoggingLevel logLevel) {
    logString = this.getBaseLoggingMessage() + logString + '\n' + this.getLogStringFromObject(logObject);
    if (logString.length() >= MAX_LENGTH) {
      // normally we could do this with the AllowFieldTruncation property on Database.DMLOptions
      // but even though you can add DMLOptions to platform event objects, they don't seem to do anything -
      // and if any of the field's text lengths is exceeded, the platform event silently fails to fire - neat!
      logString = logString.substring(0, MAX_LENGTH - 4) + ' ...';
    }
    RollupLogEvent__e logEvent = new RollupLogEvent__e(
      LoggingLevel__c = logLevel.name(),
      LoggedBy__c = UserInfo.getUserId(),
      Message__c = logString,
      TransactionId__c = Request.getCurrent().getRequestId()
    );
    this.rollupLogEvents.add(logEvent);
  }

  /**
   * Returns the parameter name for custom object logger's log level configuration.
   * @return 'CustomLoggingDebugLevel' - the DeveloperName of the RollupPluginParameter__mdt record
   */
  protected override String getLoggingLevelDeveloperName() {
    return 'CustomLoggingDebugLevel';
  }
}
