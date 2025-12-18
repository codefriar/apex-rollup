# package:install

**Install or upgrade a version of a package in the target org.**

## Description

To install or upgrade a package, specify a specific version of the package using the 04t package ID. The package and the version you specified installs in your default target org unless you supply the username for a different target org.

When upgrading an unlocked package, include the --upgrade-type value to specify whether any removed components are deprecated or deleted. To delete components that can be safely deleted and deprecate the others, specify "--upgrade-type Mixed" (the default). To deprecate all removed components, specify "--upgrade-type DeprecateOnly". To delete all removed components, except for custom objects and custom fields, that don't have dependencies, specify "--upgrade-type Delete". (Note: This option can result in the loss of data that is associated with the deleted components.)

## Usage

```bash
sf package:install [flags]
```

## Flags

### Command Flags

### `-a, --apex-compile`

Compile all Apex in the org and package, or only Apex in the package; unlocked packages only.

- **Type**: option
- **Default**: `all`

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-k, --installation-key`

Installation key for key-protected package (default: null).

- **Type**: option

### `--loglevel`

- **Type**: option

### `-r, --no-prompt`

Don't prompt for confirmation.

- **Type**: boolean

### `-p, --package`

ID (starts with 04t) or alias of the package version to install.

- **Type**: option
- **Required**: Yes

### `-b, --publish-wait`

Maximum number of minutes to wait for the Subscriber Package Version ID to become available in the target org before canceling the install request.

- **Type**: option

### `-s, --security-type`

Security access type for the installed package. Available options are AdminsOnly and AllUsers.

- **Type**: option
- **Default**: `AdminsOnly`

### `-l, --skip-handlers`

Skip install handlers (available handlers: FeatureEnforcement).

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-t, --upgrade-type`

Upgrade type for the package installation; available only for unlocked packages.

- **Type**: option
- **Default**: `Mixed`

### `-w, --wait`

Number of minutes to wait for installation status.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Install or upgrade a package version with the specified ID in the org with username "me@example.com":
sf package:install --package 04t... --target-org me@example.com

Install or upgrade a package version with the specified alias into your default org:
sf package:install --package awesome_package_alias

Install or upgrade a package version with an alias that includes spaces into your default org:
sf package:install --package "Awesome Package Alias"

Upgrade an unlocked package version with the specified ID and deprecate all removed components:
sf package:install --package 04t... --upgrade-type DeprecateOnly

## Aliases

- `force:package:install`

## Alternative Syntaxes

- `sf install:package`

## Plugin

**@salesforce/plugin-packaging** (core)
