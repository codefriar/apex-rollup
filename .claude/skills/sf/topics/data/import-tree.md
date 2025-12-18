# data:import:tree

**Import data from one or more JSON files into an org.**

## Description

The JSON files that contain the data are in sObject tree format, which is a collection of nested, parent-child records with a single root record. Use the "sf data export tree" command to generate these JSON files.

If you used the --plan flag when exporting the data to generate a plan definition file, use the --plan flag to reference the file when you import. If you're not using a plan, use the --files flag to list the files. If you specify multiple JSON files that depend on each other in a parent-child relationship, be sure you list them in the correct order.

## Usage

```bash
sf data:import:tree [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-f, --files`

Comma-separated and in-order JSON files that contain the records, in sObject tree format, that you want to insert.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `--loglevel`

- **Type**: option

### `-p, --plan`

Plan definition file to insert multiple data files.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

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

Import the records contained in two JSON files into the org with alias "my-scratch":
sf data:import:tree --files Contact.json,Account.json --target-org my-scratch

Import records using a plan definition file into your default org:
sf data:import:tree --plan Account-Contact-plan.json

## Aliases

- `force:data:tree:import`

## Alternative Syntaxes

- `sf import:data:tree`
- `sf import:tree:data`
- `sf data:tree:import`
- `sf tree:data:import`
- `sf tree:import:data`

## Plugin

**@salesforce/plugin-data** (core)
