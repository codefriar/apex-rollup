# force:data:bulk:delete

**Bulk delete records from an org using a CSV file. Uses Bulk API 1.0.**

## Description

The CSV file must have only one column ("Id") and then the list of record IDs you want to delete, one ID per line.

When you execute this command, it starts a job and one or more batches, displays their IDs, and then immediately returns control of the terminal to you by default. If you prefer to wait, set the --wait flag to the number of minutes; if it times out, the command outputs the IDs. Use the job and batch IDs to check the status of the job with the "sf force data bulk status" command. A single job can contain many batches, depending on the length of the CSV file.

## Usage

```bash
sf force:data:bulk:delete [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-f, --file`

CSV file that contains the IDs of the records to delete.

- **Type**: option
- **Required**: Yes

### `--loglevel`

- **Type**: option

### `-s, --sobject`

API name of the Salesforce object, either standard or custom, that you want to delete records from.

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

Bulk delete Account records from your default org using the list of IDs in the "files/delete.csv" file:
sf force:data:bulk:delete --sobject Account --file files/delete.csv

Bulk delete records from a custom object in an org with alias my-scratch and wait 5 minutes for the command to complete:
sf force:data:bulk:delete --sobject MyObject\_\_c --file files/delete.csv --wait 5 --target-org my-scratch

## Alternative Syntaxes

- `sf data:force:bulk:delete`
- `sf data:bulk:force:delete`
- `sf data:bulk:delete:force`
- `sf force:bulk:data:delete`
- `sf bulk:force:data:delete`
- `sf bulk:data:force:delete`
- `sf bulk:data:delete:force`
- `sf force:bulk:delete:data`
- `sf bulk:force:delete:data`
- `sf bulk:delete:force:data`
- `sf bulk:delete:data:force`
- `sf force:data:delete:bulk`
- `sf data:force:delete:bulk`
- `sf data:delete:force:bulk`
- `sf data:delete:bulk:force`
- `sf force:delete:data:bulk`
- `sf delete:force:data:bulk`
- `sf delete:data:force:bulk`
- `sf delete:data:bulk:force`
- `sf force:delete:bulk:data`
- `sf delete:force:bulk:data`
- `sf delete:bulk:force:data`
- `sf delete:bulk:data:force`

## Plugin

**@salesforce/plugin-data** (core)
