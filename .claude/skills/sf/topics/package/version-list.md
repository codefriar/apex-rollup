# package:version:list

**List all package versions in the Dev Hub org.**

## Description

Description

## Usage

```bash
sf package:version:list [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-b, --branch`

Branch in your source control system used to filter the results; only package versions based on the specified branch are listed.

- **Type**: option

### `--concise`

Display limited package version details.

- **Type**: boolean

### `-c, --created-last-days`

Number of days since the request was created, starting at 00:00:00 of first day to now. Use 0 for today.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-m, --modified-last-days`

Number of days since the items were modified, starting at 00:00:00 of first day to now. Use 0 for today.

- **Type**: option

### `-o, --order-by`

Package version fields used to order the list.

- **Type**: option

### `-p, --packages`

Comma-delimited list of packages (aliases or 0Ho IDs) to list.

- **Type**: option

### `-r, --released`

Display released versions only (IsReleased=true).

- **Type**: boolean

### `--show-conversions-only`

Filter the list output to display only converted package version.

- **Type**: boolean

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--verbose`

Display extended package version details.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

List package versions in your default Dev Hub org that were created in the last 3 days; show only the released versions and order the list using the PatchVersion field. Display extended details about each package version:
sf package:version:list --verbose --created-last-days 3 --released --order-by PatchVersion

List the released package versions for the two specified packages that were modified today; use the Dev Hub org with username devhub@example.com:
sf package:version:list --packages 0Ho000000000000,0Ho000000000001 --released --modified-last-days 0 --target-dev-hub devhub@example.com

List all released package versions in your default Dev Hub org:
sf package:version:list --released

List package versions that were modified today in your default Dev Hub org; show limited details about each one:
sf package:version:list --concise --modified-last-days 0

List package versions that are based on the "featureA" branch in your source control system that were modified today in your default Dev Hub org; show limited details about each one:
sf package:version:list --concise --modified-last-days 0 --branch featureA

List released package versions that were created in the last 3 days in your default Dev Hub org; show limited details:
sf package:version:list --concise --created-last-days 3 --released

List released package versions that were modified today for the two packages with specified aliases in your default Dev Hub org:
sf package:version:list --packages exp-mgr,exp-mgr-util --released --modified-last-days 0

## Aliases

- `force:package:version:list`

## Alternative Syntaxes

- `sf version:package:list`
- `sf version:list:package`
- `sf package:list:version`
- `sf list:package:version`
- `sf list:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
