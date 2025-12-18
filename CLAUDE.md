# Salesforce Apex Development Guidelines

## Critical Project Standards

### Architecture Requirements

**Repository Pattern** - All CRUD operations via BaseRepo:

- `BaseRepo.cls`: Base class for all repositories
- Security modes: `USER_MODE` (enforces permissions) and `SYSTEM_MODE` (bypasses permissions)
- Security context: `ALLOWS_SAFE` (default) and `ALLOWS_UNSAFE` (requires justification)
- Default to BaseRepo methods with `WITH SECURITY_ENFORCED`

Example:

```apex
// Safe - user context
AccountRepo repo = new AccountRepo();
List<Account> accounts = repo.getAccountsByType('Customer');

// Unsafe - system context (requires justification)
AccountRepo repo = new AccountRepo(BaseRepo.SECURITY_CONTEXT.ALLOWS_UNSAFE);
repo.updateAccounts(accounts, 'Batch operation needs system access');
```

**Service Layer** - Business logic in services:

- `IdService.cls`: ID generation
- `SQIDService.cls`: Unique ID encoding/decoding
- `ContractIDService.cls`: 12-digit contract numbers

**Trigger Framework** - Minimal logic in triggers:

- Delegate to trigger handler classes
- Use `Metadata_Driven_Trigger__mdt` for enable/disable control
- Standard trigger pattern:

```apex
trigger AccountTrigger on Account(after insert, before insert, after update, before update) {
  new MetadataTriggerFramework().run();
}
```

### File Organization

Place Apex classes in type-specific folders:

- `classes/repositories/` - Classes ending in `Repo` or `Repository`, extending `BaseRepo`
- `classes/services/` - Classes ending in `Service`
- `classes/triggerHandlers/` - Classes ending in `TriggerHandler`
- `classes/tests/` - Classes ending in `Tests`
- `classes/enums/` - Classes containing only ENUM definitions

### Naming Conventions

- **Variables**: Minimum 3 characters, camelCase
- **Classes**: PascalCase, max 40 characters, descriptive names preferred
- **Methods**: camelCase, descriptive names preferred
- **Tests**: `ClassNameTests` (e.g., `IdServiceTests`, `AccountServiceTests`)
- **Annotations**: PascalCase including parameters (e.g., `@AuraEnabled(Cacheable=true)`)
- **class variables marked private static final are to be considered constants.** As a result, they're naming convention should match the Regex [A-Z][A-Z0-9_]\*

### Core Requirements

- **Test coverage**: ≥75% aggregate + ALL logic branches must be covered
- **Annotations**: `@TestVisible` for private testing, `@IsTest` for test classes
- **Metadata**: Use `apiVersion` from `sfdx-project.json` (minimum v65.0)
- **Schema verification**: ALWAYS verify schema using SF CLI before completing Apex classes (see `salesforce-schema-verification` skill)

### Language Specifics

- Apex has very limited reflection capabilities
- Use `@TestVisible` on private methods/constructors for testing
- Capitalize `Id` when referencing as property (not `id`)
- Custom fields require `__c` suffix
- All queries return `Id` even if not in SELECT clause

## Platform Context

- **Development flow**: Code locally → deploy to org → test
- **Metadata location**: `force-app/main/default/`
- **CLI tool**: `sf` (Salesforce CLI) - see `salesforce-cli` skill
- **Package scripts**: See `package.json` scripts section
  - `npm run lint` - Lint Aura/LWC JavaScript
  - `npm run test:unit:coverage` - Run LWC tests with coverage
  - `npm run prettier` - Format code (run after modifying metadata)

## Skills Reference

Use these skills for detailed guidance:

- **`salesforce-schema-verification`** - Schema validation workflow, SF CLI commands, red flags to catch
- **`apex-testing-patterns`** - Stub.Builder, SObjectFactory, UserFactory, UserFactoryHelper, IdFactory, HttpCalloutMockFactory, AAA pattern. Do not use TestFactory.
- **`apex-best-practices`** - PMD rules, code style, security, performance, design guidelines
- **`salesforce-cli`** - SF CLI commands, deployment, testing, org management

## Common Red Flags

- Hardcoded RecordType/User/Profile IDs (use DeveloperName queries)
- Missing `__c` suffix on custom fields
- Using Display Labels instead of API names
- Missing null checks for field/relationship access
- DML/SOQL/SOSL in loops
- Empty catch blocks
- Missing assertion messages in tests
