/**
 * Service class for managing Rollup plugin configuration via custom metadata. Provides access
 * to RollupPlugin__mdt records which define extensibility points for custom loggers, dispatch handlers,
 * and other behavioral customizations. Supports test mocking to enable unit testing of plugin-dependent code.
 *
 * The plugin system enables:
 * - Custom logging implementations (e.g., Nebula Logger integration, custom object logging)
 * - Custom dispatch handlers for post-rollup actions
 * - Parameterized plugin configuration via RollupPluginParameter__mdt
 *
 * @see RollupLogger For the primary plugin consumer
 * @see RollupDispatch For callback plugin example
 * @group Apex Rollup
 */
public without sharing class RollupPlugin {
  @TestVisible
  private static List<RollupPlugin__mdt> pluginMocks = new List<RollupPlugin__mdt>();
  @TestVisible
  private static RollupPluginParameter__mdt parameterMock;

  /**
   * Retrieves a specific plugin configuration by DeveloperName or Id. Checks mock list first
   * for testability, then falls back to actual metadata query.
   * @param developerNameOrId The plugin's DeveloperName or Id
   * @return The matching RollupPlugin__mdt record, or null if not found
   */
  public RollupPlugin__mdt getInstance(String developerNameOrId) {
    for (RollupPlugin__mdt plugin : pluginMocks) {
      if (plugin.DeveloperName == developerNameOrId) {
        return plugin;
      }
    }
    return RollupPlugin__mdt.getInstance(developerNameOrId);
  }

  /**
   * Retrieves all configured plugins, combining actual metadata records with any test mocks.
   * Used during logger initialization to find all logging plugins.
   * @return List of all RollupPlugin__mdt records
   */
  public List<RollupPlugin__mdt> getInstances() {
    List<RollupPlugin__mdt> plugins = new List<RollupPlugin__mdt>();
    plugins.addAll(RollupPlugin__mdt.getAll().values());
    plugins.addAll(pluginMocks);
    return plugins;
  }

  /**
   * Retrieves a specific plugin parameter configuration. Parameters provide key-value
   * configuration for plugins (e.g., logging level thresholds, feature flags).
   * @param developerNameOrId The parameter's DeveloperName or Id
   * @return The matching RollupPluginParameter__mdt record
   */
  public RollupPluginParameter__mdt getParameterInstance(String developerNameOrId) {
    return parameterMock ?? RollupPluginParameter__mdt.getInstance(developerNameOrId);
  }

  /**
   * Retrieves all parameters associated with a specific plugin. Filters the global parameter
   * list to return only those linked to the specified plugin via the RollupPlugin__c relationship.
   * @param pluginId The Id of the parent RollupPlugin__mdt record
   * @return List of RollupPluginParameter__mdt records for this plugin
   */
  public List<RollupPluginParameter__mdt> getMatchingParameters(Id pluginId) {
    List<RollupPluginParameter__mdt> pluginParameters = new List<RollupPluginParameter__mdt>(RollupPluginParameter__mdt.getAll().values());
    if (parameterMock != null) {
      pluginParameters.add(parameterMock);
    }
    for (Integer index = pluginParameters.size() - 1; index >= 0; index--) {
      RollupPluginParameter__mdt pluginParameter = pluginParameters[index];
      if (pluginParameter.RollupPlugin__c != null && pluginParameter.RollupPlugin__c != pluginId) {
        pluginParameters.remove(index);
      }
    }
    return pluginParameters;
  }
}
