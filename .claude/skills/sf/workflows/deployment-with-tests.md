# Workflow: Deploy Metadata with Tests

## Overview

This workflow demonstrates how to deploy Salesforce metadata with test execution using the `sf` CLI. Running tests during deployment is critical for production deployments and validating code quality.

## Use Cases

- Production deployments (requires tests)
- Pre-production validation
- Quality gate enforcement
- Code coverage verification
- Regression testing during deployment

## Prerequisites

- Authenticated to target org
- Test classes exist and are deployable
- Minimum 75% code coverage for production deployments
- Tests must pass for successful deployment

## Test Levels

Salesforce provides different test execution levels:

| Test Level          | Description                                    | Use Case              |
| ------------------- | ---------------------------------------------- | --------------------- |
| `NoTestRun`         | No tests run                                   | Development orgs only |
| `RunSpecifiedTests` | Run specific test classes                      | Targeted testing      |
| `RunLocalTests`     | Run all local tests (exclude managed packages) | Standard deployments  |
| `RunAllTestsInOrg`  | Run all tests including managed packages       | Full validation       |

## Basic Workflows

### 1. Deploy with All Local Tests (Standard Production Pattern)

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o production \
  --test-level RunLocalTests
```

### 2. Deploy with Specific Tests

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --test-level RunSpecifiedTests \
  --tests MyClassTest
```

### 3. Deploy with Multiple Specific Tests

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -m ApexClass:MyOtherClass \
  -o my-org \
  --test-level RunSpecifiedTests \
  --tests MyClassTest,MyOtherClassTest
```

### 4. Deploy with Test Coverage

Get code coverage during deployment:

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --test-level RunLocalTests \
  --coverage-formatters json
```

### 5. Validate Deployment with Tests (Check-Only)

Validate without actually deploying:

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o production \
  --test-level RunLocalTests \
  --dry-run
```

## Production Deployment Patterns

### Standard Production Deployment

```bash
# 1. Validate with tests
sf project deploy start \
  -m ApexClass \
  -o production \
  --test-level RunLocalTests \
  --dry-run \
  --wait 60

# 2. If validation passes, deploy
sf project deploy start \
  -m ApexClass \
  -o production \
  --test-level RunLocalTests \
  --wait 60
```

### Quick Deploy (Reuse Validation)

After successful validation, deploy using the validation ID:

```bash
# 1. Validate and save job ID
VALIDATION_ID=$(sf project deploy start \
  -m ApexClass:MyClass \
  -o production \
  --test-level RunLocalTests \
  --dry-run \
  --json | jq -r '.result.id')

# 2. Quick deploy using validation ID
sf project deploy quick \
  --job-id $VALIDATION_ID \
  -o production
```

### Deploy Specific Components with Their Tests

```bash
sf project deploy start \
  -m ApexClass:AccountService \
  -m ApexClass:AccountServiceTest \
  -m ApexClass:ContactService \
  -m ApexClass:ContactServiceTest \
  -o production \
  --test-level RunSpecifiedTests \
  --tests AccountServiceTest,ContactServiceTest
```

## Test Execution Options

### Run Specific Test Classes

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --test-level RunSpecifiedTests \
  --tests MyClassTest
```

### Run Specific Test Methods

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --test-level RunSpecifiedTests \
  --tests MyClassTest.testMethod1,MyClassTest.testMethod2
```

### Run Multiple Test Classes

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --test-level RunSpecifiedTests \
  --tests MyClassTest,AnotherTest,YetAnotherTest
```

## Code Coverage

### Get Coverage Report

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --test-level RunLocalTests \
  --coverage-formatters json,text
```

### Coverage Formatters

Available formatters:

- `json`: JSON format
- `text`: Human-readable text
- `cobertura`: Cobertura XML format
- `html`: HTML coverage report
- `lcov`: LCOV format

### Require Minimum Coverage

Salesforce automatically requires 75% coverage for production. Verify beforehand:

```bash
sf project deploy start \
  -m ApexClass \
  -o production \
  --test-level RunLocalTests \
  --dry-run | grep -i coverage
```

## Advanced Patterns

### Deploy with Verbose Test Output

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --test-level RunSpecifiedTests \
  --tests MyClassTest \
  --verbose
```

### Deploy with JSON Output for Parsing

```bash
RESULT=$(sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --test-level RunLocalTests \
  --json)

# Parse test results
echo "$RESULT" | jq '.result.details.runTestResult'

# Check coverage
echo "$RESULT" | jq '.result.details.runTestResult.codeCoverage'
```

### Monitor Long-Running Deployments with Tests

```bash
# Start deployment
JOB_ID=$(sf project deploy start \
  -m ApexClass \
  -o production \
  --test-level RunLocalTests \
  --json | jq -r '.result.id')

# Monitor progress
while true; do
  STATUS=$(sf project deploy report -i $JOB_ID -o production --json | jq -r '.result.status')
  echo "Status: $STATUS"

  if [ "$STATUS" = "Succeeded" ] || [ "$STATUS" = "Failed" ]; then
    break
  fi

  sleep 10
done

# Get final report with test results
sf project deploy report -i $JOB_ID -o production
```

## Test Failure Handling

### View Test Failures

```bash
sf project deploy report -i <JOB_ID> -o my-org --json | \
  jq '.result.details.runTestResult.failures'
```

### Extract Failing Test Names

```bash
sf project deploy report -i <JOB_ID> -o my-org --json | \
  jq -r '.result.details.runTestResult.failures[].name'
```

### View Code Coverage Per Class

```bash
sf project deploy report -i <JOB_ID> -o my-org --json | \
  jq '.result.details.runTestResult.codeCoverage[] | {name: .name, percentCovered: .percentCovered}'
```

## Best Practices

### 1. Always Run Tests for Production

```bash
# Required for production
sf project deploy start \
  -m ApexClass \
  -o production \
  --test-level RunLocalTests
```

### 2. Use Specific Tests During Development

Faster iteration with targeted tests:

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o dev-sandbox \
  --test-level RunSpecifiedTests \
  --tests MyClassTest
```

### 3. Validate Before Deploying to Production

```bash
# Validate with tests first
sf project deploy start \
  -m ApexClass \
  -o production \
  --test-level RunLocalTests \
  --dry-run

# Deploy only if validation succeeds
```

### 4. Use Quick Deploy for Production

Save time on large deployments:

```bash
# 1. Validate (runs tests)
VALIDATION_ID=$(sf project deploy start \
  -m ApexClass \
  -o production \
  --test-level RunLocalTests \
  --dry-run \
  --json | jq -r '.result.id')

# 2. Quick deploy (reuses test results)
sf project deploy quick --job-id $VALIDATION_ID -o production
```

### 5. Monitor Code Coverage Trends

Track coverage over time:

```bash
sf project deploy start \
  -m ApexClass \
  -o my-org \
  --test-level RunLocalTests \
  --coverage-formatters json > coverage-report.json
```

### 6. Include Test Classes in Deployment

Always deploy test classes with production code:

```bash
sf project deploy start \
  -m ApexClass:MyService \
  -m ApexClass:MyServiceTest \
  -o production \
  --test-level RunLocalTests
```

## Troubleshooting

### Test Failures

**Symptom**: Deployment fails due to test failures

**Solution**:

```bash
# Get detailed test failure information
sf project deploy report -i <JOB_ID> -o my-org --json | \
  jq '.result.details.runTestResult.failures[] | {
    name: .name,
    methodName: .methodName,
    message: .message,
    stackTrace: .stackTrace
  }'
```

### Insufficient Code Coverage

**Symptom**: Deployment fails with "Average test coverage across all Apex Classes and Triggers is X%, at least 75% test coverage is required"

**Solution**:

```bash
# Identify classes with low coverage
sf project deploy report -i <JOB_ID> -o my-org --json | \
  jq '.result.details.runTestResult.codeCoverage[] |
      select(.percentCovered < 75) |
      {name: .name, coverage: .percentCovered}'

# Add tests for uncovered classes
```

### Timeout During Test Execution

**Symptom**: Command times out waiting for tests

**Solution**:

```bash
# Increase wait time
sf project deploy start \
  -m ApexClass \
  -o my-org \
  --test-level RunLocalTests \
  --wait 120  # Wait up to 120 minutes
```

### Specific Test Not Running

**Symptom**: Specified test class not executed

**Solution**:

```bash
# Ensure test class is included in deployment
sf project deploy start \
  -m ApexClass:MyClass \
  -m ApexClass:MyClassTest \
  -o my-org \
  --test-level RunSpecifiedTests \
  --tests MyClassTest
```

## Complete Example

Full production deployment workflow with tests:

```bash
#!/bin/bash

# Configuration
ORG_ALIAS="production"
METADATA_TYPE="ApexClass"
MIN_COVERAGE=75
WAIT_TIME=60

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "========================================"
echo "Production Deployment with Tests"
echo "========================================"

# 1. Verify org authentication
echo -e "\n${YELLOW}[1/5] Verifying org authentication...${NC}"
if ! sf org list | grep -q "$ORG_ALIAS"; then
  echo -e "${RED}✗ Org $ORG_ALIAS not authenticated${NC}"
  exit 1
fi
echo -e "${GREEN}✓ Org authenticated${NC}"

# 2. Validate deployment with tests
echo -e "\n${YELLOW}[2/5] Validating deployment with tests...${NC}"
VALIDATION_RESULT=$(sf project deploy start \
  -m "$METADATA_TYPE" \
  -o "$ORG_ALIAS" \
  --test-level RunLocalTests \
  --dry-run \
  --wait "$WAIT_TIME" \
  --json)

VALIDATION_STATUS=$(echo "$VALIDATION_RESULT" | jq -r '.result.status')
VALIDATION_ID=$(echo "$VALIDATION_RESULT" | jq -r '.result.id')

if [ "$VALIDATION_STATUS" != "Succeeded" ]; then
  echo -e "${RED}✗ Validation failed${NC}"

  # Show test failures
  echo -e "\n${RED}Test Failures:${NC}"
  echo "$VALIDATION_RESULT" | jq -r '.result.details.runTestResult.failures[] |
    "- \(.name).\(.methodName): \(.message)"'

  exit 1
fi

echo -e "${GREEN}✓ Validation succeeded${NC}"
echo "Validation ID: $VALIDATION_ID"

# 3. Check code coverage
echo -e "\n${YELLOW}[3/5] Checking code coverage...${NC}"
COVERAGE=$(echo "$VALIDATION_RESULT" | jq -r '.result.details.runTestResult.codeCoverageWarnings[] |
  select(.name == "Average Test Coverage") | .message' | grep -oP '\d+%' | tr -d '%')

if [ -z "$COVERAGE" ]; then
  COVERAGE=0
fi

echo "Code Coverage: ${COVERAGE}%"

if [ "$COVERAGE" -lt "$MIN_COVERAGE" ]; then
  echo -e "${RED}✗ Coverage below minimum (${MIN_COVERAGE}%)${NC}"

  # Show classes with low coverage
  echo -e "\n${RED}Classes with low coverage:${NC}"
  echo "$VALIDATION_RESULT" | jq -r '.result.details.runTestResult.codeCoverage[] |
    select(.percentCovered < 75) |
    "- \(.name): \(.percentCovered)%"'

  exit 1
fi

echo -e "${GREEN}✓ Coverage meets requirements${NC}"

# 4. Review deployment
echo -e "\n${YELLOW}[4/5] Deployment Summary${NC}"
echo "Org: $ORG_ALIAS"
echo "Metadata Type: $METADATA_TYPE"
echo "Test Level: RunLocalTests"
echo "Coverage: ${COVERAGE}%"
echo ""
read -p "Proceed with deployment? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
  echo "Deployment cancelled"
  exit 0
fi

# 5. Quick deploy using validation
echo -e "\n${YELLOW}[5/5] Deploying to production...${NC}"
DEPLOY_RESULT=$(sf project deploy quick \
  --job-id "$VALIDATION_ID" \
  -o "$ORG_ALIAS" \
  --wait "$WAIT_TIME" \
  --json)

DEPLOY_STATUS=$(echo "$DEPLOY_RESULT" | jq -r '.result.status')

if [ "$DEPLOY_STATUS" = "Succeeded" ]; then
  echo -e "\n${GREEN}========================================"
  echo "✓ Deployment Successful"
  echo "========================================${NC}"
  exit 0
else
  echo -e "\n${RED}========================================"
  echo "✗ Deployment Failed"
  echo "========================================${NC}"
  echo "$DEPLOY_RESULT" | jq '.result'
  exit 1
fi
```

## Related Commands

- `sf project deploy start`: Deploy with tests
- `sf project deploy quick`: Quick deploy after validation
- `sf project deploy report`: View deployment and test results
- `sf apex test run`: Run tests separately
- `sf apex get test`: Get test results

## Related Workflows

- [Deployment by File](./deployment-by-file.md): Deploy specific files
- [Deployment by Type](./deployment-by-type.md): Deploy by metadata type
- [Testing](./testing.md): Run Apex tests independently
- [Debugging](./debugging.md): Debug test and deployment failures
