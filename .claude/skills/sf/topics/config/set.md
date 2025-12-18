# config:set

**Set one or more configuration variables, such as your default org.**

## Description

Use configuration variables to set CLI defaults, such as your default org or the API version you want the CLI to use. For example, if you set the "target-org" configuration variable, you don't need to specify it as a "sf deploy metadata" flag if you're deploying to your default org.

Local configuration variables apply only to your current project. Global variables, specified with the --global flag, apply in any Salesforce DX project.

The resolution order if you've set a flag value in multiple ways is as follows:

    1. Flag value specified at the command line.
    2. Local (project-level) configuration variable.
    3. Global configuration variable.

Run "sf config list" to see the configuration variables you've already set and their level (local or global).

If you're setting a single config variable, you don't need to use an equal sign between the variable and value. But you must use the equal sign if setting multiple config variables.

For the full list of available configuration variables, see https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_dev_cli_config_values.htm.

## Usage

```bash
sf config:set [flags]
```

## Flags

### Command Flags

### `-g, --global`

Set the configuration variables globally, so they can be used from any Salesforce DX project.

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

Set the local target-org configuration variable to an org username:
sf config:set target-org me@my.org

Set the local target-org configuration variable to an alias:
sf config:set target-org my-scratch-org

Set the global target-org and target-dev-hub configuration variables using aliases:
sf config:set --global target-org=my-scratch-org target-dev-hub=my-dev-hub

## Aliases

- `force:config:set`

## Alternative Syntaxes

- `sf set:config`

## Plugin

**@salesforce/plugin-settings** (core)
