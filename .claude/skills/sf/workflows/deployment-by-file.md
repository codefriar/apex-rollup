# Workflow: Deploy Metadata by File

## Overview

This workflow demonstrates how to deploy specific Salesforce metadata files to an org using the `sf` CLI. This is the most targeted deployment approach when you know exactly which files have changed.

## Use Cases

- Deploy a single modified Apex class
- Deploy multiple specific files across different metadata types
- Deploy only the files that passed code review
- Quick iteration during development

## Prerequisites

- Authenticated to target org
- Metadata files exist in project structure
- Files are in valid Salesforce metadata format

## Basic Workflow

### 1. Deploy a Single File

Deploy a single Apex class:

```bash
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org
```

Deploy a Lightning Web Component:

```bash
sf project deploy start \
  -d force-app/main/default/lwc/myComponent \
  -o my-org
```

### 2. Deploy Multiple Specific Files

Deploy multiple files using multiple `-d` flags:

```bash
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -d force-app/main/default/classes/MyOtherClass.cls \
  -d force-app/main/default/triggers/MyTrigger.trigger \
  -o my-org
```

### 3. Verify Deployment Before Executing

Use `--dry-run` (check-only) to validate without deploying:

```bash
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org \
  --dry-run
```

### 4. Monitor Deployment Progress

Get deployment status using the job ID:

```bash
# Start deployment (note the job ID in output)
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org

# Check status
sf project deploy report -i <JOB_ID> -o my-org
```

### 5. Deploy with Wait and Polling

Wait for deployment to complete:

```bash
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org \
  --wait 10
```

## Common Patterns

### Deploy Modified Files from Git

Deploy only files changed in last commit:

```bash
# Get list of changed files
CHANGED_FILES=$(git diff --name-only HEAD~1 HEAD | grep "force-app")

# Deploy each file
for file in $CHANGED_FILES; do
  sf project deploy start -d "$file" -o my-org
done
```

Or deploy all at once:

```bash
# Build the command with all files
CMD="sf project deploy start -o my-org"
for file in $(git diff --name-only HEAD~1 HEAD | grep "force-app"); do
  CMD="$CMD -d $file"
done
eval $CMD
```

### Deploy with JSON Output for Scripting

```bash
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org \
  --json | jq -r '.result.id'
```

### Deploy Directory Path

Deploy an entire directory:

```bash
sf project deploy start \
  -d force-app/main/default/classes \
  -o my-org
```

### Deploy with API Version

Specify API version:

```bash
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org \
  --api-version 65.0
```

## Advanced Scenarios

### Deploy with Ignore Warnings

Ignore deployment warnings and proceed:

```bash
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org \
  --ignore-warnings
```

### Deploy Metadata and Tests Together

Deploy class and its test class:

```bash
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -d force-app/main/default/classes/MyClassTest.cls \
  -o my-org
```

### Cancel In-Progress Deployment

```bash
# Start deployment
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org

# Cancel using job ID
sf project deploy cancel -i <JOB_ID> -o my-org
```

## File Path Considerations

### Meta XML Files

When deploying metadata files, you generally don't need to specify the `-meta.xml` file explicitly. The CLI handles it automatically:

```bash
# This deploys both MyClass.cls and MyClass.cls-meta.xml
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org
```

### Bundle Metadata (LWC, Aura)

For bundle metadata, specify the directory:

```bash
# Deploy LWC component (entire bundle)
sf project deploy start \
  -d force-app/main/default/lwc/myComponent \
  -o my-org

# Deploy Aura component (entire bundle)
sf project deploy start \
  -d force-app/main/default/aura/MyAuraComponent \
  -o my-org
```

### Relative vs Absolute Paths

Both relative and absolute paths work:

```bash
# Relative path (from project root)
sf project deploy start -d force-app/main/default/classes/MyClass.cls -o my-org

# Absolute path
sf project deploy start -d /Users/username/project/force-app/main/default/classes/MyClass.cls -o my-org
```

## Error Handling

### Common Errors and Solutions

#### File Not Found

```bash
ERROR: The specified file does not exist
```

**Solution**: Verify file path is correct and file exists.

#### Invalid Metadata Format

```bash
ERROR: Failed to parse metadata
```

**Solution**: Validate XML syntax in metadata files.

#### Org Not Found

```bash
ERROR: No org configuration found for name my-org
```

**Solution**: Verify org alias with `sf org list` and authenticate if needed.

### Validation Before Deploy

Check files before deploying:

```bash
# List files to be deployed
ls -la force-app/main/default/classes/MyClass.*

# Validate metadata format
sf project deploy start \
  -d force-app/main/default/classes/MyClass.cls \
  -o my-org \
  --dry-run
```

## Best Practices

### 1. Always Specify Target Org

Never rely on default org for production deployments:

```bash
# Good
sf project deploy start -d path/to/file -o production-alias

# Risky
sf project deploy start -d path/to/file
```

### 2. Use Dry Run First

Validate before deploying to production:

```bash
# Validate
sf project deploy start -d path/to/file -o prod --dry-run

# Deploy if validation passes
sf project deploy start -d path/to/file -o prod
```

### 3. Deploy Related Dependencies

When deploying a file, consider its dependencies:

```bash
# Deploy class with its test
sf project deploy start \
  -d force-app/main/default/classes/MyService.cls \
  -d force-app/main/default/classes/MyServiceTest.cls \
  -o my-org
```

### 4. Use Version Control Integration

Deploy based on git changes for consistency:

```bash
# Deploy files changed in feature branch
git diff --name-only main...HEAD | grep "force-app" | while read file; do
  sf project deploy start -d "$file" -o my-org
done
```

### 5. Monitor Large Deployments

Use `--wait` for synchronous deployment and error detection:

```bash
sf project deploy start \
  -d path/to/large/directory \
  -o my-org \
  --wait 30
```

## Troubleshooting

### Get Deployment Details

Check specific deployment results:

```bash
sf project deploy report -i <JOB_ID> -o my-org --json
```

### View Deployment Failures

```bash
sf project deploy report -i <JOB_ID> -o my-org | grep "ComponentFailure"
```

### Retry Failed Deployment

After fixing errors, retry the same deployment:

```bash
# Fix the file
# Then redeploy
sf project deploy start -d path/to/fixed/file -o my-org
```

## Complete Example

Deploy a modified Apex class with its test to a sandbox:

```bash
#!/bin/bash

# Variables
ORG_ALIAS="dev-sandbox"
CLASS_PATH="force-app/main/default/classes/AccountService.cls"
TEST_PATH="force-app/main/default/classes/AccountServiceTest.cls"

# 1. Verify org authentication
echo "Checking org authentication..."
sf org list | grep "$ORG_ALIAS" || {
  echo "Org not authenticated!"
  exit 1
}

# 2. Validate deployment
echo "Validating deployment..."
sf project deploy start \
  -d "$CLASS_PATH" \
  -d "$TEST_PATH" \
  -o "$ORG_ALIAS" \
  --dry-run \
  || {
    echo "Validation failed!"
    exit 1
  }

# 3. Deploy to org
echo "Deploying to org..."
RESULT=$(sf project deploy start \
  -d "$CLASS_PATH" \
  -d "$TEST_PATH" \
  -o "$ORG_ALIAS" \
  --wait 10 \
  --json)

# 4. Check result
JOB_ID=$(echo "$RESULT" | jq -r '.result.id')
STATUS=$(echo "$RESULT" | jq -r '.result.status')

echo "Deployment ID: $JOB_ID"
echo "Status: $STATUS"

if [ "$STATUS" = "Succeeded" ]; then
  echo "✓ Deployment successful!"
  exit 0
else
  echo "✗ Deployment failed!"
  echo "$RESULT" | jq -r '.result.details.componentFailures[]'
  exit 1
fi
```

## Related Commands

- `sf project deploy start`: Deploy metadata to an org
- `sf project deploy report`: Check deployment status
- `sf project deploy cancel`: Cancel in-progress deployment
- `sf project deploy validate`: Validate deployment without deploying

## Related Workflows

- [Deployment by Type](./deployment-by-type.md): Deploy by metadata type
- [Deployment with Tests](./deployment-with-tests.md): Deploy and run tests
- [Testing](./testing.md): Run Apex tests
- [Debugging](./debugging.md): Debug deployment failures
