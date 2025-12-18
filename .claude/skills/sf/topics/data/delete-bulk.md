# data:delete:bulk

**Bulk delete records from an org using a CSV file. Uses Bulk API 2.0.**

## Description

The CSV file must have only one column ("Id") and then the list of record IDs you want to delete, one ID per line.

When you execute this command, it starts a job, displays the ID, and then immediately returns control of the terminal to you by default. If you prefer to wait, set the --wait flag to the number of minutes; if it times out, the command outputs the IDs. Use the job ID to check the status of the job with the "sf data delete resume" command.

## Usage

```bash
sf data:delete:bulk [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-f, --file`

CSV file that contains the IDs of the records to update or delete.

- **Type**: option
- **Required**: Yes

### `--hard-delete`

Mark the records as immediately eligible for deletion by your org. If you don't specify this flag, the deleted records go into the Recycle Bin.

- **Type**: boolean

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

Bulk delete Account records from your default org using the list of IDs in the "files/delete.csv" file:
sf data:delete:bulk --sobject Account --file files/delete.csv

Bulk delete records from a custom object in an org with alias my-scratch and wait 5 minutes for the command to complete:
sf data:delete:bulk --sobject MyObject\_\_c --file files/delete.csv --wait 5 --target-org my-scratch

## Alternative Syntaxes

- `sf delete:data:bulk`
- `sf delete:bulk:data`
- `sf data:bulk:delete`
- `sf bulk:data:delete`
- `sf bulk:delete:data`

## Plugin

**@salesforce/plugin-data** (core)
