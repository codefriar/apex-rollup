/**
 * Utility class for field value initialization and schema operations within the Rollup framework.
 * Provides sensible default values for all Salesforce field types (crucial for rollup calculations when no
 * records exist), datetime normalization to handle SOQL's millisecond truncation quirk, and picklist ranking
 * logic for MIN/MAX operations where picklist ordering matters.
 *
 * Key capabilities:
 * - Type-aware default value generation (0 for numbers, epoch for dates, first active value for picklists)
 * - Datetime normalization removing milliseconds for consistent comparisons
 * - Picklist value ranking based on admin-defined order (not alphabetical)
 * - Schema utility methods for field lookup and describe operations
 *
 * Uses singleton pattern via the Current property for consistent access throughout the framework.
 *
 * @see RollupCalculator For usage in calculation logic
 * @group Apex Rollup
 */
@SuppressWarnings('PMD.CognitiveComplexity')
public virtual class RollupFieldInitializer {
  /** @description Unix epoch datetime (1970-01-01 00:00:00 GMT) used as default for datetime fields */
  public final Datetime defaultDateTime = Datetime.newInstanceGmt(1970, 1, 1);
  /** @description Maximum Long value (2^63 - 1) used as sentinel for MIN operations */
  public final Long maximumLongValue = (Math.pow(2, 63) - 1).longValue();
  /** @description Minimum Long value used as sentinel for MAX operations */
  public final Long minimumLongValue = this.maximumLongValue * -1;
  /** @description Maximum Integer value used as sentinel for MIN operations on picklists */
  public final Integer maximumIntegerValue = 2147483647;
  /** @description Minimum Integer value used as sentinel for MAX operations on picklists */
  public final Integer minimumIntegerValue = -2147483647 - 1;

  /** @description Singleton instance for consistent access across the framework */
  @SuppressWarnings('PMD.PropertyNamingConventions')
  public static final RollupFieldInitializer Current {
    get {
      Current = Current ?? new RollupFieldInitializer();
      return Current;
    }
    private set;
  }

  /**
   * Normalizes a Datetime by removing milliseconds. SOQL truncates milliseconds from returned
   * Datetime values, causing comparison failures between queried and programmatically created Datetimes.
   * This method ensures consistent comparison by stripping milliseconds from both sides.
   * @param dt The Datetime to normalize
   * @return A new Datetime with identical year/month/day/hour/minute/second but zero milliseconds
   */
  public Datetime getApexCompliantDatetime(Datetime dt) {
    // one of the worst things about SOQL is that Datetimes retrieved have the millisecond values truncated
    return Datetime.newInstanceGmt(dt.yearGmt(), dt.monthGmt(), dt.dayGmt(), dt.hourGmt(), dt.minuteGmt(), dt.secondGmt());
  }

  /**
   * Returns an appropriate default value for the given field type. Used to initialize rollup
   * fields when no calc items exist (e.g., all child records deleted). Returns the field's defined default
   * if one exists, otherwise returns a type-appropriate default: 0 for numbers, epoch for dates, empty string
   * for text, first active value for picklists, false for booleans.
   * @param field The SObjectField to get a default value for
   * @return A type-appropriate default value
   * @throws IllegalArgumentException If the field type is not supported for rollup operations
   */
  public virtual Object getDefaultValue(Schema.SObjectField field) {
    DescribeFieldResult fieldDescribe = field.getDescribe();
    if (fieldDescribe.isDefaultedOnCreate() && fieldDescribe.getDefaultValue() != null) {
      return fieldDescribe.getDefaultValue();
    }
    // not surprisingly, "getDefaultValue" on the DescribeFieldResult returns null for fields without default values
    // this is a shame - all types *should* have default values. Instead, we have the privilege of getting to initialize them
    Object initializedDefault;
    switch on fieldDescribe.getType() {
      when CURRENCY, DOUBLE, LONG, PERCENT {
        initializedDefault = 0.0;
      }
      when INTEGER {
        initializedDefault = 0;
      }
      when DATETIME {
        initializedDefault = this.defaultDateTime;
      }
      when DATE {
        initializedDefault = this.defaultDateTime.dateGmt();
      }
      when TIME {
        initializedDefault = this.defaultDateTime.timeGmt();
      }
      when STRING, ID, TEXTAREA, URL, PHONE, EMAIL, REFERENCE, COMBOBOX {
        initializedDefault = '';
      }
      when PICKLIST, MULTIPICKLIST {
        initializedDefault = new PicklistController(fieldDescribe).getDefaultValue(field);
      }
      when BOOLEAN {
        initializedDefault = false;
      }
      when else {
        throw new IllegalArgumentException('Field: ' + field + ' of type: ' + fieldDescribe.getType().name() + ' specified invalid for rollup operation');
      }
    }
    return initializedDefault;
  }

  /**
   * Retrieves an SObjectField token by name from a field map. Handles the quirk where CMDT
   * Entity Definition fields store relationship names without the 'Id' suffix (e.g., 'Account' instead
   * of 'AccountId'), so this method tries both the provided name and name + 'Id'.
   * @param fieldNameToField Map of field API names to SObjectField tokens
   * @param desiredField The field name to look up
   * @return The matching SObjectField token, or null if not found
   */
  public SObjectField getSObjectFieldByName(Map<String, Schema.SObjectField> fieldNameToField, String desiredField) {
    if (fieldNameToField.containsKey(desiredField)) {
      return fieldNameToField.get(desiredField);
    } else if (fieldNameToField.containsKey(desiredField + 'Id')) {
      // for lookup fields, CMDT field-level definition fields store the field name, which is outrageous
      return fieldNameToField.get(desiredField + 'Id');
    }
    return null;
  }

  /**
   * Retrieves the DescribeSObjectResult for a given SObject name using deferred describe
   * to minimize governor limit consumption.
   * @param sObjectName The API name of the SObject (e.g., 'Account', 'Custom_Object__c')
   * @return The DescribeSObjectResult for the specified object
   */
  public Schema.DescribeSObjectResult getDescribeFromName(String sObjectName) {
    return Schema.describeSObjects(new List<String>{ sObjectName }, SObjectDescribeOptions.DEFERRED)[0];
  }

  /**
   * Creates an Id-to-SObject map that safely handles null Ids by filtering them out.
   * The standard Map<Id, SObject> constructor throws an exception if any record has a null Id;
   * this method iterates manually to avoid that issue.
   * @param records List of SObject records to map
   * @return Map of record Id to SObject, excluding records with null Ids
   */
  public Map<Id, SObject> createSafeMap(List<SObject> records) {
    Map<Id, SObject> idToRecord = new Map<Id, SObject>();
    for (SObject record : records) {
      idToRecord.put(record.Id, record);
    }
    return idToRecord;
  }

  /**
   * Specialized controller for picklist field operations including default value retrieval,
   * rank-based comparisons for MIN/MAX operations, and sorting. Picklist MIN/MAX is determined by the
   * admin-defined picklist order (as shown in Setup), not alphabetical order. This class maintains a
   * rank map based on picklist entry position for accurate comparisons.
   */
  public class PicklistController extends RollupFieldInitializer {
    private final Boolean isPicklist;
    private final Boolean isMultiSelectPicklist;
    private List<String> activeVals;
    private Map<String, Integer> picklistToRank;

    /**
     * Constructs a PicklistController for the specified field. Builds a rank map where each
     * picklist value is assigned its position index (0-based) in the picklist definition. Inactive values
     * receive -1 as a sentinel. This ranking enables correct MIN/MAX behavior per Salesforce's picklist
     * ordering semantics.
     * @param fieldDescribe The field describe result for a picklist or multi-select picklist field
     */
    public PicklistController(Schema.DescribeFieldResult fieldDescribe) {
      super();
      Schema.DisplayType fieldType = fieldDescribe?.getType();
      this.isPicklist = fieldType == DisplayType.MULTIPICKLIST || fieldType == DisplayType.PICKLIST;
      this.isMultiSelectPicklist = fieldType == DisplayType.MULTIPICKLIST;

      if (this.isPicklist) {
        this.picklistToRank = new Map<String, Integer>();
        this.activeVals = new List<String>();

        /**
         * not obvious (or even documented) but getPicklistValues ALWAYS returns
         * the picklist values in order of their appearance in the UI, which is also
         * their alleged "rank" - for example, MAX/MIN on picklists is done by which order they appear
         * in the list, instead of by the actual text values
         * */
        List<Schema.PicklistEntry> picklistVals = fieldDescribe.getPicklistValues();

        for (Integer index = 0; index < picklistVals.size(); index++) {
          Schema.PicklistEntry picklist = picklistVals[index];
          this.doBookkeepingOnPicklist(picklist);
          // all inactive values will use -1 as a sentinel value
          picklistToRank.put(picklist.getValue(), picklist.isActive() ? index : -1);
        }
      }
    }

    private void doBookkeepingOnPicklist(Schema.PicklistEntry picklist) {
      if (picklist.isDefaultValue() && this.activeVals.isEmpty()) {
        this.activeVals.add(picklist.getValue());
      } else if (picklist.isActive()) {
        this.activeVals.add(picklist.getValue());
      }
    }

    /**
     * Returns the first active picklist value as the default, or delegates to the parent
     * class for non-picklist fields.
     * @param field The field to get the default value for
     * @return The first active picklist value, or parent class default for non-picklist fields
     */
    public override Object getDefaultValue(Schema.SObjectField field) {
      return this.isPicklist == false ? super.getDefaultValue(field) : this.activeVals[0];
    }

    /**
     * Indicates whether this controller is managing a picklist field.
     * @return True if the field is a picklist or multi-select picklist
     */
    public Boolean isPicklist() {
      return this.isPicklist;
    }

    /**
     * Indicates whether this controller is managing a multi-select picklist field.
     * @return True if the field is a multi-select picklist
     */
    public Boolean isMultiSelectPicklist() {
      return this.isMultiSelectPicklist;
    }

    /**
     * Compares two picklist values for MIN/MAX operations using rank-based ordering.
     * Returns true if picklistVal should replace comparisonValue based on the operation type.
     * For unknown values not in the picklist, falls back to string comparison.
     * @param picklistVal The candidate value to evaluate
     * @param comparisonValue The current value being compared against
     * @param operation The rollup operation (MIN or MAX variant)
     * @return True if picklistVal should replace comparisonValue
     */
    public Boolean isTrueFor(String picklistVal, String comparisonValue, Rollup.Op operation) {
      if (this.isPicklist == false) {
        return false;
      }
      Boolean isMin = this.isMin(operation);
      if (String.isNotBlank(comparisonValue) && this.picklistToRank.containsKey(picklistVal) == false) {
        return isMin ? picklistVal < comparisonValue : picklistVal > comparisonValue;
      }
      Integer rank = this.getRank(picklistVal, operation);
      Integer comparisonRank = this.getRank(comparisonValue, operation);
      return isMin ? rank < comparisonRank : rank > comparisonRank;
    }

    /**
     * Returns the rank (position index) of a picklist value. Unknown values receive
     * a sentinel value appropriate for the operation (max for MIN ops, min for MAX ops).
     * @param picklistVal The picklist value to get the rank for
     * @param operation The rollup operation to determine sentinel value
     * @return The rank index, or sentinel value if not found
     */
    public Integer getRank(String picklistVal, Rollup.Op operation) {
      return this.picklistToRank?.containsKey(picklistVal) == true ? this.picklistToRank.get(picklistVal) : this.getSentinelValue(operation);
    }

    /**
     * Sorts a list of picklist values by their admin-defined order (not alphabetically).
     * @param picklistValues The list of values to sort in place
     */
    public void sort(List<String> picklistValues) {
      picklistValues.sort(new PicklistSorter(this));
    }

    private Boolean isMin(Rollup.Op operation) {
      return operation.name().contains(Rollup.Op.MIN.name());
    }

    private Integer getSentinelValue(Rollup.Op operation) {
      return this.isMin(operation) ? this.maximumIntegerValue : this.minimumIntegerValue;
    }
  }

  public class StringSorter implements System.Comparator<String> {
    public Integer compare(String first, String second) {
      return first.compareTo(second);
    }
  }

  private class PicklistSorter implements System.Comparator<String> {
    private final PicklistController picklistController;
    private final System.Comparator<String> stringSorter = new StringSorter();

    public PicklistSorter(PicklistController picklistController) {
      this.picklistController = picklistController;
    }

    public Integer compare(String firstVal, String secondVal) {
      Integer sortValue = 0;
      Integer firstRank = this.picklistController.getRank(firstVal, Rollup.Op.FIRST);
      Integer secondRank = this.picklistController.getRank(secondVal, Rollup.Op.FIRST);
      if (firstRank == this.picklistController.minimumIntegerValue || secondRank == this.picklistController.minimumIntegerValue) {
        // fall back to standard sorting if sentinel value is returned
        sortValue = this.stringSorter.compare(firstVal, secondVal);
      } else if (firstRank > secondRank) {
        sortValue = 1;
      } else if (firstRank < secondRank) {
        sortValue = -1;
      }
      return sortValue;
    }
  }
}
