# package:list

**List all packages in the Dev Hub org.**

## Description

Description

## Usage

```bash
sf package:list [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--verbose`

Display extended package detail.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

List all packages in the specified Dev Hub org:
sf package:list --target-dev-hub devhub@example.com

List all packages details in the specified Dev Hub org, and show extended details about each package:
sf package:list --target-dev-hub devhub@example.com --verbose

## Aliases

- `force:package:list`

## Alternative Syntaxes

- `sf list:package`

## Plugin

**@salesforce/plugin-packaging** (core)
