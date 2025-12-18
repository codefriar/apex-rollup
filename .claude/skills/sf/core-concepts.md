# Salesforce CLI Core Concepts

## OCLIF Framework

The Salesforce CLI is built on the Open CLI Framework (OCLIF), which provides:

- Consistent command structure: `sf <topic>:<command> [flags]`
- Plugin-based architecture
- Automatic help generation
- JSON output support
- Command aliases and permutations

## Command Structure

### Basic Syntax

```bash
sf <topic>:<command> [flags] [arguments]
```

Example:

```bash
sf project deploy start --metadata ApexClass:MyClass --target-org my-org
```

### Topic Hierarchy

Commands are organized by topic (e.g., `project`, `org`, `apex`):

- Topics group related commands
- Commands can have sub-topics (e.g., `apex:run:test`)
- Use colons (`:`) to separate topic levels

### Command Permutations

Many commands support alternative syntaxes:

```bash
sf project deploy start
sf deploy project start  # Alternative permutation
```

## Global Flags

These flags work with all commands:

### `--json`

- Outputs command results in JSON format
- Useful for scripting and automation
- Machine-readable output

```bash
sf org list --json
```

### `--help` or `-h`

- Displays detailed help for a command
- Shows all flags, examples, and descriptions

```bash
sf project deploy start --help
```

### `--flags-dir <directory>`

- Import flag values from files in a directory
- Useful for complex deployments or CI/CD

## Common Flag Patterns

### Target Org Specification

Most commands that interact with an org accept:

- `--target-org` or `-o`: Specify org username or alias
- Uses default org if not specified

```bash
sf apex test run -o my-org
```

### API Version Override

- `--api-version`: Override the default API version for requests

```bash
sf project deploy start --api-version 65.0
```

### Metadata Specification

Multiple ways to specify metadata:

#### By Metadata Type and Name

```bash
--metadata ApexClass:MyClass
-m ApexClass:MyClass,ApexTrigger:MyTrigger
```

#### By Source Path

```bash
--source-dir force-app/main/default/classes
-d path/to/metadata
```

#### By Manifest File

```bash
--manifest package.xml
-x package.xml
```

### Test Execution Flags

Common across test commands:

- `-c` or `--code-coverage`: Include code coverage
- `-v` or `--result-format`: Specify output format (human, tap, junit, json)
- `-t` or `--tests`: Specify test classes or methods
- `-l` or `--test-level`: Specify test level (RunLocalTests, RunAllTestsInOrg, etc.)

## Output Modes

### Human-Readable Output (Default)

Formatted tables and text for terminal viewing.

### JSON Output

Structured data for programmatic parsing:

```bash
sf org list --json | jq -r '.result.scratchOrgs[] | .username'
```

### Result Formats

Some commands offer format options:

- `human`: Default formatted output
- `json`: JSON structured data
- `tap`: Test Anything Protocol
- `junit`: JUnit XML format

## Configuration

### Configuration Variables

Set default values for common flags:

```bash
# Set default target org
sf config set target-org=my-org

# Set default dev hub
sf config set target-dev-hub=dev-hub

# List all config
sf config list
```

### Aliases

Create shortcuts for org usernames:

```bash
# Set alias
sf alias set my-org=user@example.com

# List aliases
sf alias list
```

## Working with Orgs

### Org Types

- **Production**: Live production org
- **Sandbox**: Sandbox org cloned from production
- **Scratch Org**: Temporary, disposable development org
- **Dev Hub**: Org that manages scratch orgs

### Org Authentication

```bash
# Login to org via browser
sf org login web -a my-org

# Login using auth URL
sf org login sfdx-url -f authfile.txt

# List authenticated orgs
sf org list
```

## Metadata Types

### Common Metadata Types

- `ApexClass`: Apex classes
- `ApexTrigger`: Apex triggers
- `ApexPage`: Visualforce pages
- `ApexComponent`: Visualforce components
- `LightningComponentBundle`: Lightning Web Components
- `AuraDefinitionBundle`: Aura Components
- `CustomObject`: Custom objects
- `CustomField`: Custom fields
- `PermissionSet`: Permission sets
- `Profile`: Profiles
- `Flow`: Flows
- `StaticResource`: Static resources

### Wildcard Support

```bash
# Deploy all Apex classes
sf project deploy start -m ApexClass

# Deploy specific classes
sf project deploy start -m ApexClass:Class1,ApexClass:Class2
```

## Error Handling

### Exit Codes

- `0`: Success
- `1`: General error
- `2`: Command validation error

### JSON Error Format

When using `--json`, errors are included in the response:

```json
{
  "status": 1,
  "name": "DeployFailed",
  "message": "Deploy failed.",
  "exitCode": 1,
  "warnings": []
}
```

## Best Practices

### 1. Always Specify Target Org

Explicitly specify the org to avoid accidental deployments:

```bash
sf project deploy start -m ApexClass:MyClass -o my-org
```

### 2. Use JSON for Scripting

Parse output programmatically in scripts:

```bash
result=$(sf org list --json | jq -r '.result.scratchOrgs[0].username')
```

### 3. Verify Before Deploying

Use validation deployments to check before deploying:

```bash
sf project deploy start --dry-run -m ApexClass:MyClass
```

### 4. Use Aliases

Create meaningful aliases for orgs:

```bash
sf alias set dev=scratch-org-username
sf alias set staging=staging-username
```

### 5. Check Command Help

Always review available flags and examples:

```bash
sf <topic> <command> --help
```

## Troubleshooting

### Get Detailed Command Info

```bash
sf which <command>
```

### Check CLI Version

```bash
sf version
```

### Update CLI

```bash
sf update
```

### View Command Source

```bash
sf commands --json | jq '.[] | select(.id == "project:deploy:start")'
```

## Environment Variables

### Common Variables

- `SF_TARGET_ORG`: Default target org
- `SF_TARGET_DEV_HUB`: Default dev hub
- `SF_LOG_LEVEL`: Set log level (trace, debug, info, warn, error, fatal)

```bash
export SF_TARGET_ORG=my-org
export SF_LOG_LEVEL=debug
```

## Plugin Architecture

### List Installed Plugins

```bash
sf plugins
```

### Install Plugin

```bash
sf plugins install @salesforce/plugin-name
```

### Update Plugins

```bash
sf plugins update
```

## Performance Tips

### 1. Targeted Deployments

Deploy only changed metadata, not entire directories.

### 2. Parallel Test Execution

Use appropriate test level for faster results:

```bash
sf apex test run -l RunLocalTests  # Faster than RunAllTestsInOrg
```

### 3. JSON Output

Use `--json` for faster parsing in scripts (avoids formatting overhead).

### 4. API Version

Specify API version to ensure consistent behavior:

```bash
sf project deploy start --api-version 65.0
```

## Related Resources

- OCLIF Documentation: https://oclif.io/
- Salesforce CLI Command Reference: https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/
- Salesforce DX Developer Guide: https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/
