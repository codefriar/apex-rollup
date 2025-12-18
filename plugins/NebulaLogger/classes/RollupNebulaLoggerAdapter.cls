/**
 * @description Logger plugin that integrates Apex Rollup with Nebula Logger for centralized log management.
 * Routes all rollup log messages through Nebula Logger's infrastructure, enabling features like log retention,
 * tagging, scenario-based filtering, and external log shipping. Requires Nebula Logger to be installed in the org.
 *
 * Configuration:
 * - Create a RollupPlugin__mdt record with DeveloperName = 'RollupNebulaLoggerAdapter'
 * - Ensure Nebula Logger is installed and configured in the org
 *
 * Features:
 * - Disables duplicate System.debug output from Nebula Logger (handled by base RollupLogger)
 * - Sets scenario to 'Apex Rollup' for easy log filtering
 * - Ignores adapter class in stack traces for cleaner origin tracking
 *
 * @see RollupLogger For the base logging framework
 * @see https://github.com/jongpie/NebulaLogger For Nebula Logger documentation
 * @group Apex Rollup Plugins
 */
public class RollupNebulaLoggerAdapter extends RollupLogger {
  /**
   * @description Constructs the adapter and configures Nebula Logger settings. Disables Apex debug logging
   * in Nebula to prevent duplicate console output, sets the 'Apex Rollup' scenario, and configures
   * origin ignore rules for cleaner stack traces.
   */
  public RollupNebulaLoggerAdapter() {
    super();
    // prevents duplicating Apex Debug messages
    // between logger instances
    Logger.getUserSettings().IsApexSystemDebugLoggingEnabled__c = false;
    Logger.setScenario('Apex Rollup');
    Logger.ignoreOrigin(RollupNebulaLoggerAdapter.class);
    Logger.ignoreOrigin(RollupLogger.class);
  }

  /**
   * @description Persists buffered log entries by calling Nebula Logger's saveLog() method.
   * Commits all pending log entries to the Log__c custom object.
   */
  public override void save() {
    Logger.saveLog();
  }

  /**
   * @description Creates a new Nebula Logger entry with the formatted message and context object.
   * @param logString The primary log message
   * @param logObject Optional context object for additional details
   * @param logLevel The severity level for this entry
   */
  protected override void innerLog(String logString, Object logObject, System.LoggingLevel logLevel) {
    logString = logString + '\n' + this.getLogStringFromObject(logObject);
    Logger.newEntry(logLevel, this.getBaseLoggingMessage() + logString);
  }
}
