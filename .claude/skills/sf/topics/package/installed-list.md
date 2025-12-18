# package:installed:list

**List the org’s installed packages.**

## Usage

```bash
sf package:installed:list [flags]
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

List the installed packages in your default org:
sf package:installed:list

List the installed packages in the org with username me@example.com:
sf package:installed:list --target-org me@example.com

## Aliases

- `force:package:installed:list`

## Alternative Syntaxes

- `sf installed:package:list`
- `sf installed:list:package`
- `sf package:list:installed`
- `sf list:package:installed`
- `sf list:installed:package`

## Plugin

**@salesforce/plugin-packaging** (core)
