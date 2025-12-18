# Workflow: Debugging Salesforce Applications

## Overview

This workflow demonstrates how to debug Salesforce applications using the `sf` CLI, including accessing debug logs, analyzing deployment failures, troubleshooting test failures, and investigating runtime issues.

## Use Cases

- Debug deployment failures
- Troubleshoot test failures
- Investigate runtime errors
- Monitor API calls and performance
- Track governor limit usage
- Analyze code execution flow

## Prerequisites

- Authenticated to target org
- Appropriate logging levels configured
- Understanding of Salesforce debug log structure

## Debug Logs

### 1. List Available Debug Logs

```bash
sf apex list log -o my-org
```

### 2. Get Most Recent Debug Log

```bash
sf apex get log -n 1 -o my-org
```

### 3. Get Specific Debug Log by ID

```bash
sf apex get log -i <LOG_ID> -o my-org
```

### 4. Save Debug Log to File

```bash
sf apex get log -i <LOG_ID> -o my-org > debug.log
```

### 5. Tail Debug Logs (Real-time)

```bash
sf apex tail log -o my-org
```

### 6. Tail with Color Coding

```bash
sf apex tail log -o my-org --color
```

## Debug Log Levels

### View Current Log Levels

```bash
sf data query \
  -q "SELECT Id, LoggedEntity, TracedEntity, DebugLevel.DeveloperName FROM TraceFlag" \
  -o my-org \
  -t
```

### Configure Debug Levels Programmatically

```bash
# Create a debug level via Tooling API
sf data create record \
  -s DebugLevel \
  -v "DeveloperName=MyDebugLevel ApexCode=DEBUG Database=INFO Workflow=INFO Validation=INFO" \
  -o my-org \
  --use-tooling-api
```

## Debugging Deployment Failures

### 1. View Deployment Error Details

```bash
# Get deployment report with full error details
sf project deploy report -i <JOB_ID> -o my-org
```

### 2. Parse Deployment Errors as JSON

```bash
sf project deploy report -i <JOB_ID> -o my-org --json | \
  jq '.result.details.componentFailures[] | {
    componentType: .componentType,
    fileName: .fileName,
    problemType: .problemType,
    problem: .problem,
    lineNumber: .lineNumber
  }'
```

### 3. Extract Compilation Errors

```bash
sf project deploy report -i <JOB_ID> -o my-org --json | \
  jq '.result.details.componentFailures[] |
    select(.problemType == "Error") |
    "\(.fileName):\(.lineNumber) - \(.problem)"'
```

### 4. View Deployment Warnings

```bash
sf project deploy report -i <JOB_ID> -o my-org --json | \
  jq '.result.details.componentFailures[] |
    select(.problemType == "Warning")'
```

## Debugging Test Failures

### 1. View Test Failure Details

```bash
sf apex get test -i <TEST_RUN_ID> -o my-org --json | \
  jq '.result.tests[] | select(.Outcome == "Fail") | {
    class: .ApexClass.Name,
    method: .MethodName,
    message: .Message,
    stackTrace: .StackTrace
  }'
```

### 2. Get Debug Logs for Failed Tests

```bash
# List logs for specific test
sf apex list log -o my-org | grep "MyClassTest"

# Get specific test log
sf apex get log -i <LOG_ID> -o my-org > test-failure.log
```

### 3. Analyze Test Coverage Gaps

```bash
sf apex test run -t MyClassTest -o my-org -c --json | \
  jq '.result.coverage.coverage[] | {
    name: .name,
    percentCovered: .percentCovered,
    uncoveredLines: .uncoveredLines
  }'
```

### 4. View Specific Test Method Output

```bash
sf apex test run -t MyClassTest.testMethod -o my-org --json | \
  jq '.result.tests[] | {
    method: .MethodName,
    outcome: .Outcome,
    message: .Message,
    runtime: .RunTime
  }'
```

## Debugging Runtime Issues

### 1. Enable Debug Logging for User

Set trace flag for specific user:

```bash
# Create trace flag (requires DebugLevel ID)
sf data create record \
  -s TraceFlag \
  -v "TracedEntityId=<USER_ID> DebugLevelId=<DEBUG_LEVEL_ID> StartDate=$(date -u +%Y-%m-%dT%H:%M:%SZ) ExpirationDate=$(date -u -d '+1 hour' +%Y-%m-%dT%H:%M:%SZ)" \
  -o my-org \
  --use-tooling-api
```

### 2. Monitor Real-time Logs

```bash
# Tail logs with filtering
sf apex tail log -o my-org --color | grep ERROR
```

### 3. Search Logs for Specific Patterns

```bash
# Get recent log and search
sf apex get log -n 1 -o my-org | grep "EXCEPTION"
```

### 4. Analyze Governor Limits

```bash
# Extract governor limit info from log
sf apex get log -i <LOG_ID> -o my-org | grep "LIMIT_USAGE"
```

## Analyzing Debug Logs

### Log Structure

Debug logs contain:

- **EXECUTION_STARTED**: Entry point
- **EXECUTION_FINISHED**: Exit point
- **CODE_UNIT_STARTED**: Method entry
- **CODE_UNIT_FINISHED**: Method exit
- **SOQL_EXECUTE_BEGIN**: SOQL query execution
- **SOQL_EXECUTE_END**: SOQL results
- **DML_BEGIN**: DML operation start
- **DML_END**: DML operation end
- **EXCEPTION_THROWN**: Exceptions
- **FATAL_ERROR**: Fatal errors
- **LIMIT_USAGE_FOR_NS**: Governor limits

### Parse Log for Exceptions

```bash
sf apex get log -i <LOG_ID> -o my-org | grep -A 5 "EXCEPTION_THROWN"
```

### Parse Log for SOQL Queries

```bash
sf apex get log -i <LOG_ID> -o my-org | grep "SOQL_EXECUTE_BEGIN"
```

### Parse Log for DML Operations

```bash
sf apex get log -i <LOG_ID> -o my-org | grep "DML_BEGIN"
```

### Extract Execution Time

```bash
sf apex get log -i <LOG_ID> -o my-org | \
  grep -E "(EXECUTION_STARTED|EXECUTION_FINISHED)" | \
  awk '{print $2}'
```

## Advanced Debugging Patterns

### 1. Replay Debugger (VS Code)

Export logs for Apex Replay Debugger:

```bash
# Get log and save
sf apex get log -i <LOG_ID> -o my-org -d ./logs/
```

### 2. Automated Log Collection Script

```bash
#!/bin/bash

ORG="my-org"
OUTPUT_DIR="./debug-logs"
NUM_LOGS=10

mkdir -p "$OUTPUT_DIR"

# Get list of recent logs
LOG_IDS=$(sf apex list log -o "$ORG" --json | \
  jq -r '.result[:'"$NUM_LOGS"'] | .[].Id')

# Download each log
for log_id in $LOG_IDS; do
  echo "Downloading log: $log_id"
  sf apex get log -i "$log_id" -o "$ORG" > "$OUTPUT_DIR/$log_id.log"
done

echo "Downloaded $NUM_LOGS logs to $OUTPUT_DIR"
```

### 3. Search Logs for Specific Error

```bash
#!/bin/bash

ORG="my-org"
SEARCH_TERM="EXCEPTION_THROWN"

# Get recent logs
LOG_IDS=$(sf apex list log -o "$ORG" --json | jq -r '.result[].Id')

# Search each log
for log_id in $LOG_IDS; do
  CONTENT=$(sf apex get log -i "$log_id" -o "$ORG")
  if echo "$CONTENT" | grep -q "$SEARCH_TERM"; then
    echo "Found in log: $log_id"
    echo "$CONTENT" | grep -A 5 "$SEARCH_TERM"
    echo "---"
  fi
done
```

### 4. Performance Analysis

Extract performance metrics from log:

```bash
sf apex get log -i <LOG_ID> -o my-org | \
  awk '/LIMIT_USAGE_FOR_NS/ {
    print "Governor Limits:";
    getline; print $0;
  }'
```

## Common Debugging Scenarios

### Scenario 1: Deployment Fails with Compilation Error

```bash
# 1. Get deployment details
sf project deploy report -i <JOB_ID> -o my-org --json > deploy-error.json

# 2. Extract error details
jq '.result.details.componentFailures[] | {
  file: .fileName,
  line: .lineNumber,
  error: .problem
}' deploy-error.json

# 3. Fix the code at specified line
# 4. Redeploy
sf project deploy start -d <FILE_PATH> -o my-org
```

### Scenario 2: Test Fails with Unexpected Result

```bash
# 1. Run test with coverage
sf apex test run -t MyClassTest -o my-org -c --json > test-result.json

# 2. Get test failure details
jq '.result.tests[] | select(.Outcome == "Fail")' test-result.json

# 3. Get debug log for test
LOG_ID=$(sf apex list log -o my-org --json | \
  jq -r '.result[] | select(.Operation | contains("MyClassTest")) | .Id' | \
  head -1)

# 4. Analyze log
sf apex get log -i "$LOG_ID" -o my-org > test-debug.log
grep "USER_DEBUG" test-debug.log
```

### Scenario 3: Production Issue Reported

```bash
# 1. Enable debug logging for affected user
# (Set trace flag via UI or API)

# 2. Reproduce issue

# 3. Collect debug logs
sf apex list log -o production | grep "<USER_NAME>"

# 4. Download and analyze
sf apex get log -i <LOG_ID> -o production > production-issue.log

# 5. Search for exceptions
grep "EXCEPTION_THROWN" production-issue.log
```

### Scenario 4: Governor Limit Hit

```bash
# 1. Get recent logs
sf apex list log -o my-org

# 2. Download log
sf apex get log -i <LOG_ID> -o my-org > limits.log

# 3. Analyze limits
grep "LIMIT_USAGE" limits.log

# 4. Identify specific limit exceeded
grep -E "(SOQL|DML|CPU|HEAP)" limits.log
```

## Debug Log Analysis Tools

### Extract System.debug Statements

```bash
sf apex get log -i <LOG_ID> -o my-org | \
  grep "USER_DEBUG" | \
  awk -F'|' '{print $NF}'
```

### Extract SOQL Queries with Row Counts

```bash
sf apex get log -i <LOG_ID> -o my-org | \
  grep -A 1 "SOQL_EXECUTE_BEGIN" | \
  grep -v "^--$"
```

### Extract DML Operations

```bash
sf apex get log -i <LOG_ID> -o my-org | \
  grep -E "(DML_BEGIN|DML_END)"
```

### Calculate Total Execution Time

```bash
LOG_CONTENT=$(sf apex get log -i <LOG_ID> -o my-org)

START=$(echo "$LOG_CONTENT" | grep "EXECUTION_STARTED" | awk '{print $2}' | tr -d '()')
END=$(echo "$LOG_CONTENT" | grep "EXECUTION_FINISHED" | awk '{print $2}' | tr -d '()')

echo "Execution time: $((END - START)) ms"
```

## Best Practices

### 1. Use Appropriate Log Levels

Set debug levels based on debugging needs:

- **Development**: FINEST for Apex, DEBUG for Database
- **Production troubleshooting**: INFO for Apex, INFO for Database
- **Performance analysis**: DEBUG for Apex, FINE for Profiling

### 2. Clean Up Old Logs

```bash
# Logs consume storage - delete old ones
sf data delete bulk -f log-ids.csv -o my-org
```

### 3. Use Trace Flags Sparingly

Trace flags impact performance - set expiration times:

```bash
# Set trace flag for 1 hour only
StartDate=$(date -u +%Y-%m-%dT%H:%M:%SZ)
ExpirationDate=$(date -u -d '+1 hour' +%Y-%m-%dT%H:%M:%SZ)
```

### 4. Search Before Downloading All Logs

Use filters to narrow down relevant logs:

```bash
sf apex list log -o my-org | grep "FAILED"
```

### 5. Automate Log Collection in CI/CD

Collect logs on test failure:

```bash
if [ $? -ne 0 ]; then
  echo "Tests failed, collecting logs..."
  sf apex get log -n 5 -o my-org -d ./failure-logs/
fi
```

## Troubleshooting Common Issues

### Issue: No Debug Logs Generated

**Cause**: No trace flags set or expired

**Solution**:

```bash
# Check trace flags
sf data query \
  -q "SELECT Id, ExpirationDate, TracedEntityId FROM TraceFlag" \
  -o my-org \
  -t

# Create new trace flag if needed
```

### Issue: Debug Log Size Limit Exceeded

**Cause**: Log grew beyond 20MB limit

**Solution**:

- Reduce debug level verbosity
- Focus logging on specific areas
- Break operations into smaller chunks

### Issue: Cannot Find Specific Log

**Cause**: Logs are deleted after 24 hours (or 7 days for retained logs)

**Solution**:

```bash
# Enable log retention
sf data update record \
  -s User \
  -w "Username='user@example.com'" \
  -v "UserPreferencesUserDebugModePref=true" \
  -o my-org
```

### Issue: Tail Log Shows Nothing

**Cause**: No active operations or trace flags

**Solution**:

- Ensure trace flag is active
- Trigger an operation
- Check log levels are not set to NONE

## Complete Debugging Script

```bash
#!/bin/bash

# Comprehensive debugging script
ORG="my-org"
OUTPUT_DIR="./debug-output"
ISSUE_ID="BUG-123"

mkdir -p "$OUTPUT_DIR"

echo "========================================"
echo "Salesforce Debugging Session: $ISSUE_ID"
echo "========================================"

# 1. Collect debug logs
echo -e "\n[1/5] Collecting debug logs..."
LOG_IDS=$(sf apex list log -o "$ORG" --json | jq -r '.result[:5] | .[].Id')

for log_id in $LOG_IDS; do
  sf apex get log -i "$log_id" -o "$ORG" > "$OUTPUT_DIR/log-$log_id.log"
done

# 2. Run tests
echo -e "\n[2/5] Running tests..."
sf apex test run \
  -l RunLocalTests \
  -o "$ORG" \
  -c \
  --json > "$OUTPUT_DIR/test-results.json"

# 3. Analyze test failures
echo -e "\n[3/5] Analyzing test failures..."
jq '.result.tests[] | select(.Outcome == "Fail")' \
  "$OUTPUT_DIR/test-results.json" > "$OUTPUT_DIR/test-failures.json"

# 4. Analyze deployment
echo -e "\n[4/5] Checking recent deployments..."
sf project deploy report --json > "$OUTPUT_DIR/latest-deployment.json" 2>/dev/null || true

# 5. Generate summary
echo -e "\n[5/5] Generating summary..."
cat > "$OUTPUT_DIR/summary.txt" <<EOF
Debugging Summary for $ISSUE_ID
Generated: $(date)

Debug Logs Collected: $(echo "$LOG_IDS" | wc -l)
Test Failures: $(jq '.result.summary.failing' "$OUTPUT_DIR/test-results.json")
Code Coverage: $(jq -r '.result.summary.testRunCoverage' "$OUTPUT_DIR/test-results.json")

See $OUTPUT_DIR for detailed logs and results.
EOF

cat "$OUTPUT_DIR/summary.txt"

echo -e "\n✓ Debugging data collected in: $OUTPUT_DIR"
```

## Related Commands

- `sf apex get log`: Get debug log
- `sf apex list log`: List debug logs
- `sf apex tail log`: Tail debug logs in real-time
- `sf project deploy report`: View deployment details
- `sf apex test run`: Run tests
- `sf apex get test`: Get test results

## Related Workflows

- [Testing](./testing.md): Run and debug tests
- [Deployment with Tests](./deployment-with-tests.md): Debug deployment test failures
- [Deployment by File](./deployment-by-file.md): Debug file deployments
- [Deployment by Type](./deployment-by-type.md): Debug type-based deployments
