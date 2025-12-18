# org:list:limits

**Display information about limits in your org.**

## Description

For each limit, this command returns the maximum allocation and the remaining allocation based on usage. See this topic for a description of each limit: https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/resources_limits.htm.

## Usage

```bash
sf org:list:limits [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

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

Display limits in your default org:
sf org:list:limits

Display limits in the org with alias "my-scratch-org":
sf org:list:limits --target-org my-scratch-org

## Aliases

- `force:limits:api:display`
- `limits:api:display`

## Alternative Syntaxes

- `sf list:org:limits`
- `sf list:limits:org`
- `sf org:limits:list`
- `sf limits:org:list`
- `sf limits:list:org`

## Plugin

**@salesforce/plugin-limits** (core)
