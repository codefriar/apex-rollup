# package:push-upgrade:list

**Lists the status of push upgrade requests for a given package.**

## Description

Shows the details of each request to create a push upgrade in the Dev Hub org.

All filter parameters are applied using the AND logical operator (not OR).

To get information about a specific request, run "sf package pushupgrade report" and supply the request ID.

## Usage

```bash
sf package:push-upgrade:list [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-p, --package`

Package ID (starts with 033) of the package that you want push upgrade information for.

- **Type**: option
- **Required**: Yes

### `-l, --scheduled-last-days`

Number of days in the past for which to display the list of push upgrade requests that were scheduled. Used to filter the list output to only recently scheduled push upgrades.

- **Type**: option

### `--show-push-migrations-only`

Display only push upgrade requests for package migrations.

- **Type**: boolean

### `-s, --status`

Status used to filter the list output Valid values are: Created, Canceled, Pending, In Progress, Failed, or Succeeded

- **Type**: option

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

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

List all package push upgrade requests in the specified Dev Hub org:
sf package:push-upgrade:list --package 033xyz --target-dev-hub myHub

List all package push upgrade requests in the specified Dev Hub org scheduled in the last 30 days:
sf package:push-upgrade:list --package 033xyz --scheduled-last-days 30 --target-dev-hub myHub

List all package push upgrade with a status Succeeded:
sf package:push-upgrade:list --package 033xyz –-status Succeeded

List all package push upgrade with a status Failed:
sf package:push-upgrade:list --package 033xyz –-status Failed

## Aliases

- `force:package:push-upgrade:list`

## Alternative Syntaxes

- `sf push-upgrade:package:list`
- `sf push-upgrade:list:package`
- `sf package:list:push-upgrade`
- `sf list:package:push-upgrade`
- `sf list:push-upgrade:package`

## Plugin

**@salesforce/plugin-packaging** (core)
