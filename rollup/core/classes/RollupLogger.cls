/**
 * Extensible logging framework for Rollup operations. Provides hierarchical log level control,
 * automatic version tagging, and plugin-based extensibility for custom logging implementations. The default
 * implementation writes to System.debug; custom implementations can persist logs to custom objects, external
 * services, or integrate with logging frameworks like Nebula Logger.
 *
 * Key features:
 * - Configurable log levels via RollupPluginParameter__mdt (LoggingDebugLevel)
 * - Plugin architecture supporting multiple simultaneous loggers via CompositeLogger
 * - Automatic stacktrace capture for debugging
 * - Graceful handling of various object types in log messages
 * - Version number injection for troubleshooting production issues
 *
 * Extend this class and register via RollupPlugin__mdt to implement custom logging behavior.
 *
 * @see RollupPlugin For plugin registration
 * @see RollupCustomObjectLogger For custom object persistence example
 * @group Apex Rollup
 */
@SuppressWarnings('PMD.AvoidGlobalModifier,PMD.CognitiveComplexity')
global without sharing virtual class RollupLogger implements ILogger {
  @TestVisible
  // this gets updated via the pipeline as the version number gets incremented
  private static final String CURRENT_VERSION_NUMBER = 'v1.7.33';
  private static final System.LoggingLevel FALLBACK_LOGGING_LEVEL = System.LoggingLevel.DEBUG;
  private static final RollupPlugin PLUGIN = new RollupPlugin();

  private final System.LoggingLevel currentLoggingLevel;

  /**
   * Default constructor initializes logging level from configuration.
   */
  protected RollupLogger() {
    this.currentLoggingLevel = this.getLogLevel();
  }

  /**
   * Allows test classes to inject custom logger implementations.
   * @param logger The ILogger implementation to use
   */
  public static void setLogger(ILogger logger) {
    Instance = logger;
  }

  /** @description Singleton logger instance, lazily initialized from plugins */
  @SuppressWarnings('PMD.PropertyNamingConventions')
  public static ILogger Instance {
    get {
      Instance = Instance ?? getRollupLogger();
      return Instance;
    }
    private set;
  }

  /**
   * Marker interface for objects that implement meaningful toString() behavior.
   * Objects implementing this interface have their toString() called directly rather than JSON serialization.
   */
  global interface ToStringObject {
  }

  /**
   * Core logging interface that all Rollup logger implementations must support.
   * Enables pluggable logging backends while maintaining a consistent API across the application.
   */
  global interface ILogger {
    /** @description Logs a message at the specified level */
    void log(String logString, System.LoggingLevel logLevel);
    /** @description Logs a message with an associated object for context */
    void log(String logString, Object logObject, System.LoggingLevel logLevel);
    /** @description Persists accumulated log entries (for implementations that buffer) */
    void save();
    /** @description Updates logging configuration from control metadata */
    ILogger updateRollupControl(RollupControl__mdt control);
  }

  /**
   * Convenience method for logging without an associated object.
   * @param logString The message to log
   * @param logLevel The severity level for this log entry
   */
  public void log(String logString, System.LoggingLevel logLevel) {
    this.log(logString, null, logLevel);
  }

  /**
   * Primary logging method that filters by configured log level before writing.
   * Only writes if the message level is >= the configured threshold.
   * @param logString The message to log
   * @param logObject Optional context object (Exception, SObject, or any serializable object)
   * @param logLevel The severity level for this log entry
   */
  global virtual void log(String logString, Object logObject, System.LoggingLevel logLevel) {
    if (logLevel.ordinal() >= this.currentLoggingLevel.ordinal()) {
      this.innerLog(logString, logObject, logLevel);
    }
  }

  /**
   * Persists any buffered log entries. Default implementation is a no-op since System.debug
   * writes immediately. Override in subclasses that buffer logs for batch persistence.
   */
  @SuppressWarnings('PMD.EmptyStatementBlock')
  global virtual void save() {
    // this is a no-op by default; sub-classes can opt in if they need to perform DML
  }

  /**
   * Updates logger configuration from control metadata. Default implementation returns this
   * unchanged; override if your logger needs control-specific settings.
   * @param control The RollupControl__mdt record with logging configuration
   * @return This logger instance for method chaining
   */
  public ILogger updateRollupControl(RollupControl__mdt control) {
    return this;
  }

  protected String getBaseLoggingMessage() {
    return 'Rollup ' + CURRENT_VERSION_NUMBER + ': ';
  }

  @SuppressWarnings('PMD.AvoidDebugStatements')
  protected virtual void innerLog(String logString, Object logObject, System.LoggingLevel logLevel) {
    String appended = this.getLogStringFromObject(logObject);
    List<String> messages = new List<String>{ logString };
    if (String.isNotBlank(appended)) {
      messages.add(appended);
    }
    // not all Rollup-generated exceptions come with stacktraces - this is a known issue, where using "new DMLException().getStackTraceString()"
    // works to re-create the stacktrace for all of the calling code. we'll prune away any mentions to this class to keep the log size down
    List<String> innerStacktraces = new DMLException().getStackTraceString().split('\n');
    while (innerStacktraces.isEmpty() == false && innerStacktraces.get(0).contains(RollupLogger.class.getName())) {
      innerStacktraces.remove(0);
    }
    messages.add(String.join(innerStacktraces, '\n'));
    System.debug(logLevel, this.getBaseLoggingMessage() + String.join(messages, '\n') + '\n');
  }

  protected RollupPluginParameter__mdt getLoggingLevelParameter() {
    return PLUGIN.getParameterInstance(this.getLoggingLevelDeveloperName());
  }

  protected virtual String getLoggingLevelDeveloperName() {
    return 'LoggingDebugLevel';
  }

  protected System.LoggingLevel getLogLevel() {
    System.LoggingLevel toReturn = FALLBACK_LOGGING_LEVEL;
    RollupPluginParameter__mdt loggingLevelParamater = this.getLoggingLevelParameter();
    String logLevelNameToSearch = loggingLevelParamater != null ? loggingLevelParamater.Value__c : toReturn.name();
    try {
      toReturn = System.LoggingLevel.valueOf(logLevelNameToSearch);
    } catch (Exception ex) {
      toReturn = FALLBACK_LOGGING_LEVEL;
    }
    return toReturn;
  }

  protected String getLogStringFromObject(Object logObject) {
    String appended = '';
    if (logObject == null) {
      return appended;
    } else if (logObject instanceof String) {
      appended = (String) logObject;
    } else if (logObject instanceof ToStringObject || logObject instanceof List<ToStringObject>) {
      appended = logObject.toString();
    } else if (logObject instanceof Exception) {
      Exception ex = (Exception) logObject;
      appended = ex.getMessage() + '\nInner stacktrace: ' + ex.getStackTraceString();
    } else if (logObject != null) {
      // not all objects implement toString, unfortunately,
      // and we don't want this to throw. Blob.toString throws,
      // for example - let's just serializePretty and move on
      appended = JSON.serializePretty(logObject, true);
    }
    return appended;
  }

  @SuppressWarnings('PMD.ApexCRUDViolation')
  private static ILogger getRollupLogger() {
    List<RollupPlugin__mdt> plugins = PLUGIN.getInstances();
    for (Integer index = plugins.size() - 1; index >= 0; index--) {
      RollupPlugin__mdt plugin = plugins[index];
      if (plugin.DeveloperName?.contains('Logger') == false) {
        plugins.remove(index);
      }
    }
    return combineLoggers(plugins);
  }

  private static ILogger combineLoggers(List<RollupPlugin__mdt> loggingPlugins) {
    List<ILogger> loggers = loggingPlugins.isEmpty() ? new List<ILogger>{ new RollupLogger() } : new List<ILogger>();
    Boolean hasUsedBaseLogger = false;
    List<String> potentialErrorMessages = new List<String>();

    for (RollupPlugin__mdt loggerPlugin : loggingPlugins) {
      ILogger rollLogger;
      if (loggerPlugin.DeveloperName == RollupLogger.class.getName() && hasUsedBaseLogger == false) {
        rollLogger = new RollupLogger();
        hasUsedBaseLogger = true;
      } else {
        try {
          rollLogger = (ILogger) Type.forName(loggerPlugin.DeveloperName).newInstance();
        } catch (Exception ex) {
          potentialErrorMessages.add('Cast to ILogger failed for: ' + loggerPlugin.DeveloperName);
          if (hasUsedBaseLogger == false) {
            rollLogger = new RollupLogger();
            hasUsedBaseLogger = true;
          }
        }
      }
      if (rollLogger != null) {
        loggers.add(rollLogger);
      }
    }

    ILogger combinedLogger = new CombinedLogger(loggers, Rollup.getDefaultControl());
    for (String potentialError : potentialErrorMessages) {
      combinedLogger.log(potentialError, System.LoggingLevel.WARN);
    }

    return combinedLogger;
  }

  private class CombinedLogger implements ILogger {
    private final List<ILogger> loggers;

    private RollupControl__mdt control;
    private Boolean hasDisabledMessageBeenLogged = false;

    public CombinedLogger(List<ILogger> loggers, RollupControl__mdt control) {
      this.loggers = loggers;
      this.control = control;
    }

    public void log(String logString, System.LoggingLevel logLevel) {
      this.log(logString, null, logLevel);
    }

    public void log(String logString, Object logObject, System.LoggingLevel logLevel) {
      if (this.control.IsRollupLoggingEnabled__c == false && this.hasDisabledMessageBeenLogged == false) {
        this.hasDisabledMessageBeenLogged = true;
        this.control.IsRollupLoggingEnabled__c = true;
        this.log('logging isn\'t enabled, further log messages paused unless otherwise re-activated', System.LoggingLevel.INFO);
        this.control.IsRollupLoggingEnabled__c = false;
      } else if (this.control.IsRollupLoggingEnabled__c) {
        for (ILogger logger : this.loggers) {
          logger.log(logString, logObject, logLevel);
        }
      }
    }

    public void save() {
      if (this.control.IsRollupLoggingEnabled__c != false) {
        for (ILogger logger : this.loggers) {
          logger.save();
        }
      }
    }

    public CombinedLogger updateRollupControl(RollupControl__mdt control) {
      String updateMessage = 'updating control record';
      if (control.IsRollupLoggingEnabled__c == true && this.control.IsRollupLoggingEnabled__c != true) {
        updateMessage = 'logging is now re-enabled, ' + updateMessage;
      }
      this.control = control;
      this.log(updateMessage, control, System.LoggingLevel.INFO);
      return this;
    }
  }
}
