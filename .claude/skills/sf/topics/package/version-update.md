# package:version:update

**Update a package version.**

## Description

Specify a new value for each option you want to update.

To display details about a package version, run "sf package version display".

## Usage

```bash
sf package:version:update [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-b, --branch`

New package version branch.

- **Type**: option

### `-k, --installation-key`

New installation key for key-protected package (default: null)

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --package`

ID (starts with 04t) or alias of the package to update a version of.

- **Type**: option
- **Required**: Yes

### `-t, --tag`

New package version tag.

- **Type**: option

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-e, --version-description`

New package version description.

- **Type**: option

### `-a, --version-name`

New package version name.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Update the package version that has the specified alias (that contains spaces) with a new installation key "password123"; uses your default Dev Hub org:
sf package:version:update --package "Your Package Alias" --installation-key password123

Update the package version that has the specified ID with a new branch and tag; use the Dev Hub org with username devhub@example.com:
sf package:version:update --package 04t... --branch main --tag 'Release 1.0.7' --target-dev-hub devhub@example.com

Update the package version that has the specified ID with a new description:
sf package:version:update --package 04t... --version-description "New Package Version Description"

## Aliases

- `force:package:version:update`

## Alternative Syntaxes

- `sf version:package:update`
- `sf version:update:package`
- `sf package:update:version`
- `sf update:package:version`
- `sf update:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
