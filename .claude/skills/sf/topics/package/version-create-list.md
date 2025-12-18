# package:version:create:list

**List package version creation requests.**

## Description

Shows the details of each request to create a package version in the Dev Hub org.

All filter parameters are applied using the AND logical operator (not OR).

To get information about a specific request, run "sf package version create report" and supply the request ID.

## Usage

```bash
sf package:version:create:list [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-c, --created-last-days`

Number of days since the request was created, starting at 00:00:00 of first day to now. Use 0 for today.

- **Type**: option

### `--loglevel`

- **Type**: option

### `--show-conversions-only`

Filter the list output to display only converted package version.

- **Type**: boolean

### `-s, --status`

Status of the version creation request, used to filter the list.

- **Type**: option

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--verbose`

Displays additional information at a slight performance cost, such as the version name and number for each package version create request.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

List all package version creation requests in your default Dev Hub org:
sf package:version:create:list

List package version creation requests from the last 3 days in the Dev Hub org with username devhub@example.com:
sf package:version:create:list --created-last-days 3 --target-dev-hub

List package version creation requests with status Error:
sf package:version:create:list --status Error

List package version creation requests with status InProgress:
sf package:version:create:list --status InProgress

List package version creation requests with status Success that were created today:
sf package:version:create:list --created-last-days 0 --status Success

## Aliases

- `force:package:version:create:list`

## Alternative Syntaxes

- `sf version:package:create:list`
- `sf version:create:package:list`
- `sf version:create:list:package`
- `sf package:create:version:list`
- `sf create:package:version:list`
- `sf create:version:package:list`
- `sf create:version:list:package`
- `sf package:create:list:version`
- `sf create:package:list:version`
- `sf create:list:package:version`
- `sf create:list:version:package`
- `sf package:version:list:create`
- `sf version:package:list:create`
- `sf version:list:package:create`
- `sf version:list:create:package`
- `sf package:list:version:create`
- `sf list:package:version:create`
- `sf list:version:package:create`
- `sf list:version:create:package`
- `sf package:list:create:version`
- `sf list:package:create:version`
- `sf list:create:package:version`
- `sf list:create:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
