# package:update

**Update package details.**

## Description

Specify a new value for each option you want to update.

Run "sf package list" to list all packages in the Dev Hub org.

## Usage

```bash
sf package:update [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-d, --description`

New description of the package.

- **Type**: option

### `--enable-app-analytics`

Enable AppExchange App Analytics usage data collection on this managed package and its components.

- **Type**: boolean

### `-o, --error-notification-username`

Active Dev Hub user designated to receive email notifications for package errors.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --name`

New name of the package.

- **Type**: option

### `-p, --package`

ID (starts with 0Ho) or alias of the package to update.

- **Type**: option
- **Required**: Yes

### `-r, --recommended-version-id`

Package version ID that subscribers are notified to install or upgrade to.

- **Type**: option

### `--skip-ancestor-check`

Bypass the ancestry check for setting a recommended version.

- **Type**: boolean

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

Update the name of the package with the specified alias; uses your default Dev Hub org:
sf package:update --package "Your Package Alias" --name "New Package Name"

Update the description of the package with the specified ID; uses the specified Dev Hub org:
sf package:update --package 0Ho... --description "New Package Description" --target-dev-hub devhub@example.com

## Aliases

- `force:package:update`

## Alternative Syntaxes

- `sf update:package`

## Plugin

**@salesforce/plugin-packaging** (core)
