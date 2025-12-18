# package:version:delete

**Delete a package version.**

## Description

Specify the ID or alias of the package version you want to delete. In second-generation managed packaging, only beta package versions can be deleted. Before deleting a package version, review the considerations outlined in https://developer.salesforce.com/docs/atlas.en-us.pkg2_dev.meta/pkg2_dev/sfdx_dev_dev2gp_package_deletion.htm.

## Usage

```bash
sf package:version:delete [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --no-prompt`

Don’t prompt before deleting the package version.

- **Type**: boolean

### `-p, --package`

ID (starts with 04t) or alias of the package version to delete.

- **Type**: option
- **Required**: Yes

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--undelete`

Undelete a deleted package version.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Delete a package version with the specified alias using your default Dev Hub org:
sf package:version:delete --package "Your Package Alias"

Delete a package version with the specified ID using the Dev Hub org with username "devhub@example.com":
sf package:version:delete --package 04t... --target-org devhub@example.com

## Aliases

- `force:package:version:delete`

## Alternative Syntaxes

- `sf version:package:delete`
- `sf version:delete:package`
- `sf package:delete:version`
- `sf delete:package:version`
- `sf delete:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
