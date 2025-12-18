# package:push-upgrade:schedule

**Schedule a package push upgrade.**

## Description

Represents a push upgrade request for upgrading a package in one or many orgs from one version to another version.
To initiate a push upgrade for an unlocked or second-generation managed package, the Create and Update Second-Generation Packages user permission is required.
For second-generation managed packages, the push upgrade feature is available only for packages that have passed AppExchange security review. To enable push upgrades for your managed package, log a support case in the Salesforce Partner Community.
For unlocked packages, push upgrades are enabled by default.

Use the -–migrate-to-2GP flag to indicate you’re installing a converted second-generation managed package into an org that has the first-generation managed package version of that package installed.

## Usage

```bash
sf package:push-upgrade:schedule [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--migrate-to-2gp`

Upgrade from a first-generation managed package (1GP) to a second-generation managed package (2GP). Required when you’re pushing a 2GP package to orgs with the 1GP version installed.

- **Type**: boolean

### `-f, --org-file`

Filename of the CSV file that contains the list of subscriber org IDs that need the package upgrade. Either --org-list or --org-file must be specified.

- **Type**: option

### `-l, --org-list`

Comma-separated list of subscriber org IDs that need the package upgrade. Either --org-list or --org-file must be specified.

- **Type**: option

### `-p, --package`

ID (starts with 04t) of the package version that the package is being upgraded to. The package version must be an active, non-beta package version.

- **Type**: option
- **Required**: Yes

### `-t, --start-time`

Date and time (UTC) when the push upgrade is processed. Set to the earliest time that you want Salesforce to attempt to start the upgrade.

- **Type**: option

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org that owns the package.

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

Schedule a push upgrade that initiates at a specified time:
sf package:push-upgrade:schedule --package 04txyz --start-time "2024-12-06T21:00:00" --org-file upgrade-orgs.csv --target-dev-hub myHub

Schedule a push upgrade that initiates as soon as possible:
sf package:push-upgrade:schedule --package 04txyz --org-file upgrade-orgs.csv --target-dev-hub myHub

Schedule a push migration from a 1GP package to a 2GP package:
sf package:push-upgrade:schedule --migrate-to-2gp --package 04txyz --start-time "2024-12-06T21:00:00" --org-file upgrade-orgs.csv --target-dev-hub myHub

## Alternative Syntaxes

- `sf push-upgrade:package:schedule`
- `sf push-upgrade:schedule:package`
- `sf package:schedule:push-upgrade`
- `sf schedule:package:push-upgrade`
- `sf schedule:push-upgrade:package`

## Plugin

**@salesforce/plugin-packaging** (core)
