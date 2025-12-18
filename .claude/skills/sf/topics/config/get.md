# config:get

**Get the value of a configuration variable.**

## Description

Run "sf config list" to see the configuration variables you've already set and their level (local or global).

Run "sf config set" to set a configuration variable. For the full list of available configuration variables, see https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_dev_cli_config_values.htm.

## Usage

```bash
sf config:get [flags]
```

## Flags

### Command Flags

### `--loglevel`

- **Type**: option

### `--verbose`

Display whether the configuration variables are set locally or globally.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Get the value of the "target-org" configuration variable.
sf config:get target-org

Get multiple configuration variables and display whether they're set locally or globally:
sf config:get target-org api-version --verbose

## Aliases

- `force:config:get`

## Alternative Syntaxes

- `sf get:config`

## Plugin

**@salesforce/plugin-settings** (core)
