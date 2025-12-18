/**
 * @description Singleton utility class responsible for dynamically constructing SOQL queries for rollup operations.
 * Handles complex query requirements including polymorphic field resolution (TYPEOF clauses), multi-currency
 * field inclusion, WHERE clause sanitization, and special handling for Activity objects (Task/Event) which
 * require ALL ROWS to include archived records.
 *
 * Key capabilities:
 * - Dynamic field selection with automatic multi-currency field injection
 * - Polymorphic field handling for Owner and other name-pointing fields using TYPEOF
 * - WHERE clause sanitization to prevent injection and handle edge cases
 * - Activity object special handling for archived row access
 * - Query caching for repeated WHERE clause patterns
 *
 * Uses singleton pattern via the Current static property for consistent query construction across the application.
 *
 * @see RollupRepository For query execution
 * @see RollupCurrencyInfo For multi-currency handling
 * @group Apex Rollup
 */
@SuppressWarnings('PMD.ExcessiveParameterList,PMD.PropertyNamingConventions')
public without sharing class RollupQueryBuilder {
  /** @description Singleton instance for consistent query construction */
  @SuppressWarnings('PMD.FieldNamingConventions')
  public static final RollupQueryBuilder Current = new RollupQueryBuilder();
  /** @description SOQL keyword for including soft-deleted and archived records */
  public static final String ALL_ROWS = 'ALL ROWS';
  /** @description Standard bind variable name used in generated queries */
  public static final String BIND_VAR = 'objIds';

  private static final String VERBOTEN_ENDINGS = 'or and ()';
  private static final Map<String, String> OG_WHERE_CLAUSE_TO_SANITIZED_VERSION = new Map<String, String>();
  private static final Pattern AGGREGATE_QUERY_REGEX {
    get {
      AGGREGATE_QUERY_REGEX = AGGREGATE_QUERY_REGEX ?? Pattern.compile('(count(_distinct|)|avg|sum|max|min)\\(');
      return AGGREGATE_QUERY_REGEX;
    }
    set;
  }

  @SuppressWarnings('PMD.EmptyStatementBlock')
  private RollupQueryBuilder() {
  }

  /**
   * @description Constructs a complete SOQL query string for fetching rollup-related records. Handles field
   * deduplication, multi-currency field injection, polymorphic field TYPEOF conversion, and WHERE clause
   * sanitization. The returned query uses a bind variable (objIds) for the lookup field filter.
   * @param sObjectType The SObject type to query
   * @param fieldNames List of field API names to include in SELECT (modified in place for multi-currency)
   * @param lookupFieldOnLookupObject The field to filter on (e.g., 'AccountId')
   * @param equality The comparison operator (e.g., 'IN', '=', '!=')
   * @param optionalWhereClause Additional WHERE criteria from Rollup__mdt configuration
   * @return SOQL query string with 'objIds' as the expected bind variable
   */
  public String getQuery(SObjectType sObjectType, List<String> fieldNames, String lookupFieldOnLookupObject, String equality, String optionalWhereClause) {
    Set<String> lowerCaseFieldNames = new Set<String>();
    for (String fieldName : fieldNames) {
      if (String.isNotBlank(fieldName)) {
        lowerCaseFieldNames.add(fieldName.toLowerCase());
      }
    }
    fieldNames.clear();
    fieldNames.addAll(lowerCaseFieldNames);

    this.addMultiCurrencyFields(fieldNames, lowerCaseFieldNames, sObjectType.getDescribe(SObjectDescribeOptions.DEFERRED));

    String originalWhereClause = optionalWhereClause;
    Boolean isBlank = String.isBlank(originalWhereClause);
    Boolean hasBeenSanitized = isBlank || OG_WHERE_CLAUSE_TO_SANITIZED_VERSION.containsKey(originalWhereClause);
    optionalWhereClause = hasBeenSanitized
      ? OG_WHERE_CLAUSE_TO_SANITIZED_VERSION.get(originalWhereClause)
      : this.adjustWhereClauseForPolymorphicFields(sObjectType, fieldNames, optionalWhereClause);

    String baseQuery =
      'SELECT ' +
      String.join(fieldNames, ',') +
      '\nFROM ' +
      sObjectType +
      '\nWHERE ' +
      lookupFieldOnLookupObject +
      ' ' +
      equality +
      ' :' +
      BIND_VAR;
    if (String.isNotBlank(optionalWhereClause)) {
      if (hasBeenSanitized == false) {
        optionalWhereClause = this.getSanitizedWhereClause(originalWhereClause, optionalWhereClause, sObjectType);
      }
      if (optionalWhereClause.length() > 0 && (optionalWhereClause.startsWith('\nAND') || optionalWhereClause.startsWith('\nOR'))) {
        baseQuery += optionalWhereClause;
      } else if (optionalWhereClause.length() > 0) {
        baseQuery += '\nAND ' + optionalWhereClause;
      }
    }
    if (sObjectType == Task.SObjectType || sObjectType == Event.SObjectType) {
      // handle archived rows
      baseQuery += '\nAND IsDeleted = false ' + ALL_ROWS;
    }
    return baseQuery;
  }

  /**
   * @description Overload without optional WHERE clause for simpler query construction.
   * @param sObjectType The SObject type to query
   * @param fieldNames List of field API names to include in SELECT
   * @param lookupFieldOnLookupObject The field to filter on
   * @param equality The comparison operator
   * @return SOQL query string with 'objIds' as the expected bind variable
   */
  public String getQuery(SObjectType sObjectType, List<String> fieldNames, String lookupFieldOnLookupObject, String equality) {
    return this.getQuery(sObjectType, fieldNames, lookupFieldOnLookupObject, equality, null);
  }

  /**
   * @description Ensures Task and Event queries include the ALL ROWS clause to access archived activities.
   * Activities have special archival behavior where older records are moved to archive storage but remain
   * queryable only with ALL ROWS. This method ensures correct positioning of the clause at query end.
   * @param sObjectType The SObject type being queried
   * @param query The query to potentially modify
   * @return The query with ALL ROWS appended for activity objects, unchanged for others
   */
  public String getAllRowSafeQuery(Schema.SObjectType sObjectType, String query) {
    Boolean mightNeedReplacement = sObjectType == Task.SObjectType || sObjectType == Event.SObjectType;
    if (mightNeedReplacement && query.endsWith(ALL_ROWS) == false) {
      query = query.replace(ALL_ROWS, '') + (' ' + ALL_ROWS);
    }
    return query;
  }

  private String adjustWhereClauseForPolymorphicFields(SObjectType sObjectType, List<String> fieldNames, String optionalWhereClause) {
    // you can't filter on *.Owner for polymorphic fields - or even select them, for that matter. Instead we have to massage the query to use
    // TYPEOF instead
    Map<String, SObjectField> fieldNameToField = sObjectType.getDescribe(SObjectDescribeOptions.DEFERRED).fields.getMap();
    if (this.hasPolymorphicOwnerClause(optionalWhereClause, fieldNameToField) == false || fieldNames.contains('Count()')) {
      return optionalWhereClause;
    }
    RollupEvaluator.WhereFieldEvaluator whereEval = RollupEvaluator.getWhereEval(optionalWhereClause, sObjectType);
    try {
      for (String whereClause : whereEval.getWhereClauses()) {
        if (this.hasPolymorphicOwnerClause(whereClause, fieldNameToField) == false) {
          continue;
        }
        String fieldName = whereClause.split(' ')[0];
        List<String> fieldParts = fieldName.split('\\.');
        String whoOrWhat = fieldParts.remove(0);
        String indexer = whoOrWhat + '.Type = \'';
        String relationshipName = optionalWhereClause.substring(optionalWhereClause.indexOf(indexer) + indexer.length()).substringBefore('\'');
        Set<String> typeOfFields = new Set<String>{ String.join(fieldParts, '.').toLowerCase() };
        for (Integer reverseIndex = fieldNames.size() - 1; reverseIndex >= 0; reverseIndex--) {
          String possiblyRelatedField = fieldNames[reverseIndex];
          if (possiblyRelatedField.containsIgnoreCase(whoOrWhat + '.')) {
            fieldNames.remove(reverseIndex);
            typeOfFields.add(possiblyRelatedField.substringAfter('.'));
          }
        }

        fieldNames.add('TYPEOF ' + whoOrWhat + ' WHEN ' + relationshipName + ' THEN ' + String.join(typeOfFields, ',') + ' END');

        Integer replaceIndex = optionalWhereClause.indexOf(indexer + relationshipName + '\'');
        optionalWhereClause = optionalWhereClause.replace(indexer + relationshipName + '\'', '').replace(whereClause, '');
        if (optionalWhereClause.substring(replaceIndex).toLowerCase().containsOnly(VERBOTEN_ENDINGS)) {
          optionalWhereClause = optionalWhereClause.substring(0, replaceIndex);
        }
      }
    } catch (Exception ex) {
      RollupLogger.Instance.log('exception occurred while converting polymorphic where clause:', ex, System.LoggingLevel.WARN);
    }
    return optionalWhereClause;
  }

  private Boolean hasPolymorphicOwnerClause(String whereClause, Map<String, SObjectField> fieldNameToField) {
    Boolean hasPolymorphicField = false;
    if (whereClause?.contains('.Owner') == true) {
      List<String> fields = whereClause.split('\\.');
      for (String fieldPart : fields) {
        String fieldName = fieldPart.endsWith('__r') ? fieldPart.substringBeforeLast('__r') + '__c' : fieldPart + 'Id';
        SObjectField fieldToken = fieldNameToField.get(fieldName);
        hasPolymorphicField = fieldToken?.getDescribe().isNamePointing() == true;
        if (hasPolymorphicField) {
          break;
        }
      }
    }
    return hasPolymorphicField;
  }

  private void addMultiCurrencyFields(List<String> fieldNames, Set<String> uniqueLowercaseFields, Schema.DescribeSObjectResult objectToken) {
    if (
      RollupCurrencyInfo.isMultiCurrency() &&
      objectToken.fields.getMap().containsKey(RollupCurrencyInfo.CURRENCY_ISO_CODE_FIELD_NAME) &&
      AGGREGATE_QUERY_REGEX.matcher(String.join(fieldNames, ',')).find() == false
    ) {
      List<String> multiCurrencyFields = RollupCurrencyInfo.getMultiCurrencyFields(objectToken);
      for (String multiCurrencyField : multiCurrencyFields) {
        if (String.isNotBlank(multiCurrencyField) && uniqueLowercaseFields.contains(multiCurrencyField.toLowerCase()) == false) {
          fieldNames.add(multiCurrencyField);
        }
      }
      uniqueLowercaseFields.addAll(multiCurrencyFields);
    }
  }

  private String getSanitizedWhereClause(String key, String whereClause, Schema.SObjectType sObjectType) {
    // sanitize what's left of the where clause
    if (whereClause.toLowerCase().containsOnly(VERBOTEN_ENDINGS)) {
      whereClause = '';
    } else {
      while (whereClause.trim().endsWith('AND') || whereClause.trim().endsWith('OR')) {
        whereClause = whereClause.substringBeforeLast('AND').trim();
        whereClause = whereClause.substringBeforeLast('OR').trim();
      }
      while (whereClause.startsWith('(') == true && whereClause.countMatches('(') > whereClause.countMatches(')')) {
        whereClause = whereClause.removeStart('(');
      }
      while (whereClause.endsWith(')') == true && whereClause.countMatches(')') > whereClause.countMatches('(')) {
        whereClause = whereClause.removeEnd(')');
      }
      whereClause = whereClause.replace('()', '');

      if (
        whereClause.containsIgnoreCase(' or ') && (whereClause.containsIgnoreCase(' and ') == false || whereClause.startsWith('(') && whereClause.endsWith(')'))
      ) {
        whereClause = '(' + whereClause + ')';
      }
    }
    OG_WHERE_CLAUSE_TO_SANITIZED_VERSION.put(key, whereClause);
    return whereClause;
  }
}
