# package:uninstall

**Uninstall a second-generation package from the target org.**

## Description

Specify the package ID for a second-generation package.

To list the org’s installed packages, run "sf package installed list".

To uninstall a first-generation package, from Setup, enter Installed Packages in the Quick Find box, then select Installed Packages.

## Usage

```bash
sf package:uninstall [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --package`

ID (starts with 04t) or alias of the package version to uninstall.

- **Type**: option
- **Required**: Yes

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-w, --wait`

Number of minutes to wait for uninstall status.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Uninstall a package with specified ID from an org with username me@example.com:
sf package:uninstall --package 04t... --target-org me@example.com

Uninstall a package with the specified alias from your default org:
sf package:uninstall --package undesirable_package_alias

Uninstall a package with an alias that contains spaces from your default org:
sf package:uninstall --package "Undesirable Package Alias"

## Aliases

- `force:package:uninstall`

## Alternative Syntaxes

- `sf uninstall:package`

## Plugin

**@salesforce/plugin-packaging** (core)
