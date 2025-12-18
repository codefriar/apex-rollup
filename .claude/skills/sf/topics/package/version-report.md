# package:version:report

**Retrieve details about a package version in the Dev Hub org.**

## Description

To update package version values, run "sf package version update".

## Usage

```bash
sf package:version:report [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --package`

ID (starts with 04t) or alias of the package to retrieve details for.

- **Type**: option
- **Required**: Yes

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

Retrieve details about the package version with the specified ID from your default Dev Hub org:
sf package:version:report --package 04t...

Retrieve details about the package version with the specified alias (that contains spaces) from the Dev Hub org with username devhub@example.com:
sf package:version:report --package "Your Package Alias" --target-dev-hub devhub@example.com

## Aliases

- `force:package:version:report`

## Alternative Syntaxes

- `sf version:package:report`
- `sf version:report:package`
- `sf package:report:version`
- `sf report:package:version`
- `sf report:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
