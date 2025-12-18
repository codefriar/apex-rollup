# data:delete:record

**Deletes a single record from a Salesforce or Tooling API object.**

## Description

Specify the record you want to delete with either its ID or with a list of field-value pairs that identify the record. If your list of fields identifies more than one record, the delete fails; the error displays how many records were found.

When specifying field-value pairs, use the format <fieldName>=<value>. Enclose all field-value pairs in one set of double quotation marks, delimited by spaces. Enclose values that contain spaces in single quotes.

This command deletes a record from Salesforce objects by default. Use the --use-tooling-api flag to delete from a Tooling API object.

## Usage

```bash
sf data:delete:record [flags]
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

ID of the record you’re deleting.

- **Type**: option

### `-s, --sobject`

API name of the Salesforce or Tooling API object that you're deleting a record from.

- **Type**: option
- **Required**: Yes

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-t, --use-tooling-api`

Use Tooling API so you can delete a record from a Tooling API object.

- **Type**: boolean

### `-w, --where`

List of <fieldName>=<value> pairs that identify the record you want to delete.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Delete a record from Account with the specified (truncated) ID:
sf data:delete:record --sobject Account --record-id 00180XX

Delete a record from Account whose name equals "Acme":
sf data:delete:record --sobject Account --where "Name=Acme"

Delete a record from Account identified with two field values, one that contains a space; the command uses the org with alias "my-scratch":
sf data:delete:record --sobject Account --where "Name='Universal Containers' Phone='(123) 456-7890'" --target-org myscratch

Delete a record from the Tooling API object TraceFlag with the specified (truncated) ID:
sf data:delete:record --use-tooling-api --sobject TraceFlag --record-id 7tf8c

## Aliases

- `force:data:record:delete`

## Alternative Syntaxes

- `sf delete:data:record`
- `sf delete:record:data`
- `sf data:record:delete`
- `sf record:data:delete`
- `sf record:delete:data`

## Plugin

**@salesforce/plugin-data** (core)
