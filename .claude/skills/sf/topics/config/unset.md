# config:unset

**Unset local or global configuration variables.**

## Description

Local configuration variables apply only to your current project. Global configuration variables apply in any Salesforce DX project.

For the full list of available configuration variables, see https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_dev_cli_config_values.htm.

## Usage

```bash
sf config:unset [flags]
```

## Flags

### Command Flags

### `-g, --global`

Unset the configuration variables globally.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Unset the local "target-org" configuration variable:
sf config:unset target-org

Unset multiple configuration variables globally:
sf config:unset target-org api-version --global

## Aliases

- `force:config:unset`

## Alternative Syntaxes

- `sf unset:config`

## Plugin

**@salesforce/plugin-settings** (core)
