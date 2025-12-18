# data:create:record

**Create and insert a record into a Salesforce or Tooling API object.**

## Description

You must specify a value for all required fields of the object.

When specifying fields, use the format <fieldName>=<value>. Enclose all field-value pairs in one set of double quotation marks, delimited by spaces. Enclose values that contain spaces in single quotes.

This command inserts a record into Salesforce objects by default. Use the --use-tooling-api flag to insert into a Tooling API object.

## Usage

```bash
sf data:create:record [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `--perflog`

Get API performance data.

- **Type**: boolean

### `-s, --sobject`

API name of the Salesforce or Tooling API object that you're inserting a record into.

- **Type**: option
- **Required**: Yes

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-t, --use-tooling-api`

Use Tooling API so you can insert a record in a Tooling API object.

- **Type**: boolean

### `-v, --values`

Values for the flags in the form <fieldName>=<value>, separate multiple pairs with spaces.

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

Insert a record into the Account object of your default org; only the required Name field has a value:
sf data:create:record --sobject Account --values "Name=Acme"

Insert an Account record with values for two fields, one value contains a space; the command uses the org with alias "my-scratch":
sf data:create:record --sobject Account --values "Name='Universal Containers' Website=www.example.com" --target-org my-scratch

Insert a record into the Tooling API object TraceFlag:
sf data:create:record --use-tooling-api --sobject TraceFlag --values "DebugLevelId=7dl170000008U36AAE StartDate=2022-12-15T00:26:04.000+0000 ExpirationDate=2022-12-15T00:56:04.000+0000 LogType=CLASS_TRACING TracedEntityId=01p17000000R6bLAAS"

## Aliases

- `force:data:record:create`

## Alternative Syntaxes

- `sf create:data:record`
- `sf create:record:data`
- `sf data:record:create`
- `sf record:data:create`
- `sf record:create:data`

## Plugin

**@salesforce/plugin-data** (core)
