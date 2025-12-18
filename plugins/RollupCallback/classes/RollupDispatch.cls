/**
 * @description Plugin that publishes a platform event (RollupCallbackEvent__e) after parent records are updated
 * by a rollup operation. Enables downstream automation to react to rollup completions, such as triggering
 * additional calculations, notifications, or integrations. The event includes the comma-separated list of
 * updated parent record Ids.
 *
 * Configuration:
 * - Enable via RollupPluginParameter__mdt named 'ShouldFirePlatformEvent' with Value__c = 'true'
 * - Subscribe to RollupCallbackEvent__e to receive notifications
 *
 * Use cases:
 * - Chain rollup operations across object hierarchies
 * - Trigger external system notifications after rollup completion
 * - Audit logging of rollup updates
 *
 * @see RollupSObjectUpdater.IDispatcher For the dispatcher interface
 * @see RollupCallbackEvent__e For the platform event definition
 * @group Apex Rollup Plugins
 */
public class RollupDispatch implements RollupSObjectUpdater.IDispatcher {
  @TestVisible
  private static Boolean wasCalled = false;
  @TestVisible
  private static String platformEventOverride;

  @SuppressWarnings('PMD.PropertyNamingConventions')
  private static String PLATFORM_EVENT_BOOLEAN_STRING {
    get {
      if (PLATFORM_EVENT_BOOLEAN_STRING == null) {
        PLATFORM_EVENT_BOOLEAN_STRING = platformEventOverride ?? RollupPluginParameter__mdt.getInstance('ShouldFirePlatformEvent')?.Value__c ??
          String.valueOf(false);
      }
      return PLATFORM_EVENT_BOOLEAN_STRING;
    }
    set;
  }

  /**
   * @description Called after parent records are updated. If enabled via configuration, publishes a
   * RollupCallbackEvent__e containing the updated record Ids for downstream processing.
   * @param records The list of parent SObject records that were updated by the rollup
   */
  public void dispatch(List<SObject> records) {
    if (Boolean.valueOf(PLATFORM_EVENT_BOOLEAN_STRING)) {
      wasCalled = true;
      List<String> updatedRecordIds = new List<String>();
      for (SObject record : records) {
        updatedRecordIds.add(record.Id);
      }

      RollupCallbackEvent__e callbackEvent = new RollupCallbackEvent__e(RecordIds__c = String.join(updatedRecordIds, ','));
      EventBus.publish(callbackEvent);
    }
  }
}
