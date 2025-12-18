# agent:test:create

**Create an agent test in your org using a local test spec YAML file.**

## Description

To run this command, you must have an agent test spec file, which is a YAML file that lists the test cases for testing a specific agent. Use the "agent generate test-spec" CLI command to generate a test spec file. Then specify the file to this command with the --spec flag, or run this command with no flags to be prompted.

When this command completes, your org contains the new agent test, which you can view and edit using the Testing Center UI. This command also retrieves the metadata component (AiEvaluationDefinition) associated with the new test to your local Salesforce DX project and displays its filename.

After you've created the test in the org, use the "agent test run" command to run it.

## Usage

```bash
sf agent:test:create [flags]
```

## Flags

### Command Flags

### `--api-name`

API name of the new test; the API name must not exist in the org.

- **Type**: option

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--force-overwrite`

Don't prompt for confirmation when overwriting an existing test (based on API name) in your org.

- **Type**: boolean

### `--preview`

Preview the test metadata file (AiEvaluationDefinition) without deploying to your org.

- **Type**: boolean

### `--spec`

Path to the test spec YAML file.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Create an agent test interactively and be prompted for the test spec and API name of the test in the org; use the default org:
sf agent:test:create

Create an agent test and use flags to specify all required information; if a test with same API name already exists in the org, overwrite it without confirmation. Use the org with alias "my-org":
sf agent:test:create --spec specs/Resort_Manager-testSpec.yaml --api-name Resort_Manager_Test --force-overwrite --target-org my-org

Preview what the agent test metadata (AiEvaluationDefinition) looks like without deploying it to your default org:
sf agent:test:create --spec specs/Resort_Manager-testSpec.yaml --api-name Resort_Manager_Test --preview

## Alternative Syntaxes

- `sf test:agent:create`
- `sf test:create:agent`
- `sf agent:create:test`
- `sf create:agent:test`
- `sf create:test:agent`

## Plugin

**@salesforce/plugin-agent** (core)
