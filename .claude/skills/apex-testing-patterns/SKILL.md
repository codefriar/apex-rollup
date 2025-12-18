---
name: apex-testing-patterns
description: Comprehensive patterns and utilities for writing Apex unit tests using ApexKit testing framework including Stub.Builder for mocking, SObjectFactory, UserFactory, UserFactoryHelper for test data, IdFactory for IDs, HttpCalloutMockFactory for HTTP mocks, and AAA test structure patterns.
---

# Apex Testing Patterns

Use these patterns when writing Apex unit tests. This project uses the ApexKit testing framework.

## Core Testing Principles

### Bias towards writing unit tests with no database interaction.

### Arrange, Act, Assert (AAA) Pattern

Always structure tests using the AAA pattern:

```apex
@IsTest
static void testMethodName() {
    // Arrange - Set up test data and conditions
    Account testAccount = (Account) SObjectFactory.createSObject(new Account(Name = 'Test'));

    // Act - Execute the code being tested
    Test.startTest();
    String result = MyClass.methodToTest(testAccount);
    Test.stopTest();

    // Assert - Verify the results
    Assert.areEqual('Expected', result, 'Should return expected value');
}
```

### Test Class Naming

Test classes must follow the naming convention: `ClassNameTests`

**Examples:**

- `IdServiceTests` for `IdService`
- `AccountServiceTests` for `AccountService`
- `ContractPartyRepositoryTests` for `ContractPartyRepository`

### Test Execution Boundaries

Always wrap the "Act" section with `Test.startTest()` and `Test.stopTest()`:

```apex
Test.startTest();
// Code being tested
Test.stopTest();
```

This resets governor limits and ensures consistent test behavior.

### Assertion Methods

**Always use `Assert.*` methods (not `System.Assert*`):**

```apex
// Correct
Assert.areEqual(expected, actual, 'Message explaining what should be equal');
Assert.isTrue(condition, 'Message explaining why this should be true');
Assert.isFalse(condition, 'Message explaining why this should be false');
Assert.isNotNull(object, 'Message explaining why this should not be null');

// Incorrect - Don't use these
System.assert(condition);
System.assertEquals(expected, actual);
System.assertNotEquals(value1, value2);
```

**Always include descriptive assertion messages** as the last parameter.

## Stub.Builder - Mocking Dependencies

Use `Stub.Builder` to create mock implementations for isolated unit testing.

### When to Use Stub.Builder

1. Writing isolated unit tests that need to mock dependencies
2. Testing error handling paths by simulating exceptions
3. Verifying interactions with dependencies

### Basic Pattern

```apex
// Create the mock object
MyClassName mockObj = (MyClassName) new Stub.Builder(MyClassName.class)
    .mockingMethodCall('methodNameToMock')
    .withParameterTypes(Type1.class, List<Type2>.class)
    .withParameterValues(param1, param2)
    .returning(returnValue)
    .defineStub(true);
```

### Step-by-Step Guide

1. **Initialize with class type**: `new Stub.Builder(Class.class)`
2. **Specify the method**: `.mockingMethodCall('methodNameHere')`
3. **Define parameter types**: `.withParameterTypes(String.class, Integer.class)`
4. **Define expected values**: `.withParameterValues('test', 123)`
5. **Define return behavior**:
   - `.returning(value)` - Return a specific value
   - `.returning()` - For void methods
   - `.throwingException()` - Throw a generic exception
   - `.throwingException(customException)` - Throw a specific exception
6. **Create the stub**: `.defineStub(true)` or `.defineStub().createStub()`
7. **Cast to your type**: `(MyClassName)`

### Parameter Matching

Use `ParameterMatcher.ANYPARAMETER` to match any value:

```apex
MyClassName mockObj = (MyClassName) new Stub.Builder(MyClassName.class)
    .mockingMethodCall('processAccount')
    .withParameterTypes(Account.class)
    .withParameterValues(ParameterMatcher.ANYPARAMETER)
    .returning(true)
    .defineStub(true);
```

### Verifying Method Calls

```apex
// Verify all mocked methods were called
stubInstance.assertAllMockedMethodsWereCalled();
```

### Example: Mocking a Repository

```apex
@IsTest
static void testServiceWithMockedRepo() {
    // Arrange
    Account testAccount = new Account(Name = 'Test Account');

    AccountRepo mockRepo = (AccountRepo) new Stub.Builder(AccountRepo.class)
        .mockingMethodCall('getAccountById')
        .withParameterTypes(Id.class)
        .withParameterValues(ParameterMatcher.ANYPARAMETER)
        .returning(testAccount)
        .defineStub(true);

    AccountService service = new AccountService(mockRepo);

    // Act
    Test.startTest();
    Account result = service.processAccount(IdFactory.get(Account.sObjectType));
    Test.stopTest();

    // Assert
    Assert.areEqual('Test Account', result.Name, 'Should return mocked account');
    mockRepo.assertAllMockedMethodsWereCalled();
}
```

### Example: Simulating Exceptions

```apex
@IsTest
static void testErrorHandling() {
    // Arrange
    AccountRepo mockRepo = (AccountRepo) new Stub.Builder(AccountRepo.class)
        .mockingMethodCall('getAccountById')
        .withParameterTypes(Id.class)
        .withParameterValues(ParameterMatcher.ANYPARAMETER)
        .throwingException(new QueryException('Record not found'))
        .defineStub(true);

    AccountService service = new AccountService(mockRepo);

    // Act & Assert
    Test.startTest();
    try {
        service.processAccount(IdFactory.get(Account.sObjectType));
        Assert.fail('Should have thrown an exception');
    } catch (QueryException e) {
        Assert.areEqual('Record not found', e.getMessage(), 'Should throw expected exception');
    }
    Test.stopTest();
}
```

## SObjectFactory - Creating Test Data

Use `SObjectFactory` to create test records with required fields pre-populated.

### Create Without Insert

```apex
// Creates an Account with required fields populated but not inserted
Account acc = (Account) SObjectFactory.createSObject(new Account());

// Create with specific field values
Account acc = (Account) SObjectFactory.createSObject(new Account(Name = 'Custom Name'));
```

### Create With Insert

```apex
// Creates and inserts an Account
Account acc = (Account) SObjectFactory.createSObject(new Account(), true);

// Create with custom values and insert
Account acc = (Account) SObjectFactory.createSObject(new Account(Industry = 'Technology'), true);
```

### Create Lists

```apex
// Create list of 5 accounts without insert
List<Account> accounts = (List<Account>) SObjectFactory.createSObjects(new Account(), 5);

// Create list of 5 accounts with insert
List<Account> accounts = (List<Account>) SObjectFactory.createSObjects(new Account(), 5, true);

// Create list with custom values
List<Account> accounts = (List<Account>) SObjectFactory.createSObjects(
    new Account(Type = 'Customer'),
    10,
    true
);
```

### Why Use SObjectFactory?

**Bad:**

```apex
Account foo = new Account();
insert foo; // Fails - Name is required
```

**Good:**

```apex
Account foo = (Account) SObjectFactory.createSObject(new Account(), true);
// SObjectFactory automatically populates required fields like Name
```

## IdFactory - Generating Test IDs

Never hardcode Salesforce IDs in tests. Use `IdFactory` to generate plausible test IDs.

### Usage Patterns

```apex
// Using SObjectType
Id accountId = IdFactory.get(Account.sObjectType);

// Using String
Id accountId = IdFactory.get('Account');

// Using Class
Id accountId = IdFactory.get(Account.class);
```

### Why Use IdFactory?

**Bad:**

```apex
Id foo = '003asdfi234ad'; // Hardcoded, brittle, may not be valid format
```

**Good:**

```apex
Id foo = IdFactory.get(Account.sObjectType); // Generates valid, non-hardcoded ID
```

### Example in Tests

```apex
@IsTest
static void testMethodWithId() {
    // Arrange
    Id testAccountId = IdFactory.get(Account.sObjectType);
    Id testContactId = IdFactory.get(Contact.sObjectType);

    // Act
    Test.startTest();
    Boolean result = MyService.linkContactToAccount(testContactId, testAccountId);
    Test.stopTest();

    // Assert
    Assert.isTrue(result, 'Should successfully link contact to account');
}
```

## HttpCalloutMockFactory - Mocking HTTP Callouts

Use `HttpCalloutMockFactory` to mock HTTP callouts in tests.

### Single Callout Mock

```apex
@IsTest
static void testHttpCallout() {
    // Arrange
    HttpCalloutMockFactory calloutMocks = new HttpCalloutMockFactory(
        200,                    // Status code
        'OK',                   // Status message
        'Response body here',   // Body
        new Map<String, String>{'Content-Type' => 'application/json'}  // Headers (optional)
    );
    Test.setMock(HttpCalloutMock.class, calloutMocks);

    // Act
    Test.startTest();
    String response = MyIntegrationService.makeCallout();
    Test.stopTest();

    // Assert
    Assert.areEqual('Response body here', response, 'Should return mocked response');
}
```

### Multiple Sequential Callouts

```apex
@IsTest
static void testMultipleCallouts() {
    // Arrange
    HttpResponse firstResponse = new HttpResponse();
    firstResponse.setStatusCode(200);
    firstResponse.setStatus('OK');
    firstResponse.setBody('First response');

    HttpResponse secondResponse = new HttpResponse();
    secondResponse.setStatusCode(200);
    secondResponse.setStatus('OK');
    secondResponse.setBody('Second response');

    List<HttpResponse> seriesOfResponses = new List<HttpResponse>{firstResponse, secondResponse};
    HttpCalloutMockFactory calloutMocks = new HttpCalloutMockFactory(seriesOfResponses);
    Test.setMock(HttpCalloutMock.class, calloutMocks);

    // Act
    Test.startTest();
    String response1 = MyIntegrationService.makeFirstCallout();
    String response2 = MyIntegrationService.makeSecondCallout();
    Test.stopTest();

    // Assert
    Assert.areEqual('First response', response1, 'Should return first mocked response');
    Assert.areEqual('Second response', response2, 'Should return second mocked response');
}
```

### Why Use HttpCalloutMockFactory?

**Bad:**

```apex
global class YourHttpCalloutMockImpl implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setStatus('OK');
        res.setBody('Response body');
        return res;
    }
}

Test.setMock(HttpCalloutMock.class, new YourHttpCalloutMockImpl());
```

**Good:**

```apex
HttpCalloutMockFactory calloutMocks = new HttpCalloutMockFactory(200, 'OK', 'Response body', responseHeaderMap);
Test.setMock(HttpCalloutMock.class, calloutMocks);
```

## Complete Test Example

```apex
@IsTest
private class AccountServiceTests {
  @IsTest
  static void testGetAccountWithContactsSuccess() {
    // Arrange
    Id testAccountId = IdFactory.get(Account.sObjectType);
    Account testAccount = (Account) SObjectFactory.createSObject(new Account(Id = testAccountId, Name = 'Test Account'));
    List<Contact> testContacts = (List<Contact>) SObjectFactory.createSObjectList(new Contact(AccountId = testAccountId), 3);

    AccountRepo mockRepo = (AccountRepo) new Stub.Builder(AccountRepo.class)
      .mockingMethodCall('getAccountWithContacts')
      .withParameterTypes(Id.class)
      .withParameterValues(testAccountId)
      .returning(testAccount)
      .defineStub(true);

    AccountService service = new AccountService(mockRepo);

    // Act
    Test.startTest();
    Account result = service.getAccountWithContacts(testAccountId);
    Test.stopTest();

    // Assert
    Assert.isNotNull(result, 'Should return an account');
    Assert.areEqual('Test Account', result.Name, 'Should return correct account name');
    mockRepo.assertAllMockedMethodsWereCalled();
  }

  @IsTest
  static void testGetAccountNotFound() {
    // Arrange
    Id testAccountId = IdFactory.get(Account.sObjectType);

    AccountRepo mockRepo = (AccountRepo) new Stub.Builder(AccountRepo.class)
      .mockingMethodCall('getAccountWithContacts')
      .withParameterTypes(Id.class)
      .withParameterValues(testAccountId)
      .throwingException(new QueryException('No records found'))
      .defineStub(true);

    AccountService service = new AccountService(mockRepo);

    // Act & Assert
    Test.startTest();
    try {
      service.getAccountWithContacts(testAccountId);
      Assert.fail('Should have thrown QueryException');
    } catch (QueryException e) {
      Assert.areEqual('No records found', e.getMessage(), 'Should throw expected exception');
    }
    Test.stopTest();
  }
}
```

## Test Coverage Requirements

- **Minimum aggregate coverage**: 75%
- **Project requirement**: All logic branches must have coverage
- Run tests with coverage: `sf apex test run -c -v`

## Testing Best Practices

1. **One assertion per concept**: Test one thing at a time
2. **Descriptive test names**: `testMethodName_Scenario_ExpectedBehavior`
3. **Independent tests**: Each test should be able to run in isolation
4. **Test both success and failure paths**: Include negative test cases
5. **Use System.runAs()**: Test with different user contexts when relevant
6. **Mock external dependencies**: Use Stub.Builder for repositories, services
7. **Avoid hardcoded IDs**: Use IdFactory
8. **Clean test data**: Use SObjectFactory for consistent data creation
