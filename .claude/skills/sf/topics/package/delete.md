# package:delete

**Delete a package.**

## Description

Specify the ID or alias of the package you want to delete.

Delete unlocked and second-generation managed packages. Before you delete a package, first delete all associated package versions.

## Usage

```bash
sf package:delete [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --no-prompt`

Don't prompt before deleting the package.

- **Type**: boolean

### `-p, --package`

ID (starts with 0Ho) or alias of the package to delete.

- **Type**: option
- **Required**: Yes

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--undelete`

Undelete a deleted package.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Delete a package using its alias from your default Dev Hub org:
sf package:delete --package "Your Package Alias"

Delete a package using its ID from the specified Dev Hub org:
sf package:delete --package 0Ho... --target-dev-hub devhub@example.com

## Aliases

- `force:package:delete`

## Alternative Syntaxes

- `sf delete:package`

## Plugin

**@salesforce/plugin-packaging** (core)
