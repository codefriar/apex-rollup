# sobject:describe

**Display the metadata for a standard or custom object or a Tooling API object.**

## Description

The metadata is displayed in JSON format. See this topic for a description of each property: https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_calls_describesobjects_describesobjectresult.htm.

This command displays metadata for Salesforce objects by default. Use the --use-tooling-api flag to view metadata for a Tooling API object.

## Usage

```bash
sf sobject:describe [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-s, --sobject`

API name of the object to describe.

- **Type**: option
- **Required**: Yes

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-t, --use-tooling-api`

Use Tooling API to display metadata for Tooling API objects.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Display the metadata of the "Account" standard object in your default org:
sf sobject:describe --sobject Account

Display the metadata of the "MyObject**c" custom object in the org with alias "my-scratch-org":
sf sobject:describe --sobject MyObject**c --target-org my-scratch-org

Display the metadata of the ApexCodeCoverage Tooling API object in your default org:
sf sobject:describe --sobject ApexCodeCoverage --use-tooling-api

## Aliases

- `force:schema:sobject:describe`

## Alternative Syntaxes

- `sf describe:sobject`

## Plugin

**@salesforce/plugin-schema** (core)
