# Workflow: Deploy Metadata by Type

## Overview

This workflow demonstrates how to deploy Salesforce metadata by specifying metadata types and names using the `--metadata` (`-m`) flag. This approach is more flexible than deploying by file path and doesn't require knowing exact file locations.

## Use Cases

- Deploy all metadata of a specific type (e.g., all Apex classes)
- Deploy specific metadata components by API name
- Deploy multiple metadata types in a single command
- Deploy metadata across multiple directories
- Production deployments using metadata type names

## Prerequisites

- Authenticated to target org
- Know metadata type API names
- Know component API names (for specific deployments)

## Basic Workflow

### 1. Deploy Specific Component by Type and Name

Deploy a single Apex class:

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org
```

Deploy a single Lightning Web Component:

```bash
sf project deploy start \
  -m LightningComponentBundle:myComponent \
  -o my-org
```

Deploy a custom object:

```bash
sf project deploy start \
  -m CustomObject:MyObject__c \
  -o my-org
```

### 2. Deploy Multiple Specific Components

Deploy multiple components of the same type:

```bash
sf project deploy start \
  -m ApexClass:AccountService,ApexClass:ContactService,ApexClass:LeadService \
  -o my-org
```

Deploy multiple components across different types:

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -m ApexTrigger:MyTrigger \
  -m LightningComponentBundle:myComponent \
  -o my-org
```

### 3. Deploy All Metadata of a Type

Deploy all Apex classes:

```bash
sf project deploy start \
  -m ApexClass \
  -o my-org
```

Deploy all custom objects:

```bash
sf project deploy start \
  -m CustomObject \
  -o my-org
```

### 4. Deploy Multiple Types

Deploy all Apex classes and triggers:

```bash
sf project deploy start \
  -m ApexClass \
  -m ApexTrigger \
  -o my-org
```

Deploy all Apex and Visualforce:

```bash
sf project deploy start \
  -m ApexClass \
  -m ApexTrigger \
  -m ApexPage \
  -m ApexComponent \
  -o my-org
```

## Common Metadata Types

### Apex

```bash
# Apex Classes
sf project deploy start -m ApexClass:MyClass -o my-org

# Apex Triggers
sf project deploy start -m ApexTrigger:MyTrigger -o my-org

# All Apex
sf project deploy start -m ApexClass -m ApexTrigger -o my-org
```

### Lightning Components

```bash
# Lightning Web Component
sf project deploy start -m LightningComponentBundle:myComponent -o my-org

# Aura Component
sf project deploy start -m AuraDefinitionBundle:MyAuraComponent -o my-org

# All Lightning Components
sf project deploy start -m LightningComponentBundle -m AuraDefinitionBundle -o my-org
```

### Visualforce

```bash
# Visualforce Page
sf project deploy start -m ApexPage:MyPage -o my-org

# Visualforce Component
sf project deploy start -m ApexComponent:MyComponent -o my-org

# All Visualforce
sf project deploy start -m ApexPage -m ApexComponent -o my-org
```

### Objects and Fields

```bash
# Custom Object
sf project deploy start -m CustomObject:Account -o my-org

# Custom Field
sf project deploy start -m CustomField:Account.MyField__c -o my-org

# All Custom Objects
sf project deploy start -m CustomObject -o my-org
```

### Permissions

```bash
# Permission Set
sf project deploy start -m PermissionSet:MyPermSet -o my-org

# Profile
sf project deploy start -m Profile:CustomProfile -o my-org

# All Permission Sets
sf project deploy start -m PermissionSet -o my-org
```

### Flows

```bash
# Specific Flow
sf project deploy start -m Flow:My_Flow -o my-org

# All Flows
sf project deploy start -m Flow -o my-org
```

### Static Resources

```bash
# Specific Static Resource
sf project deploy start -m StaticResource:myResource -o my-org

# All Static Resources
sf project deploy start -m StaticResource -o my-org
```

## Advanced Patterns

### Deploy with Wildcards

Deploy using wildcards in names:

```bash
# Deploy all classes starting with "Account"
sf project deploy start -m ApexClass:Account* -o my-org

# Note: Wildcard support varies by metadata type
```

### Deploy Metadata with Dependencies

Deploy a class and its test class:

```bash
sf project deploy start \
  -m ApexClass:AccountService \
  -m ApexClass:AccountServiceTest \
  -o my-org
```

Deploy object with its fields and layouts:

```bash
sf project deploy start \
  -m CustomObject:MyObject__c \
  -m Layout:MyObject__c-MyObject_Layout \
  -o my-org
```

### Deploy Using Comma-Separated List

Single flag with multiple items:

```bash
sf project deploy start \
  -m "ApexClass:Class1,ApexClass:Class2,ApexTrigger:Trigger1" \
  -o my-org
```

Multiple flags for clarity:

```bash
sf project deploy start \
  -m ApexClass:Class1 \
  -m ApexClass:Class2 \
  -m ApexTrigger:Trigger1 \
  -o my-org
```

### Combine Metadata and Source Path

Mix metadata types with source paths:

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -d force-app/main/default/lwc/myComponent \
  -o my-org
```

## Validation and Verification

### Dry Run (Check-Only)

Validate without deploying:

```bash
sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --dry-run
```

### Validate Multiple Types

```bash
sf project deploy start \
  -m ApexClass \
  -m ApexTrigger \
  -o my-org \
  --dry-run
```

## Metadata Type Reference

### Complete List of Common Types

| Metadata Type              | Description                 | Example                          |
| -------------------------- | --------------------------- | -------------------------------- |
| `ApexClass`                | Apex classes                | `ApexClass:MyClass`              |
| `ApexTrigger`              | Apex triggers               | `ApexTrigger:AccountTrigger`     |
| `ApexPage`                 | Visualforce pages           | `ApexPage:MyPage`                |
| `ApexComponent`            | Visualforce components      | `ApexComponent:MyComp`           |
| `LightningComponentBundle` | Lightning Web Components    | `LightningComponentBundle:myLwc` |
| `AuraDefinitionBundle`     | Aura components             | `AuraDefinitionBundle:MyAura`    |
| `CustomObject`             | Custom and standard objects | `CustomObject:MyObject__c`       |
| `CustomField`              | Custom fields               | `CustomField:Account.MyField__c` |
| `Layout`                   | Page layouts                | `Layout:Account-Account_Layout`  |
| `PermissionSet`            | Permission sets             | `PermissionSet:MyPermSet`        |
| `Profile`                  | User profiles               | `Profile:CustomProfile`          |
| `Flow`                     | Flows                       | `Flow:My_Flow`                   |
| `StaticResource`           | Static resources            | `StaticResource:MyResource`      |
| `CustomTab`                | Custom tabs                 | `CustomTab:MyTab`                |
| `CustomApplication`        | Custom apps                 | `CustomApplication:MyApp`        |
| `EmailTemplate`            | Email templates             | `EmailTemplate:MyTemplate`       |
| `Report`                   | Reports                     | `Report:MyReport`                |
| `Dashboard`                | Dashboards                  | `Dashboard:MyDashboard`          |

### Discover Available Types

List all metadata types in your org:

```bash
sf org list metadata-types -o my-org
```

## Production Deployment Patterns

### Standard Production Deployment

```bash
# 1. Validate with all tests
sf project deploy start \
  -m ApexClass \
  -m ApexTrigger \
  -o production \
  --dry-run \
  --test-level RunLocalTests

# 2. Deploy if validation passes
sf project deploy start \
  -m ApexClass \
  -m ApexTrigger \
  -o production \
  --test-level RunLocalTests
```

### Deploy Specific Release Package

```bash
# Deploy all components for a release
sf project deploy start \
  -m ApexClass:Feature1Service \
  -m ApexClass:Feature1ServiceTest \
  -m ApexTrigger:Feature1Trigger \
  -m ApexTrigger:Feature1TriggerTest \
  -m LightningComponentBundle:feature1Component \
  -m PermissionSet:Feature1Permissions \
  -o production
```

## Error Handling

### Common Errors

#### Missing Component

```
ERROR: Entity of type 'ApexClass' named 'MyClass' cannot be found
```

**Solution**: Verify component name and ensure it exists in your project.

#### Invalid Metadata Type

```
ERROR: Unknown metadata type: InvalidType
```

**Solution**: Check metadata type spelling and validity.

#### Dependency Error

```
ERROR: Cannot deploy component with missing dependencies
```

**Solution**: Deploy dependencies first or include them in deployment.

### Handling Failures

Check deployment status:

```bash
sf project deploy report -i <JOB_ID> -o my-org
```

## Best Practices

### 1. Use Specific Names for Targeted Deployments

```bash
# Good: Specific components
sf project deploy start -m ApexClass:MyClass -o prod

# Risky: All components
sf project deploy start -m ApexClass -o prod
```

### 2. Group Related Metadata

```bash
# Deploy feature as a unit
sf project deploy start \
  -m ApexClass:FeatureService \
  -m ApexClass:FeatureServiceTest \
  -m ApexTrigger:FeatureTrigger \
  -m ApexTrigger:FeatureTriggerTest \
  -o my-org
```

### 3. Always Validate Production Deployments

```bash
# Validate first
sf project deploy start -m ApexClass -o prod --dry-run

# Deploy after validation
sf project deploy start -m ApexClass -o prod
```

### 4. Use Type Deployment for Large-Scale Changes

When many files of same type change:

```bash
# Instead of deploying 50 individual files
sf project deploy start -m ApexClass -o my-org
```

### 5. Document Metadata Type Names

Maintain a list of metadata types used in your project:

```bash
# deployment-types.txt
ApexClass
ApexTrigger
LightningComponentBundle
PermissionSet
CustomObject
```

## Scripting Examples

### Deploy from List

```bash
#!/bin/bash

ORG="my-org"
TYPES=("ApexClass:Service1" "ApexClass:Service2" "ApexTrigger:Trigger1")

CMD="sf project deploy start -o $ORG"

for type in "${TYPES[@]}"; do
  CMD="$CMD -m $type"
done

echo "Executing: $CMD"
eval $CMD
```

### Deploy with JSON Output

```bash
#!/bin/bash

RESULT=$(sf project deploy start \
  -m ApexClass:MyClass \
  -o my-org \
  --json)

STATUS=$(echo "$RESULT" | jq -r '.result.status')
JOB_ID=$(echo "$RESULT" | jq -r '.result.id')

echo "Deployment $JOB_ID: $STATUS"
```

### Deploy All Types from Config

```bash
#!/bin/bash

# Read types from file
while IFS= read -r type; do
  echo "Deploying $type..."
  sf project deploy start -m "$type" -o my-org
done < metadata-types.txt
```

## Complete Example

Deploy a complete feature by metadata type:

```bash
#!/bin/bash

ORG_ALIAS="dev-sandbox"
FEATURE_NAME="AccountEnhancement"

# Define metadata to deploy
METADATA=(
  "ApexClass:AccountService"
  "ApexClass:AccountServiceTest"
  "ApexClass:AccountHelper"
  "ApexClass:AccountHelperTest"
  "ApexTrigger:AccountTrigger"
  "ApexTrigger:AccountTriggerTest"
  "LightningComponentBundle:accountDetails"
  "PermissionSet:AccountEnhancementAccess"
)

# Build command
CMD="sf project deploy start -o $ORG_ALIAS"
for item in "${METADATA[@]}"; do
  CMD="$CMD -m $item"
done

# Validate first
echo "Validating $FEATURE_NAME deployment..."
eval "$CMD --dry-run" || {
  echo "Validation failed!"
  exit 1
}

# Deploy
echo "Deploying $FEATURE_NAME..."
RESULT=$(eval "$CMD --wait 10 --json")

# Check result
STATUS=$(echo "$RESULT" | jq -r '.result.status')
echo "Deployment status: $STATUS"

if [ "$STATUS" = "Succeeded" ]; then
  echo "✓ $FEATURE_NAME deployed successfully!"
  exit 0
else
  echo "✗ Deployment failed!"
  echo "$RESULT" | jq -r '.result.details'
  exit 1
fi
```

## Related Commands

- `sf project deploy start`: Deploy metadata
- `sf project deploy report`: Check deployment status
- `sf org list metadata-types`: List available metadata types
- `sf project deploy validate`: Validate deployment

## Related Workflows

- [Deployment by File](./deployment-by-file.md): Deploy by file path
- [Deployment with Tests](./deployment-with-tests.md): Deploy and run tests
- [Testing](./testing.md): Run Apex tests
- [Debugging](./debugging.md): Debug deployment issues
