# agent:test:list

**List the available agent tests in your org.**

## Description

The command outputs a table with the name (API name) of each test along with its unique ID and the date it was created in the org.

## Usage

```bash
sf agent:test:list [flags]
```

## Flags

### Command Flags

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

List the agent tests in your default org:
sf agent:test:list

List the agent tests in an org with alias "my-org""
sf agent:test:list --target-org my-org

## Alternative Syntaxes

- `sf test:agent:list`
- `sf test:list:agent`
- `sf agent:list:test`
- `sf list:agent:test`
- `sf list:test:agent`

## Plugin

**@salesforce/plugin-agent** (core)
