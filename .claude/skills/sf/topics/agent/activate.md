# agent:activate

**Activate an agent in an org.**

## Description

Activating an agent makes it immediately available to your users. An agent must be active before you can preview it with the "agent preview" CLI command or VS Code.

You must know the agent's API name to activate it; you can either be prompted for it or you can specify it with the --api-name flag. Find the agent's API name in its Agent Details page of your org's Agentforce Studio UI in Setup.

## Usage

```bash
sf agent:activate [flags]
```

## Flags

### Command Flags

### `-n, --api-name`

API name of the agent to activate.

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

Activate an agent in your default target org by being prompted:
sf agent:activate

Activate an agent with API name Resort_Manager in the org with alias "my-org":
sf agent:activate --api-name Resort_Manager --target-org my-org

## Alternative Syntaxes

- `sf activate:agent`

## Plugin

**@salesforce/plugin-agent** (core)
