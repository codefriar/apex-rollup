# Workflow: Running Apex Tests

## Overview

This workflow demonstrates how to run Apex tests independently of deployments using the `sf apex test run` command. This is essential for test-driven development, continuous integration, and quality assurance.

## Use Cases

- Run tests during development without deploying
- Continuous Integration (CI/CD) test execution
- Verify code coverage before deployment
- Regression testing
- Test-driven development (TDD)
- Troubleshooting test failures

## Prerequisites

- Authenticated to target org
- Test classes exist in the org
- Test classes are properly annotated with `@IsTest`

## Basic Workflows

### 1. Run All Tests in Org

```bash
sf apex test run \
  -o my-org \
  -c \
  -v
```

Flags:

- `-c` or `--code-coverage`: Include code coverage
- `-v` or `--result-format`: Output format (human, tap, junit, json)

### 2. Run Specific Test Class

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  -c \
  -v
```

### 3. Run Multiple Test Classes

```bash
sf apex test run \
  -t MyClassTest,AnotherTest,YetAnotherTest \
  -o my-org \
  -c \
  -v
```

### 4. Run Specific Test Methods

```bash
sf apex test run \
  -t MyClassTest.testMethod1,MyClassTest.testMethod2 \
  -o my-org \
  -c \
  -v
```

### 5. Run Tests in Synchronous Mode

Wait for tests to complete:

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  -c \
  -v \
  --synchronous
```

## Test Execution Modes

### Synchronous vs Asynchronous

**Synchronous** (default with `-v`):

- Waits for tests to complete
- Streams results as they come
- Better for CI/CD pipelines

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  --synchronous
```

**Asynchronous**:

- Returns immediately with test run ID
- Poll for results separately
- Better for long-running test suites

```bash
# Start async test run
TEST_RUN_ID=$(sf apex test run \
  -t MyClassTest \
  -o my-org \
  --json | jq -r '.result.testRunId')

# Get results later
sf apex get test -i $TEST_RUN_ID -o my-org
```

## Output Formats

### Human-Readable (Default)

```bash
sf apex test run -t MyClassTest -o my-org -v
```

### JSON Format

```bash
sf apex test run -t MyClassTest -o my-org --json
```

### TAP Format (Test Anything Protocol)

```bash
sf apex test run -t MyClassTest -o my-org --result-format tap
```

### JUnit XML Format

```bash
sf apex test run -t MyClassTest -o my-org --result-format junit
```

## Code Coverage

### Get Code Coverage

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  -c
```

### Get Detailed Coverage

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  -c \
  --detailed-coverage
```

### Output Coverage to File

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  -c \
  --json > test-results.json

# Parse coverage
jq '.result.coverage' test-results.json
```

## Test Levels

### Run Local Tests Only

Exclude managed package tests:

```bash
sf apex test run \
  -l RunLocalTests \
  -o my-org \
  -c \
  -v
```

### Run All Tests

Include managed package tests:

```bash
sf apex test run \
  -l RunAllTestsInOrg \
  -o my-org \
  -c \
  -v
```

### Run Specified Tests

```bash
sf apex test run \
  -l RunSpecifiedTests \
  -t MyClassTest \
  -o my-org \
  -c \
  -v
```

## Advanced Patterns

### Run Tests by Suite

```bash
sf apex test run \
  -s "Nightly Suite" \
  -o my-org \
  -c \
  -v
```

### Run Tests with Custom Wait Time

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  -w 30 \
  -c \
  -v
```

### Run Tests with Maximum Detail

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  -c \
  --detailed-coverage \
  -v \
  --synchronous \
  --json > full-test-report.json
```

### Run Tests by Test Class Pattern

```bash
# Get all test classes
TEST_CLASSES=$(sf apex list log -o my-org --json | \
  jq -r '.result[] | select(.Operation | contains("Test")) | .Operation' | \
  sort -u | tr '\n' ',')

# Run tests
sf apex test run -t "$TEST_CLASSES" -o my-org -c -v
```

## Monitoring Test Execution

### Check Test Run Status

```bash
# Start test run
TEST_RUN_ID=$(sf apex test run \
  -t MyClassTest \
  -o my-org \
  --json | jq -r '.result.testRunId')

# Monitor status
sf apex get test -i $TEST_RUN_ID -o my-org
```

### Poll for Test Completion

```bash
#!/bin/bash

TEST_RUN_ID=$(sf apex test run \
  -t MyClassTest \
  -o my-org \
  --json | jq -r '.result.testRunId')

while true; do
  STATUS=$(sf apex get test -i $TEST_RUN_ID -o my-org --json | \
    jq -r '.result.summary.outcome')

  echo "Status: $STATUS"

  if [ "$STATUS" = "Passed" ] || [ "$STATUS" = "Failed" ]; then
    break
  fi

  sleep 5
done

# Get final results
sf apex get test -i $TEST_RUN_ID -o my-org -c
```

## Test Result Analysis

### View Test Failures

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  --json | jq '.result.tests[] | select(.Outcome == "Fail")'
```

### View Test Summary

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  --json | jq '.result.summary'
```

### Extract Coverage Per Class

```bash
sf apex test run \
  -t MyClassTest \
  -o my-org \
  -c \
  --json | jq '.result.coverage.coverage[] | {
    name: .name,
    percentCovered: .percentCovered,
    numLocations: .numLocations,
    numLocationsNotCovered: .numLocationsNotCovered
  }'
```

### Find Classes Below Coverage Threshold

```bash
sf apex test run \
  -l RunLocalTests \
  -o my-org \
  -c \
  --json | jq '.result.coverage.coverage[] |
    select(.percentCovered < 75) |
    {name: .name, coverage: .percentCovered}'
```

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Run Apex Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Install Salesforce CLI
        run: npm install -g @salesforce/cli

      - name: Authenticate to Org
        run: |
          echo "${{ secrets.SF_AUTH_URL }}" > auth.txt
          sf org login sfdx-url -f auth.txt -a test-org

      - name: Run Tests
        run: |
          sf apex test run \
            -l RunLocalTests \
            -o test-org \
            -c \
            -v \
            --result-format junit \
            --output-dir ./test-results

      - name: Publish Test Results
        uses: actions/upload-artifact@v2
        if: always()
        with:
          name: test-results
          path: ./test-results
```

### GitLab CI Example

```yaml
test:
  stage: test
  script:
    - npm install -g @salesforce/cli
    - echo "$SF_AUTH_URL" > auth.txt
    - sf org login sfdx-url -f auth.txt -a test-org
    - |
      sf apex test run \
        -l RunLocalTests \
        -o test-org \
        -c \
        -v \
        --result-format junit \
        --output-dir ./test-results
  artifacts:
    reports:
      junit: test-results/*.xml
```

## Best Practices

### 1. Always Include Code Coverage

```bash
sf apex test run -t MyClassTest -o my-org -c -v
```

### 2. Use Specific Tests During Development

Faster feedback loop:

```bash
sf apex test run -t MyClassTest -o my-org -c -v
```

### 3. Run All Local Tests Before Production

```bash
sf apex test run -l RunLocalTests -o my-org -c -v
```

### 4. Use JSON Output for Automation

```bash
sf apex test run -t MyClassTest -o my-org --json > results.json
```

### 5. Set Appropriate Timeouts

```bash
# For long-running tests
sf apex test run -t MyClassTest -o my-org -w 60 -c -v
```

### 6. Monitor Test Execution Time

```bash
sf apex test run -t MyClassTest -o my-org --json | \
  jq '.result.tests[] | {method: .MethodName, time: .RunTime}'
```

## Troubleshooting

### Test Timeout

**Symptom**: Tests time out before completing

**Solution**:

```bash
# Increase wait time
sf apex test run -t MyClassTest -o my-org -w 120 -c -v
```

### Test Failures

**Symptom**: Tests fail unexpectedly

**Solution**:

```bash
# Get detailed failure information
sf apex test run -t MyClassTest -o my-org --json | \
  jq '.result.tests[] | select(.Outcome == "Fail") | {
    class: .ApexClass.Name,
    method: .MethodName,
    message: .Message,
    stackTrace: .StackTrace
  }'
```

### Insufficient Code Coverage

**Symptom**: Coverage below 75%

**Solution**:

```bash
# Identify classes with low coverage
sf apex test run -l RunLocalTests -o my-org -c --json | \
  jq '.result.coverage.coverage[] |
    select(.percentCovered < 75) |
    {
      name: .name,
      covered: .percentCovered,
      uncoveredLines: .numLocationsNotCovered
    }'
```

### No Test Results

**Symptom**: Command completes but no results shown

**Solution**:

```bash
# Use synchronous mode
sf apex test run -t MyClassTest -o my-org --synchronous -c -v
```

### Test Not Found

**Symptom**: "Unable to find ApexClass named MyClassTest"

**Solution**:

```bash
# Verify test class exists
sf apex list log -o my-org | grep MyClassTest

# Ensure test class is deployed
sf project deploy start -m ApexClass:MyClassTest -o my-org
```

## Complete Example

Comprehensive test execution script:

```bash
#!/bin/bash

# Configuration
ORG_ALIAS="dev-sandbox"
TEST_CLASSES="AccountServiceTest,ContactServiceTest"
MIN_COVERAGE=75
OUTPUT_DIR="./test-results"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "========================================"
echo "Apex Test Execution"
echo "========================================"

# 1. Verify org
echo -e "\n${YELLOW}[1/4] Verifying org authentication...${NC}"
if ! sf org list | grep -q "$ORG_ALIAS"; then
  echo -e "${RED}✗ Org not authenticated${NC}"
  exit 1
fi
echo -e "${GREEN}✓ Org authenticated${NC}"

# 2. Run tests
echo -e "\n${YELLOW}[2/4] Running tests...${NC}"
mkdir -p "$OUTPUT_DIR"

TEST_RESULT=$(sf apex test run \
  -t "$TEST_CLASSES" \
  -o "$ORG_ALIAS" \
  -c \
  --detailed-coverage \
  --result-format json \
  --output-dir "$OUTPUT_DIR" \
  --json)

# Save results
echo "$TEST_RESULT" > "$OUTPUT_DIR/full-results.json"

# 3. Analyze results
echo -e "\n${YELLOW}[3/4] Analyzing results...${NC}"

# Test summary
TOTAL_TESTS=$(echo "$TEST_RESULT" | jq '.result.summary.testsRan')
PASSED=$(echo "$TEST_RESULT" | jq '.result.summary.passing')
FAILED=$(echo "$TEST_RESULT" | jq '.result.summary.failing')
COVERAGE=$(echo "$TEST_RESULT" | jq -r '.result.summary.testRunCoverage' | sed 's/%//')

echo "Tests Run: $TOTAL_TESTS"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo "Coverage: ${COVERAGE}%"

# 4. Check results
echo -e "\n${YELLOW}[4/4] Validation...${NC}"

# Check test failures
if [ "$FAILED" -gt 0 ]; then
  echo -e "${RED}✗ $FAILED test(s) failed${NC}"
  echo -e "\n${RED}Failures:${NC}"
  echo "$TEST_RESULT" | jq -r '.result.tests[] |
    select(.Outcome == "Fail") |
    "- \(.ApexClass.Name).\(.MethodName): \(.Message)"'
  exit 1
fi

# Check coverage
if [ "${COVERAGE%.*}" -lt "$MIN_COVERAGE" ]; then
  echo -e "${RED}✗ Coverage below minimum (${MIN_COVERAGE}%)${NC}"

  echo -e "\n${RED}Classes with low coverage:${NC}"
  echo "$TEST_RESULT" | jq -r '.result.coverage.coverage[] |
    select(.percentCovered < 75) |
    "- \(.name): \(.percentCovered)%"'
  exit 1
fi

# Success
echo -e "\n${GREEN}========================================"
echo "✓ All Tests Passed"
echo "✓ Coverage: ${COVERAGE}% (minimum: ${MIN_COVERAGE}%)"
echo "========================================${NC}"

exit 0
```

## Related Commands

- `sf apex test run`: Run Apex tests
- `sf apex get test`: Get test results
- `sf apex list log`: List debug logs
- `sf apex get log`: Get debug log

## Related Workflows

- [Deployment with Tests](./deployment-with-tests.md): Deploy with test execution
- [Debugging](./debugging.md): Debug test failures
- [Deployment by File](./deployment-by-file.md): Deploy test classes
- [Deployment by Type](./deployment-by-type.md): Deploy all test classes
