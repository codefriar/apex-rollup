# force:data:bulk:upsert

**Bulk upsert records to an org from a CSV file. Uses Bulk API 1.0.**

## Description

An upsert refers to inserting a record into a Salesforce object if the record doesn't already exist, or updating it if it does exist.

When you execute this command, it starts a job and one or more batches, displays their IDs, and then immediately returns control of the terminal to you by default. If you prefer to wait, set the --wait flag to the number of minutes; if it times out, the command outputs the IDs. Use the job and batch IDs to check the status of the job with the "sf force data bulk status" command. A single job can contain many batches, depending on the length of the CSV file.

See "Prepare CSV Files" in the Bulk API Developer Guide for details on formatting your CSV file. (https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/datafiles_csv_preparing.htm)

By default, the job runs the batches in parallel, which we recommend. You can run jobs serially by specifying the --serial flag. But don't process data in serial mode unless you know this would otherwise result in lock timeouts and you can't reorganize your batches to avoid the locks.

## Usage

```bash
sf force:data:bulk:upsert [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-i, --external-id`

Name of the external ID field, or the Id field.

- **Type**: option
- **Required**: Yes

### `-f, --file`

CSV file that contains the records to upsert.

- **Type**: option
- **Required**: Yes

### `--loglevel`

- **Type**: option

### `-r, --serial`

Run batches in serial mode.

- **Type**: boolean

### `-s, --sobject`

API name of the Salesforce object, either standard or custom, that you want to upsert records to.

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
sf --sobject Contact --file files/contacts.csv --external-id Id

Bulk upsert records to a custom object in an org with alias my-scratch and wait 5 minutes for the command to complete:
sf force:data:bulk:upsert --sobject MyObject**c --file files/file.csv --external-id MyField**c --wait 5 --target-org my-scratch

## Alternative Syntaxes

- `sf data:force:bulk:upsert`
- `sf data:bulk:force:upsert`
- `sf data:bulk:upsert:force`
- `sf force:bulk:data:upsert`
- `sf bulk:force:data:upsert`
- `sf bulk:data:force:upsert`
- `sf bulk:data:upsert:force`
- `sf force:bulk:upsert:data`
- `sf bulk:force:upsert:data`
- `sf bulk:upsert:force:data`
- `sf bulk:upsert:data:force`
- `sf force:data:upsert:bulk`
- `sf data:force:upsert:bulk`
- `sf data:upsert:force:bulk`
- `sf data:upsert:bulk:force`
- `sf force:upsert:data:bulk`
- `sf upsert:force:data:bulk`
- `sf upsert:data:force:bulk`
- `sf upsert:data:bulk:force`
- `sf force:upsert:bulk:data`
- `sf upsert:force:bulk:data`
- `sf upsert:bulk:force:data`
- `sf upsert:bulk:data:force`

## Plugin

**@salesforce/plugin-data** (core)
