# data:update:record

**Updates a single record of a Salesforce or Tooling API object.**

## Description

Specify the record you want to update with either its ID or with a list of field-value pairs that identify the record. If your list of fields identifies more than one record, the update fails; the error displays how many records were found.

When using field-value pairs for both identifying the record and specifiyng the new field values, use the format <fieldName>=<value>. Enclose all field-value pairs in one set of double quotation marks, delimited by spaces. Enclose values that contain spaces in single quotes.

This command updates a record in Salesforce objects by default. Use the --use-tooling-api flag to update a Tooling API object.

## Usage

```bash
sf data:update:record [flags]
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

### `-i, --record-id`

ID of the record you’re updating.

- **Type**: option

### `-s, --sobject`

API name of the Salesforce or Tooling API object that contains the record you're updating.

- **Type**: option
- **Required**: Yes

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-t, --use-tooling-api`

Use Tooling API so you can update a record in a Tooling API object.

- **Type**: boolean

### `-v, --values`

Fields that you're updating, in the format of <fieldName>=<value> pairs.

- **Type**: option
- **Required**: Yes

### `-w, --where`

List of <fieldName>=<value> pairs that identify the record you want to update.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Update the Name field of an Account record with the specified (truncated) ID:
sf data:update:record --sobject Account --record-id 001D0 --values "Name=NewAcme"

Update the Name field of an Account record whose current name is 'Old Acme':
sf data:update:record --sobject Account --where "Name='Old Acme'" --values "Name='New Acme'"

Update the Name and Website fields of an Account record with the specified (truncated) ID:
sf data:update:record --sobject Account --record-id 001D0 --values "Name='Acme III' Website=www.example.com"

Update the ExpirationDate field of a record of the Tooling API object TraceFlag using the specified (truncated) ID:
sf data:update:record -t --sobject TraceFlag --record-id 7tf170000009cUBAAY --values "ExpirationDate=2017-12-01T00:58:04.000+0000"

## Aliases

- `force:data:record:update`

## Alternative Syntaxes

- `sf update:data:record`
- `sf update:record:data`
- `sf data:record:update`
- `sf record:data:update`
- `sf record:update:data`

## Plugin

**@salesforce/plugin-data** (core)
