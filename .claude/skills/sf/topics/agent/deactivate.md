# agent:deactivate

**Deactivate an agent in an org.**

## Description

Deactivating an agent makes it unavailable to your users. To make changes to an agent, such as adding or removing topics or actions, you must deactivate it. You can't preview an agent with the "agent preview" CLI command or VS Code if it's deactivated.

You must know the agent's API name to deactivate it; you can either be prompted for it or you can specify it with the --api-name flag. Find the agent's API name in its Agent Details page of your org's Agentforce Studio UI in Setup.

## Usage

```bash
sf agent:deactivate [flags]
```

## Flags

### Command Flags

### `-n, --api-name`

API name of the agent to deactivate.

- **Type**: option

### `--api-version`

Override the api version used for api requests made by this command

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

Deactivate an agent in your default target org by being prompted:
sf agent:deactivate

Deactivate the agent Resort_Manager in the org with alias "my_org":
sf agent:deactivate --api-name Resort_Manager --target-org my-org

## Alternative Syntaxes

- `sf deactivate:agent`

## Plugin

**@salesforce/plugin-agent** (core)
