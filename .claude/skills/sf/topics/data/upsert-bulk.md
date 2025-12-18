# data:upsert:bulk

**Bulk upsert records to an org from a CSV file. Uses Bulk API 2.0.**

## Description

An upsert refers to inserting a record into a Salesforce object if the record doesn't already exist, or updating it if it does exist.

When you execute this command, it starts a job, displays the ID, and then immediately returns control of the terminal to you by default. If you prefer to wait, set the --wait flag to the number of minutes; if it times out, the command outputs the IDs. Use the job and batch IDs to check the status of the job with the "sf data upsert resume" command.

See "Prepare CSV Files" in the Bulk API Developer Guide for details on formatting your CSV file. (https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/datafiles_prepare_csv.htm)

## Usage

```bash
sf data:upsert:bulk [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--column-delimiter`

Column delimiter used in the CSV file.

- **Type**: option

### `-i, --external-id`

Name of the external ID field, or the Id field.

- **Type**: option
- **Required**: Yes

### `-f, --file`

CSV file that contains the IDs of the records to update or delete.

- **Type**: option
- **Required**: Yes

### `--line-ending`

Line ending used in the CSV file. Default value on Windows is `CRLF`; on macOS and Linux it's `LF`.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-s, --sobject`

API name of the Salesforce object, either standard or custom, that you want to update or delete records from.

- **Type**: option
- **Required**: Yes

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-w, --wait`

Number of minutes to wait for the command to complete before displaying the results.

- **Type**: option
- **Default**: `0 minutes`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Bulk upsert records to the Contact object in your default org:
sf data:upsert:bulk --sobject Contact --file files/contacts.csv --external-id Id

Bulk upsert records to a custom object in an org with alias my-scratch and wait 5 minutes for the command to complete:
sf data:upsert:bulk --sobject MyObject**c --file files/file.csv --external-id MyField**c --wait 5 --target-org my-scratch

## Alternative Syntaxes

- `sf upsert:data:bulk`
- `sf upsert:bulk:data`
- `sf data:bulk:upsert`
- `sf bulk:data:upsert`
- `sf bulk:upsert:data`

## Plugin

**@salesforce/plugin-data** (core)
