---
name: apex-best-practices
description: Comprehensive Apex best practices covering code quality rules, naming conventions, security patterns, performance optimization, and design guidelines. Based on PMD static analysis rules for avoiding common pitfalls in governor limits, SOQL/DML operations, security vulnerabilities, and code maintainability.
---

# Apex Best Practices

Use this skill when writing, reviewing, or refactoring Apex code to ensure adherence to best practices for quality, security, performance, and maintainability.

## Best Practices

### ApexAssertionsShouldIncludeMessage

Always include descriptive assertion messages.

```apex
// Good
System.assert(thisOpp.isClosed, 'Opportunity should be closed');
Assert.areEqual('Closed Won', thisOpp.StageName, 'Stage should be Closed Won');

// Bad
System.assert(o.isClosed);
Assert.areEqual('Closed Won', o.StageName);
```

### ApexUnitTestClassShouldHaveAsserts

Every test method must contain at least one assertion.

```apex
// Good
@IsTest
static void testSomething() {
    Account acct = new Account(Name = 'Test');
    Assert.isNotNull(acct, 'Account should be created');
}

// Bad
@IsTest
static void testSomething() {
    Account a = new Account(Name = 'Test');
    // No assertion!
}
```

### AvoidDirectAccessTriggerMap

Never access `Trigger.new` or `Trigger.old` by index in loops.

```apex
// Good
for (Account acct : Trigger.new) {
    // Process account
}

// Bad
for (Integer i = 0; i < Trigger.new.size(); i++) {
    Account acc = Trigger.new[i];
}
```

### AvoidDmlStatementsInLoops

Never perform DML operations inside loops to avoid governor limits.

```apex
// Good
List<Account> accsToUpdate = new List<Account>();
for (Account acc : accList) {
    acc.Name = 'Updated';
    accsToUpdate.add(acc);
}
update accsToUpdate;

// Bad
for (Account acc : accList) {
    acc.Name = 'Updated';
    update acc; // DML in loop!
}
```

### AvoidSoqlInLoops

Never execute SOQL queries inside loops.

```apex
// Good
Set<Id> accountIds = new Set<Id>();
for (Contact con : contacts) {
    accountIds.add(con.AccountId);
}
List<Account> accounts = [SELECT Id, Name FROM Account WHERE Id IN :accountIds];

// Bad
for (Contact con : contacts) {
    Account acc = [SELECT Id, Name FROM Account WHERE Id = :con.AccountId];
}
```

### AvoidSoslInLoops

Never execute SOSL queries inside loops.

```apex
// Good
List<List<Account>> searchResults = [FIND 'Acme*' IN ALL FIELDS RETURNING Account (Id, Name)];
for (Account acc : searchResults[0]) {
    // Process
}

// Bad
for (String searchTerm : terms) {
    List<List<Account>> results = [FIND :searchTerm IN ALL FIELDS RETURNING Account];
}
```

### MethodsMustBeGlobalOrPublic

Methods must have explicit visibility (public or global), not package-private.

```apex
// Good
public void doSomething() { }

// Bad
void doSomething() { } // Package-private
```

## Code Style

### ClassNamingConventions

Class, interface, annotations, primitive and enum names must be PascalCase.

```apex
// Good
public class MyTestClass { }
public interface MyInterface { }
public enum MyEnum { VALUE1, VALUE2 }
@TestVisible private String someString;

// Bad
public class mytestclass { }
public class my_test_class { }
@testVisible private string someString;
```

### FieldDeclarationsShouldBeAtStart

Declare all fields before methods.

```apex
// Good
public class MyClass {
    Integer instanceField;
    static final Integer CONSTANT = 42;

    public void myMethod() { }
}

// Bad
public class MyClass {
    public void myMethod() { }
    Integer instanceField; // Field after method
}
```

### FieldNamingConventions

Field names use camelCase; constants use UPPER_CASE. Constants are defined by the combination of `final` and `static` modifiers.

```apex
// Good
public class Foo {
    Integer instanceField;
    static final Integer SOME_CONSTANT = 42;
}

// Bad
public class Foo {
    Integer InstanceField;
    static final Integer someConstant = 42;
}
```

### ForLoopsMustUseBraces

Always use braces for for-loops, even single statements.

```apex
// Good
for (Integer index = 0; index < 10; index++) {
    doSomething();
}

// Bad
for (Integer i = 0; i < 10; i++)
    doSomething();
```

### FormalParameterNamingConventions

Method parameters must use camelCase.

```apex
// Good
public void processAccount(Integer accountId) { }

// Bad
public void processAccount(Integer ACCOUNT_ID) { }
```

### IfElseStmtsMustUseBraces

Always use braces for if-else statements.

```apex
// Good
if (flag) {
    index++;
} else {
    index--;
}

// Bad
if (flag)
    x++;
else
    x--;
```

### IfStmtsMustUseBraces

Always use braces for if statements.

```apex
// Good
if (flag) {
    index++;
}

// Bad
if (flag)
    index++;
```

### LocalVariableNamingConventions

Local variables must use camelCase be descriptive and be >= 3 characters in length.

```apex
// Good
Integer localVar = 1;

// Bad
Integer LOCALVAR = 1;
```

### MethodNamingConventions

Method names must use camelCase and be descriptive.

```apex
// Good
public void processAccount() { }

// Bad
public void Process_Account() { }
```

### OneDeclarationPerLine

Declare one variable per line.

```apex
// Good
Integer aIndex;
Integer bIndex;

// Bad
Integer a, b;
```

### PropertyNamingConventions

Property names must use camelCase.

```apex
// Good
public Integer accountTotal { get; set; }

// Bad
public Integer ACCOUNT_TOTAL { get; set; }
```

### WhileLoopsMustUseBraces

Always use braces for while loops.

```apex
// Good
while (flag) {
    index++;
}

// Bad
while (flag)
    index++;
```

## Design

### AvoidDeeplyNestedIfStmts

Keep nesting to three levels or fewer. Prefer early returns.

```apex
// Good
public void bar(Integer x, Integer y, Integer z) {
    if (xVar > yVar) {
        if (yVar > zVar) {
            doSomething();
        }
    }
}

// Bad
public void bar(Integer x, Integer y, Integer z) {
    if (x > y) {
        if (y > z) {
            if (z == x) { // Too deep!
                doSomething();
            }
        }
    }
}
```

### CognitiveComplexity

Keep cognitive complexity below 15.

```apex
// Good
public void simpleMethod() {
    if (condition) {
        doSomething();
    }
}

// Bad - Too many nested conditions and logic branches
public void complexMethod() {
    if (a) {
        if (b) {
            for (Integer i = 0; i < 10; i++) {
                if (c) {
                    while (d) {
                        // Complex logic
                    }
                }
            }
        }
    }
}
```

### CyclomaticComplexity

Keep cyclomatic complexity below 10 per method.

```apex
// Good
public void process(Boolean flag) {
    if (flag) {
        doSomething();
    } else {
        doSomethingElse();
    }
}

// Bad - 12+ decision points
public void complicated() {
    if (a) {
        if (b) { }
        else if (c) { }
        else { }
    } else if (d) {
        while (e) { }
    } else {
        for (Integer n = 0; n < t; n++) { }
    }
}
```

### ExcessiveClassLength

Classes should not exceed 1000 lines. Suggest refactoring into smaller classes when longer than 700 lines.

```apex
// Good
public class UserManager {
    // Less than 1000 lines
}

// Bad - Split into smaller classes
public class HugeManager {
    // 1000+ lines
}
```

### ExcessiveParameterList

Methods should have no more than 4 parameters.

```apex
// Good
public class BodyMeasurements {
    Integer height;
    Integer weight;
}
public void addPerson(Date birthdate, BodyMeasurements measurements, Integer ssn) { }

// Bad
public void addPerson(Integer birthYear, Integer birthMonth, Integer birthDate,
                      Integer height, Integer weight, Integer ssn) { }
```

### ExcessivePublicCount

Classes should have no more than 20 public methods/fields/properties.

```apex
// Good
public class AccountHandler {
    public void doWork() {}
    public String value;
    // Less than 20 public members
}

// Bad - Break into smaller classes
public class Foo {
    // 20+ public methods, fields, properties
}
```

### NcssConstructorCount

Constructors should not exceed 20 NCSS lines.

```apex
// Good
public Foo() {
    super();
    setup();
}

// Bad
public Foo() {
    // 20+ lines of logic
}
```

### NcssMethodCount

Methods should not exceed 40 NCSS lines.

```apex
// Good
public Integer method() {
    return 1;
}

// Bad
public void longMethod() {
    // 40+ NCSS lines
}
```

### NcssTypeCount

Classes should not exceed 500 NCSS lines.

```apex
// Good
public class SmallType {
    // Under 500 NCSS lines
}

// Bad
public class MassiveType {
    // 500+ NCSS lines
}
```

### TooManyFields

Classes should have no more than 15 fields.

```apex
// Good
public class BodyMeasurements {
    Double height;
    Double weight;
}
public class Person {
    Date birthDate;
    BodyMeasurements measurements;
}

// Bad
public class Person {
    Integer birthYear;
    Integer birthMonth;
    Integer birthDate;
    Double height;
    Double weight;
    // 15+ fields total
}
```

### UnusedMethod

Remove unused methods.

```apex
// Good
public class Triangle {
    public Triangle(Double a, Double b, Double c) { }
    public Double getPerimeter() { } // Used
}

// Bad
public class Triangle {
    public Triangle(Double a, Double b, Double c) { }
    public Double area() { } // Never called!
}
```

## Documentation

### ApexDoc

Provide ApexDoc comments for all public/global classes, methods, and properties. The `@Description` annotation is no longer needed, but the description itself is.

```apex
// Good
/**
 * Handles account logic.
 */
public class AccountHandler {
    /**
     * Calculates the sum.
     * @param a The first number.
     * @param b The second number.
     * @return The sum of a and b.
     */
    public Integer sum(Integer a, Integer b) {
        return a + b;
    }
}

// Bad - No documentation
public class AccountHandler {
    public Integer sum(Integer a, Integer b) {
        return a + b;
    }
}
```

## Error Prone

### ApexCSRF

Never perform DML in constructors, initializers, or methods named "init".

```apex
// Bad
public class Foo {
  {
    insert data;
  } // Initializer
  static {
    insert data;
  } // Static initializer
  public Foo() {
    insert data;
  } // Constructor
}
```

### AvoidHardcodingId

Never hardcode Salesforce record IDs.

```apex
// Good
Id rtId = [SELECT Id FROM RecordType WHERE DeveloperName = 'Business_Account' LIMIT 1].Id;

// Bad
if (a.RecordTypeId == '012500000009WAr') { }
```

### AvoidNonExistentAnnotations

Only use officially supported Apex annotations.

### AvoidStatefulDatabaseResult

Don't store Database.\*Result objects as instance variables in stateful batch classes.

```apex
// Good
public class StatefulResult { /* Custom serializable */ }
List<StatefulResult> results = new List<StatefulResult>();

// Bad
public class Example implements Database.Batchable<SObject>, Database.Stateful {
    List<Database.SaveResult> results; // Not serializable!
}
```

### EmptyCatchBlock

Never leave catch blocks empty.

```apex
// Good
try {
    riskyOperation();
} catch (Exception e) {
    System.debug(LoggingLevel.ERROR, 'Error: ' + e.getMessage());
}

// Bad
try {
    riskyOperation();
} catch (Exception e) { }
```

### EmptyIfStmt

Avoid empty if statements.

```apex
// Bad
if (x == 0) { }
```

### EmptyStatementBlock

Don't leave method bodies empty.

```apex
// Bad
public void setBar(Integer bar) { }
```

### EmptyTryOrFinallyBlock

Avoid empty try or finally blocks.

```apex
// Bad
try { } catch (Exception e) { }
finally { }
```

### EmptyWhileStmt

Avoid empty while loops.

```apex
// Bad
while (condition) { }
```

### InaccessibleAuraEnabledGetter

@AuraEnabled properties must have public getters.

```apex
// Good
@AuraEnabled public Integer counter { get; set; }

// Bad
@AuraEnabled public Integer counter { private get; set; }
```

### MethodWithSameNameAsEnclosingClass

Don't create methods with the same name as the class (except constructors).

```apex
// Bad
public class MyClass {
  public void MyClass() {
  } // Not a constructor!
}
```

### OverrideBothEqualsAndHashcode

If you override equals(), also override hashCode(), and vice versa.

```apex
// Good
public Boolean equals(Object o) { /* ... */ }
public Integer hashCode() { /* ... */ }

// Bad
public Boolean equals(Object o) { /* ... */ }
// Missing hashCode()!
```

### TestMethodsMustBeInTestClasses

Test methods must be in @IsTest classes.

```apex
// Good
@IsTest
private class TestClass {
    @IsTest static void myTest() { }
}

// Bad
public class MyClass {
    @IsTest static void myTest() { }
}
```

### TypeShadowsBuiltInNamespace

Don't name classes the same as System or Schema types.

```apex
// Bad
public class Database {
} // Collides with System.Database
```

## Performance

### AvoidDebugStatements

Avoid System.debug() in production code.

```apex
// Bad
System.debug('Debug info');

// Good - Use Apex Replay Debugger or remove debug statements
```

### AvoidNonRestrictiveQueries

Always use WHERE clauses or LIMIT.

```apex
// Good
Account[] accs = [SELECT Id FROM Account WHERE Type = 'Customer' LIMIT 10];

// Bad
Account[] accs = [SELECT Id FROM Account]; // No filter!
```

### EagerlyLoadedDescribeSObjectResult

Use DEFERRED option for describe calls.

```apex
// Good
Account.SObjectType.getDescribe(SObjectDescribeOptions.DEFERRED);

// Bad
Account.SObjectType.getDescribe(); // Eagerly loads all metadata
```

### OperationWithHighCostInLoop

Don't call expensive Schema methods inside loops.

```apex
// Good
Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe();
for (String f : fields) {
    // Use fieldMap
}

// Bad
for (String f : fields) {
    Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe();
}
```

### OperationWithLimitsInLoop

Never perform DML, SOQL, SOSL, emails, or async jobs inside loops.

```apex
// Good
insert accounts;

// Bad
for (Account a : accounts) {
    insert a;
}
```

## Security

### ApexBadCrypto

Never use hardcoded IVs or keys.

```apex
// Bad
Blob iv = Blob.valueOf('Hardcoded IV');
Blob key = Blob.valueOf('0000000000000000');
```

### ApexCRUDViolation

Always check CRUD and FLS permissions.

```apex
// Good
Contact c = [SELECT Status__c FROM Contact WHERE Id = :ID WITH SECURITY_ENFORCED];
if (Schema.sObjectType.Contact.fields.Status__c.isUpdateable()) {
    c.Status__c = status;
    update c;
}

// Bad
Contact c = [SELECT Status__c FROM Contact WHERE Id = :ID];
c.Status__c = status;
update c;
```

### ApexDangerousMethods

Never call methods that disable security checks.

### ApexInsecureEndpoint

Always use HTTPS, never HTTP.

```apex
// Good
req.setEndpoint('https://example.com');

// Bad
req.setEndpoint('http://example.com');
```

### ApexOpenRedirect

Never redirect to user-controlled URLs without validation.

```apex
// Bad
return new PageReference(ApexPages.currentPage().getParameters().get('url_param'));
```

### ApexSharingViolations

Always declare sharing mode.

```apex
// Good
public with sharing class Foo { }
public without sharing class Bar { }

// Bad
public class Baz { } // No sharing declaration
```

### ApexSOQLInjection

Never concatenate user input into SOQL queries.

```apex
// Good
List<Account> accounts = [SELECT Id FROM Account WHERE Name = :name];

// Bad
String query = 'SELECT Id FROM Account WHERE Name = \'' + name + '\'';
List<Account> accounts = Database.query(query);
```

### ApexSuggestUsingNamedCred

Use Named Credentials, not hardcoded credentials.

```apex
// Bad
String authHeader = 'BASIC ' + EncodingUtil.base64Encode(
    Blob.valueOf(username + ':' + password)
);
```

### ApexXSSFromEscapeFalse

Always escape error messages.

```apex
// Good
Trigger.new[0].addError(vulnerableHTML); // Escaped by default

// Bad
Trigger.new[0].addError(vulnerableHTML, false); // XSS risk!
```

### ApexXSSFromURLParam

Always escape and validate URL parameters.

```apex
// Bad
String unsafe = ApexPages.currentPage().getParameters().get('url_param');
someComponent.setValue(unsafe);

// Good
String safe = String.escapeSingleQuotes(
    ApexPages.currentPage().getParameters().get('url_param')
);
```

## Quick Reference Rules

**Governor Limits:**

- No DML in loops
- No SOQL in loops
- No SOSL in loops
- Batch operations outside loops

**Naming:**

- Classes: PascalCase
- Methods/Variables: camelCase
- Constants: UPPER_CASE

**Style:**

- Always use braces
- Fields before methods
- One declaration per line

**Security:**

- WITH SECURITY_ENFORCED
- Check FLS
- Use Named Credentials
- Bind variables in SOQL

**Testing:**

- AAA pattern
- Assert messages
- Test.startTest/stopTest
- > = 80% coverage
