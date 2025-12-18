# org:list:metadata-types

**Display details about the metadata types that are enabled for your org.**

## Description

The information includes Apex classes and triggers, custom objects, custom fields on standard objects, tab sets that define an app, and many other metadata types. Use this information to identify the syntax needed for a <name> element in a manifest file (package.xml).

The username that you use to connect to the org must have the Modify All Data or Modify Metadata Through Metadata API Functions permission.

## Usage

```bash
sf org:list:metadata-types [flags]
```

## Flags

### Command Flags

### `--api-version`

API version to use; default is the most recent API version.

- **Type**: option

### `-k, --filter-known`

Filter the known metadata types from the result to display only the types not yet fully supported by Salesforce CLI.

filter metadata known by the CLI

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-f, --output-file`

Pathname of the file in which to write the results.

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

Display information about all known and enabled metadata types in the org with alias "my-dev-org" using API version 57.0:
$ sf org:list:metadata-types --api-version 57.0 --target-org my-dev-org

Display only the metadata types that aren't yet supported by Salesforce CLI in your default org and write the results to the specified file:
$ sf org:list:metadata-types --output-file /path/to/outputfilename.txt --filter-known

## Aliases

- `force:mdapi:describemetadata`

## Alternative Syntaxes

- `sf list:org:metadata-types`
- `sf list:metadata-types:org`
- `sf org:metadata-types:list`
- `sf metadata-types:org:list`
- `sf metadata-types:list:org`

## Plugin

**@salesforce/plugin-org** (core)
