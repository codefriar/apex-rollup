---
name: salesforce-schema-verification
description: Comprehensive Salesforce schema verification using SF CLI for Apex development. Use this skill when writing or modifying Apex classes that interact with Salesforce objects to verify object names, field names, data types, relationships, and picklist values. This skill provides SF CLI commands, verification checklists, code patterns, and output templates.
---

# Salesforce Schema Verification

Verify Salesforce schema when writing Apex code that interacts with objects, fields, or relationships.

## SF CLI Verification Commands

### Describe Object Schema

```bash
# Get complete object schema with field details
sf sobject describe -s <ObjectName> --json

# Human-readable format
sf sobject describe -s <ObjectName> -t
```

### Test Field Access

```bash
# Verify fields exist and are accessible
sf data query -q "SELECT Id, Field1__c, Field2__c FROM ObjectName LIMIT 1"
```

### List Available Objects

```bash
# List all objects in org
sf sobject list --sobject all
```

### Get Picklist Values

```bash
# Describe object and parse JSON for picklist values
sf sobject describe -s Account --json | grep -A 20 "picklistValues"
```

## Verification Checklist

For each Apex class, verify:

- [ ] All object API names correct (include \_\_c for custom)
- [ ] All field API names correct (include \_\_c for custom)
- [ ] Field data types match usage (String, Decimal, Date, etc.)
- [ ] Required fields handled appropriately
- [ ] Relationship fields use correct syntax (RelationshipName\_\_r)
- [ ] Picklist values valid (if hardcoded)
- [ ] RecordTypeIds retrieved dynamically (never hardcoded)
- [ ] Null checks implemented for field access
- [ ] FLS (Field Level Security) checks included

## Salesforce Naming Conventions

- Custom Objects: `ObjectName__c`
- Custom Fields: `FieldName__c`
- Custom Relationships: `RelationshipName__r`
- Namespaced fields: `namespace__FieldName__c`
- Junction Object relationships: Both master-detail fields
- External ID fields: Often `External_Id__c`

## Code Patterns

### RecordType Handling (Dynamic)

```apex
// WRONG - Hardcoded ID
if (account.RecordTypeId == '012XXXXXXXXXXXX') { }

// RIGHT - Query by DeveloperName
Id rtId = Schema.SObjectType.Account
    .getRecordTypeInfosByDeveloperName()
    .get('Business_Account')
    .getRecordTypeId();
```

### Field Level Security

```apex
// Check before querying
if (Schema.sObjectType.Account.fields.Custom_Field__c.isAccessible()) {
    // Safe to query
}

// Check before updating
if (Schema.sObjectType.Account.fields.Custom_Field__c.isUpdateable()) {
    // Safe to update
}
```

### Relationship Queries

```apex
// Custom lookup - Use __r notation
Account acc = [SELECT Id, CustomLookup__r.Name FROM Account LIMIT 1];

// Standard lookup - Use relationship name
Contact con = [SELECT Id, Account.Name FROM Contact LIMIT 1];
```

### Null Safety

```apex
// Always check for null relationships
if (contact.Account != null && contact.Account.Industry != null) {
    String industry = contact.Account.Industry;
}
```

## Schema Documentation Template

Add to each class after verification:

```apex
/**
 * Schema Dependencies (Verified: YYYY-MM-DD)
 *
 * Objects:
 *   - Account (standard)
 *   - Contact (standard)
 *   - CustomObject__c (custom)
 *
 * Fields:
 *   Account:
 *     - Name (String, required)
 *     - Industry (Picklist)
 *     - Custom_Field__c (Currency)
 *   Contact:
 *     - FirstName (String)
 *     - LastName (String, required)
 *     - AccountId (Lookup)
 *   CustomObject__c:
 *     - Status__c (Picklist)
 *     - Amount__c (Decimal)
 */
```

## Verification Output Template

After completing verification, output:

```
✓ Schema Verification Complete for [ClassName].cls

SF CLI Commands Executed:
  sf sobject describe -s Account --json
  sf sobject describe -s Contact --json
  sf sobject describe -s CustomObject__c --json

Objects Verified:
  - Account (standard)
  - Contact (standard)
  - CustomObject__c (custom)

Fields Validated ([count] total):
  Account:
    ✓ Name (String, required)
    ✓ Industry (Picklist)
    ✓ Custom_Field__c (Currency)
  Contact:
    ✓ FirstName (String)
    ✓ LastName (String, required)
    ✓ AccountId (Lookup)
  CustomObject__c:
    ✓ Status__c (Picklist: values verified)
    ✓ Amount__c (Decimal)

Relationships Verified:
  ✓ Contact.AccountId → Account
  ✓ CustomObject__c.Account__c → Account

Test Query Executed:
  sf data query -q "SELECT Id, Name FROM Account LIMIT 1" ✓

Verified: [date]
Status: No schema mismatches found
```

## Common Errors to Catch

### Missing \_\_c Suffix

```apex
// WRONG
Account acc = new Account(CustomField = 'value');

// RIGHT
Account acc = new Account(CustomField__c = 'value');
```

### Display Label vs API Name

```apex
// WRONG
String name = account.get('Account Name');

// RIGHT
String name = account.Name;
```

### Hardcoded IDs

```apex
// WRONG
Id profileId = '00e7000000XXXXX';

// RIGHT
Id profileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id;
```

### Missing Null Checks

```apex
// WRONG
String city = contact.Account.BillingCity;

// RIGHT
String city = (contact.Account != null) ? contact.Account.BillingCity : null;
```

## Verification Workflow

1. **Write Apex class** - Implement business logic
2. **Identify objects/fields** - List all schema dependencies
3. **Run SF CLI commands** - Execute `sf sobject describe` for each object
4. **Verify with test query** - Run SOQL to confirm field access
5. **Fix mismatches** - Correct any schema errors found
6. **Document dependencies** - Add schema comments to class
7. **Output verification summary** - Provide checklist with status
8. **Mark complete** - Task done only after verification passes

## Error Handling Requirements

Every Apex class must include:

- Try-catch blocks for DML operations
- Null checks for relationship traversals
- Field accessibility checks (FLS)
- Meaningful error messages
- Logging for debugging

```apex
try {
    if (Schema.sObjectType.Account.fields.Custom_Field__c.isAccessible()) {
        List<Account> accounts = [SELECT Id, Custom_Field__c FROM Account];
        // Process accounts
    }
} catch (Exception e) {
    System.debug('Error: ' + e.getMessage());
    // Handle error appropriately
}
```
