/**
 * @description State management system for batch rollup operations that avoids Database.Stateful limitations.
 * Persists intermediate calculation state to the RollupState__c custom object between batch executions,
 * enabling stateful rollup processing without the serialization overhead and governor limit impacts of
 * Database.Stateful. Supports multiple state types (AverageInfo, MostInfo, GenericInfo, SObjectInfo)
 * for different rollup operation requirements.
 *
 * Key design decisions:
 * - Custom object storage avoids Database.Stateful's serialization limits and heap issues
 * - DataWeave-based deserialization for efficient JSON-to-Apex conversion
 * - Chunked state storage across multiple RelatedRecordKeys fields to handle large rollup sets
 * - Automatic cleanup via Queueable/Finalizer pattern after rollup completion
 *
 * The state lifecycle:
 * 1. loadState() - Retrieves prior state from RollupState__c at batch start
 * 2. getState()/setState() - Accesses and updates in-memory state during processing
 * 3. commitState() - Persists state to RollupState__c between batch chunks
 * 4. cleanup() - Deletes all RollupState__c records after rollup completion
 *
 * @see RollupAsyncProcessor For batch processing integration
 * @see RollupCalculator For state consumption during calculations
 * @group Apex Rollup
 */
public without sharing virtual class RollupState implements System.Queueable, System.Finalizer, RollupLogger.ToStringObject {
  /** @description Composite key combining record Id and metadata key */
  protected transient String key;
  /** @description Length of the original record key (before metadata key appended) */
  protected transient Integer keyLength;
  /** @description The parent record Id this state relates to */
  protected transient String recordId;
  /** @description Fully qualified type name for deserialization */
  protected transient String typeName;
  /** @description Job Ids for state cleanup tracking */
  protected final Set<String> jobIds = new Set<String>();

  private Long commitCount = 1;
  private Set<Id> statefulPreviouslyRetrievedStateIds = new Set<Id>();

  /** @description Maximum characters for Body0__c long text area field */
  @TestVisible
  private static Integer maxBodyLength = 131072;
  /** @description Maximum characters for each RelatedRecordKeys field (255 char text) */
  @TestVisible
  private static Integer maxRelatedKeysLength = 255;
  /** @description Strategy for serializing/deserializing state (DataWeave or JSON) */
  @TestVisible
  private static SerializationStrategy serializationStrategy = new DataweaveSerializationStrategy();

  @SuppressWarnings('PMD.PropertyNamingConventions')
  private static final Map<String, RollupState> KEY_TO_STATE {
    get {
      KEY_TO_STATE = KEY_TO_STATE ?? new Map<String, RollupState>();
      return KEY_TO_STATE;
    }
    set;
  }

  @SuppressWarnings('PMD.PropertyNamingConventions')
  private static final Map<String, List<RollupState__c>> CACHED_STATES {
    get {
      CACHED_STATES = CACHED_STATES ?? new Map<String, List<RollupState__c>>();
      return CACHED_STATES;
    }
    set;
  }

  /**
   * @description Configures the serialization strategy for state persistence. DataWeave is preferred
   * for performance; JSON is available as a fallback.
   * @param serializationStrategy The serialization implementation to use
   */
  public void setSerializationStrategy(SerializationStrategy serializationStrategy) {
    RollupState.serializationStrategy = serializationStrategy;
  }

  /**
   * @description Retrieves or creates state for a specific record key and rollup metadata combination.
   * The key is typically a parent record Id; combined with metadata, it creates a unique identifier
   * for each rollup operation's state per parent record.
   * @param key The parent record Id or other unique identifier
   * @param meta The Rollup__mdt configuration for this operation
   * @param initializingType The RollupState subclass to instantiate if no state exists
   * @return Existing or newly created state instance for this key/metadata combination
   */
  public RollupState getState(String key, Rollup__mdt meta, Type initializingType) {
    String trueKey = (key + getMetadataKey(meta));
    RollupState possibleState = KEY_TO_STATE.get(trueKey);
    if (possibleState == null) {
      possibleState = (RollupState) initializingType.newInstance();
      possibleState.recordId = key;
      // we only pass the original key's length because even though state is keyed by the trueKey
      // the original key's length gives us access to the record key when committing state values to the
      // various RelatedRecordKey{n}__c fields
      this.setState(trueKey, key.length(), possibleState);
    }
    return possibleState;
  }

  /**
   * @description Stores state in the in-memory cache. Called internally by getState() and during
   * state restoration from persisted records.
   * @param key The composite key for state lookup
   * @param keyLength Length of the record key portion (for RelatedRecordKeys field population)
   * @param state The state instance to cache
   */
  public void setState(String key, Integer keyLength, RollupState state) {
    state.commitCount = this.commitCount;
    state.key = key;
    state.keyLength = keyLength;
    KEY_TO_STATE.put(state.key, state);
  }

  public override String toString() {
    return '' + this.getUntypedState();
  }

  public virtual Map<String, Object> getUntypedState() {
    throw new SerializationException('Should not make it here');
  }

  public virtual Boolean isEmpty() {
    throw new IllegalArgumentException('Should not make it here');
  }

  public virtual void setup(Map<String, Object> untypedState) {
    throw new System.SerializationException('Should not make it here');
  }

  /**
   * @description State container for AVERAGE and COUNT_DISTINCT operations. Tracks running totals
   * (numerator/denominator) and distinct values across batch boundaries. The average is computed
   * as numerator/denominator at rollup completion.
   */
  public class AverageInfo extends RollupState {
    /** @description Running sum of values for average calculation */
    public Decimal denominator = 0;
    /** @description Count of records processed for average calculation */
    public Decimal numerator = 0;
    /** @description Set of unique values encountered for COUNT_DISTINCT operations */
    public Set<Object> distinctNumerators = new Set<Object>();

    /**
     * @description Adds a value to the running calculation. Increments both the sum and count,
     * and tracks the value for distinct counting.
     * @param value The numeric value to include in the calculation
     */
    public void increment(Decimal value) {
      this.numerator += value;
      this.denominator++;
      this.distinctNumerators.add(value);
    }

    public override Boolean isEmpty() {
      return this.denominator == 0;
    }

    public override Map<String, Object> getUntypedState() {
      return new Map<String, Object>{
        'denominator' => this.denominator,
        'distinctNumerators' => this.distinctNumerators,
        'key' => this.key,
        'keyLength' => this.keyLength,
        'numerator' => this.numerator,
        'typeName' => AverageInfo.class.getName()
      };
    }

    public override void setup(Map<String, Object> untypedState) {
      this.denominator = (Decimal) untypedState.get('denominator');
      this.distinctNumerators.addAll((List<Object>) untypedState.get('distinctNumerators'));
      this.key = (String) untypedState.get('key');
      this.keyLength = (Integer) untypedState.get('keyLength');
      this.numerator = (Decimal) untypedState.get('numerator');
    }
  }

  /**
   * @description State container for MOST (mode) operations. Tracks the value that appears most frequently
   * and its occurrence count. Used to find the most common value in a set of records.
   */
  public class MostInfo extends GenericInfo {
    /** @description Count of occurrences for the current winning value */
    public Integer largestPointCounter = -1;

    /**
     * @description Updates the winning value and its count when a new value exceeds the current leader.
     * @param newWinner The occurrence count of the new winning value
     * @param val The new winning value
     */
    public void setValues(Integer newWinner, Object val) {
      this.largestPointCounter = newWinner;
      this.value = val;
    }

    public override Boolean isEmpty() {
      return this.largestPointCounter == -1;
    }

    public override Map<String, Object> getUntypedState() {
      return new Map<String, Object>{
        'largestPointCounter' => this.largestPointCounter,
        'key' => this.key,
        'keyLength' => this.keyLength,
        'typeName' => MostInfo.class.getName(),
        'value' => this.value
      };
    }

    public override void setup(Map<String, Object> untypedState) {
      super.setup(untypedState);
      this.largestPointCounter = (Integer) untypedState.get('largestPointCounter');
    }
  }

  /**
   * @description State container for FIRST/LAST operations that need to track the full SObject record.
   * Used when the rollup field comes from a related record and the entire record context must be preserved.
   */
  public class SObjectInfo extends RollupState {
    /** @description The SObject record being tracked */
    public SObject item;

    /**
     * @description Sets the tracked SObject record.
     * @param item The SObject to track
     */
    public void setItem(SObject item) {
      this.item = item;
    }

    public override Boolean isEmpty() {
      return this.item == null;
    }

    public override Map<String, Object> getUntypedState() {
      return new Map<String, Object>{
        'item' => RollupState.serializationStrategy.getType() == JSONSerializationStrategy.class
          ? (Object) this.item
          : (Object) this.item.getPopulatedFieldsAsMap(),
        'itemType' => '' + this.item.getSObjectType(),
        'key' => this.key,
        'keyLength' => this.keyLength,
        'typeName' => SObjectInfo.class.getName()
      };
    }

    public override void setup(Map<String, Object> untypedState) {
      this.item = (SObject) JSON.deserialize(JSON.serialize(untypedState.get('item')), SObject.class);
      this.key = (String) untypedState.get('key');
      this.keyLength = this.key.length();
    }
  }

  /**
   * In theory, GenericInfo is overkill for what it does - any rollup operation that can be reduced to a single value
   * COULD simply take whatever the current value on the parent record is as the source of truth. That being said, the
   * prior implementation with `Database.Stateful` shamefully split the logic between `RollupAsyncProcessor` and `RollupState`
   * when managing prior values, and duplicating _some_ data here (as far as what eventually gets persisted to the database as `RollupState__c` records)
   * seems vastly preferable as opposed to the logic living in two different places
   */
  public virtual class GenericInfo extends RollupState {
    public Object value;

    public void setValue(Object newValue) {
      this.value = newValue;
    }

    public virtual override Boolean isEmpty() {
      return this.value == null;
    }

    public virtual override Map<String, Object> getUntypedState() {
      return new Map<String, Object>{ 'key' => this.key, 'keyLength' => this.keyLength, 'typeName' => GenericInfo.class.getName(), 'value' => this.value };
    }

    public virtual override void setup(Map<String, Object> untypedState) {
      this.value = untypedState.get('value');
      this.key = (String) untypedState.get('key');
      this.keyLength = this.key.length();
    }
  }

  /**
   * @description Loads previously persisted state from RollupState__c records into memory. Called at the
   * start of each batch execution to restore state from prior batches. Deserializes the JSON body and
   * populates the in-memory state cache. Tracks loaded record Ids to prevent duplicate processing.
   * @param jobId The async job Id for state isolation between concurrent rollups
   * @param relatedRecordKeys Set of parent record Ids to filter state retrieval
   */
  public void loadState(String jobId, Set<String> relatedRecordKeys) {
    this.jobIds.add(jobId);
    List<RollupState__c> matchingState = this.loadOrRetrieveCachedState(jobId, relatedRecordKeys);
    for (RollupState__c state : matchingState) {
      if (this.statefulPreviouslyRetrievedStateIds.contains(state.Id) == false && state.Body0__c != null) {
        List<Object> localUncastStates = RollupState.serializationStrategy.deserializeToState(state.Body0__c);
        for (Object uncastState : localUncastStates) {
          RollupState castState = (RollupState) uncastState;
          KEY_TO_STATE.put(castState.key, castState);
        }
      }
      this.statefulPreviouslyRetrievedStateIds.add(state.Id);
    }
  }

  /**
   * @description Persists the current in-memory state to RollupState__c records. Called at the end of
   * each batch execution to save intermediate results for the next batch. Handles chunking across
   * multiple records when state exceeds field size limits.
   * @param jobId The async job Id for state association
   */
  public void commitState(String jobId) {
    this.jobIds.add(jobId);
    this.populateRelatedRecordStates(jobId);
  }

  /**
   * @description Initiates asynchronous cleanup of all RollupState__c records for the given job Ids.
   * Called after rollup completion to remove temporary state storage. Uses Queueable with Finalizer
   * to handle large volumes of state records.
   * @param jobIds Set of job Ids whose state records should be deleted
   * @return The Queueable job Id for the cleanup operation
   */
  public String cleanup(Set<String> jobIds) {
    this.jobIds.addAll(jobIds);
    RollupLogger.Instance.log('about to clean up rollup state', this.jobIds, System.LoggingLevel.INFO);
    return System.enqueueJob(this);
  }

  @SuppressWarnings('PMD.ApexCRUDViolation')
  public void execute(System.QueueableContext qc) {
    System.attachFinalizer(this);
    List<RollupState__c> matchingState = [
      SELECT Id
      FROM RollupState__c
      WHERE RelatedJobId__c = :this.jobIds
      LIMIT :Limits.getLimitDmlRows() - Limits.getDmlRows()
    ];
    Database.delete(matchingState, false, System.AccessLevel.SYSTEM_MODE);
  }

  public void execute(System.FinalizerContext fc) {
    if ([SELECT COUNT() FROM RollupState__c WHERE Id = :this.jobIds LIMIT 1] > 0) {
      new RollupState().cleanup(this.jobIds);
    }
  }

  @SuppressWarnings('PMD.ApexCRUDViolation')
  private List<RollupState__c> loadOrRetrieveCachedState(String jobId, Set<String> relatedRecordKeys) {
    String cacheKey = String.join(relatedRecordKeys, '');
    List<RollupState__c> states = CACHED_STATES.get(cacheKey);
    if (relatedRecordKeys.isEmpty() || states != null) {
      RollupLogger.Instance.log('Returning state from cache for record size: ' + (states?.size() ?? 0), System.LoggingLevel.DEBUG);
      return new List<RollupState__c>();
    }
    List<String> quotedRecordKeys = new List<String>();
    for (String recordKey : relatedRecordKeys) {
      quotedRecordKeys.add('%' + recordKey + '%');
    }
    states = [
      SELECT Id, Body0__c
      FROM RollupState__c
      WHERE
        (RelatedRecordKeys0__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys1__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys2__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys3__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys4__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys5__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys6__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys7__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys8__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys9__c LIKE :quotedRecordKeys
        OR RelatedRecordKeys10__c LIKE :quotedRecordKeys)
        AND RelatedJobId__c = :jobId
        AND IsDeleted = FALSE
        AND Id != :this.statefulPreviouslyRetrievedStateIds
      ORDER BY CreatedDate DESC
    ];
    CACHED_STATES.put(cacheKey, states);
    Database.delete(states, false, System.AccessLevel.SYSTEM_MODE);
    try {
      if (states.isEmpty() == false) {
        Database.emptyRecycleBin(states);
      }
    } catch (Exception ex) {
      RollupLogger.Instance.log('Error hard deleting state, continuing execution', ex, System.LoggingLevel.WARN);
    }
    return states;
  }

  @SuppressWarnings('PMD.ApexCRUDViolation,PMD.AvoidDeeplyNestedIfStmts')
  private void populateRelatedRecordStates(String jobId) {
    RollupState__c currentStateToInsert = new RollupState__c(RelatedJobId__c = jobId);
    List<RollupState__c> statesToInsert = new List<RollupState__c>{ currentStateToInsert };
    Integer numberOfStates = KEY_TO_STATE.size();

    // mutable tracking fields
    Set<String> allRecordKeys = new Set<String>();
    Integer relatedRecordKeyLength = 0;
    Integer currentRelatedRecordFieldIndex = 0;
    Double currentLength = 0;
    Integer stateCounter = 0;
    List<Map<String, Object>> untypedStates = new List<Map<String, Object>>();
    Schema.SObjectField relatedKeysFieldToken = RollupState__c.RelatedRecordKeys0__c;
    for (String key : KEY_TO_STATE.keySet()) {
      RollupState state = KEY_TO_STATE.get(key);
      stateCounter++;
      if (state.isEmpty()) {
        continue;
      }

      String recordKey = key.substring(0, state.keyLength);
      String currentRelatedKeys = (String) currentStateToInsert.get(relatedKeysFieldToken);

      if (allRecordKeys.contains(recordKey) == false) {
        allRecordKeys.add(recordKey);
        String newKeys = currentRelatedKeys != null ? currentRelatedKeys + ',' + recordKey : recordKey;
        currentStateToInsert.put(relatedKeysFieldToken, newKeys);
        relatedRecordKeyLength = newKeys.length();
      }
      Map<String, Object> untypedState = state.getUntypedState();
      // 1.1 is enough of a buffer for the serialized version with quoted characters and the + 1 accounts for commas as the delimiter between state objects
      currentLength += (untypedState.toString().length() * 1.1) + 1;
      untypedStates.add(untypedState);

      // if the next key would overflow the current related keys field, either step to the new field
      // or add a new state record to the list if we're out of key fields
      if (relatedRecordKeyLength + state.keyLength + 1 > maxRelatedKeysLength) {
        currentRelatedRecordFieldIndex++;
        TokenSentinel sentinel = getRelatedRecordKeySentinel(currentRelatedRecordFieldIndex);
        Boolean isMissingCurrentKey = allRecordKeys.contains(recordKey) == false;
        if (relatedKeysFieldToken == RollupState__c.RelatedRecordKeys10__c) {
          if (isMissingCurrentKey) {
            untypedStates.remove(untypedStates.size() - 1);
          }
          allRecordKeys = new Set<String>();
          currentStateToInsert.Body0__c = getJoinedBody(untypedStates);
          relatedKeysFieldToken = RollupState__c.RelatedRecordKeys0__c;
          currentRelatedRecordFieldIndex = 0;
          currentLength = 0;
          currentStateToInsert = new RollupState__c(RelatedJobId__c = jobId);
          statesToInsert.add(currentStateToInsert);
          if (isMissingCurrentKey) {
            untypedStates.add(untypedState);
            currentStateToInsert.RelatedRecordKeys0__c = recordKey;
            allRecordKeys.add(recordKey);
            relatedRecordKeyLength = state.keyLength;
          }
        } else {
          relatedKeysFieldToken = sentinel.token;
          relatedRecordKeyLength = 0;
        }
      }
      // There's some undocumented soft limit to the amount of data that can be stored in a long text area
      // so we use another slight buffer to avoid running into the actual limit
      else if ((currentLength + 1100) >= maxBodyLength) {
        allRecordKeys = new Set<String>();
        currentStateToInsert.Body0__c = getJoinedBody(untypedStates);
        currentRelatedRecordFieldIndex = 0;
        relatedRecordKeyLength = 0;
        relatedKeysFieldToken = RollupState__c.RelatedRecordKeys0__c;
        currentStateToInsert = new RollupState__c(RelatedJobId__c = jobId);
        statesToInsert.add(currentStateToInsert);
        currentLength = 0;
      }
    }
    if (stateCounter == numberOfStates && untypedStates.isEmpty() == false) {
      currentStateToInsert.Body0__c = getJoinedBody(untypedStates);
    }

    for (Integer reverseIndex = statesToInsert.size() - 1; reverseIndex >= 0; reverseIndex--) {
      RollupState__c state = statesToInsert[reverseIndex];
      if (state.Body0__c == null) {
        statesToInsert.remove(reverseIndex);
      }
    }

    Database.insert(statesToInsert, System.AccessLevel.SYSTEM_MODE);
    RollupLogger.Instance.log(
      'Finished inserting ' + statesToInsert.size() + ' states (for batch number: ' + this.commitCount + ')',
      System.LoggingLevel.DEBUG
    );
    KEY_TO_STATE.clear();
    CACHED_STATES.clear();
    this.commitCount++;
  }

  private class TokenSentinel implements RollupLogger.ToStringObject {
    public Boolean shouldReset = false;
    public Schema.SObjectField token;
    public Integer currentTokenIndex;

    public TokenSentinel(Integer currentTokenIndex) {
      this.currentTokenIndex = currentTokenIndex;
    }
  }

  private static TokenSentinel getRelatedRecordKeySentinel(Integer currentIndex) {
    TokenSentinel sentinel = new TokenSentinel(currentIndex);

    switch on currentIndex {
      when 0 {
        sentinel.token = RollupState__c.RelatedRecordKeys0__c;
      }
      when 1 {
        sentinel.token = RollupState__c.RelatedRecordKeys1__c;
      }
      when 2 {
        sentinel.token = RollupState__c.RelatedRecordKeys2__c;
      }
      when 3 {
        sentinel.token = RollupState__c.RelatedRecordKeys3__c;
      }
      when 4 {
        sentinel.token = RollupState__c.RelatedRecordKeys4__c;
      }
      when 5 {
        sentinel.token = RollupState__c.RelatedRecordKeys5__c;
      }
      when 6 {
        sentinel.token = RollupState__c.RelatedRecordKeys6__c;
      }
      when 7 {
        sentinel.token = RollupState__c.RelatedRecordKeys7__c;
      }
      when 8 {
        sentinel.token = RollupState__c.RelatedRecordKeys8__c;
      }
      when 9 {
        sentinel.token = RollupState__c.RelatedRecordKeys9__c;
      }
      when 10 {
        sentinel.token = RollupState__c.RelatedRecordKeys10__c;
      }
      when else {
        sentinel.token = RollupState__c.RelatedRecordKeys0__c;
        sentinel.shouldReset = true;
      }
    }
    return sentinel;
  }

  private static String getJoinedBody(List<Map<String, Object>> untypedStates) {
    String joinedBody = JSON.serialize(untypedStates).removeStart('[').removeEnd(']');
    untypedStates.clear();
    return joinedBody;
  }

  private static String getMetadataKey(Rollup__mdt meta) {
    return meta.DeveloperName ?? (meta.RollupOperation__c + meta.LookupObject__c + meta.RollupFieldOnLookupObject__c + meta.LookupFieldOnLookupObject__c);
  }

  /**
   * @description Abstract base class for state serialization strategies. Supports multiple serialization
   * approaches (DataWeave, JSON) to balance performance and compatibility. DataWeave is preferred for
   * its superior performance but requires the DataWeave feature to be enabled.
   */
  public abstract class SerializationStrategy {
    /**
     * @description Returns the implementing class type for runtime type checking.
     * @return The Class type of this strategy implementation
     */
    public abstract System.Type getType();

    /**
     * @description Deserializes a JSON string into a list of RollupState objects.
     * Wraps the input in array brackets for consistent parsing.
     * @param json The serialized state JSON from Body0__c field
     * @return List of deserialized RollupState objects
     */
    public List<Object> deserializeToState(String json) {
      return this.deserialize('[' + json + ']');
    }

    protected abstract List<Object> deserialize(String input);
  }

  /**
   * @description DataWeave-based serialization strategy offering superior performance for state
   * deserialization. Uses a compiled DataWeave script to efficiently convert JSON to Apex objects.
   * This is the preferred strategy when DataWeave is available in the org.
   */
  public class DataweaveSerializationStrategy extends SerializationStrategy {
    public override System.Type getType() {
      return DataweaveSerializationStrategy.class;
    }

    protected override List<Object> deserialize(String input) {
      return (List<Object>) new DataWeaveScriptResource.jsonToRollupState().execute(new Map<String, Object>{ 'records' => input }).getValue();
    }
  }

  /**
   * @description JSON-based serialization strategy as a fallback when DataWeave is unavailable.
   * Uses standard Apex JSON deserialization with dynamic type instantiation based on the
   * typeName field stored in each state object.
   */
  public class JSONSerializationStrategy extends SerializationStrategy {
    public override System.Type getType() {
      return JSONSerializationStrategy.class;
    }

    protected override List<Object> deserialize(String input) {
      List<Object> untypedStates = (List<Object>) JSON.deserializeUntyped(input);
      List<Object> states = new List<Object>();
      for (Object untypedState : untypedStates) {
        Map<String, Object> untypedStateMap = (Map<String, Object>) untypedState;
        RollupState state = (RollupState) Type.forName('' + untypedStateMap.get('typeName')).newInstance();
        state.setup(untypedStateMap);
        states.add(state);
      }
      return states;
    }
  }
}
