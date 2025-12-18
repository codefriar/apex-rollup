# data:import:bulk

**Bulk import records into a Salesforce object from a CSV file. Uses Bulk API 2.0.**

## Description

You can use this command to import millions of records into the object from a file in comma-separated values (CSV) format.

All the records in the CSV file must be for the same Salesforce object. Specify the object with the `--sobject` flag.

Bulk imports can take a while, depending on how many records are in the CSV file. If the command times out, the command displays the job ID. To see the status and get the results of the job, run "sf data import resume" and pass the job ID to the --job-id flag.

For information and examples about how to prepare your CSV files, see "Prepare Data to Ingest" in the "Bulk API 2.0 and Bulk API Developer Guide" (https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/datafiles_prepare_data.htm).

## Usage

```bash
sf data:import:bulk [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--column-delimiter`

Column delimiter used in the CSV file.

- **Type**: option

### `-f, --file`

CSV file that contains the Salesforce object records you want to import.

- **Type**: option
- **Required**: Yes

### `--line-ending`

Line ending used in the CSV file. Default value on Windows is `CRLF`; on macOS and Linux it's `LF`.

- **Type**: option

### `-s, --sobject`

API name of the Salesforce object, either standard or custom, into which you're importing records.

- **Type**: option
- **Required**: Yes

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-w, --wait`

Time to wait for the command to finish, in minutes.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Import Account records from a CSV-formatted file into an org with alias "my-scratch"; if the import doesn't complete in 10 minutes, the command ends and displays a job ID:
sf data:import:bulk --file accounts.csv --sobject Account --wait 10 --target-org my-scratch

## Alternative Syntaxes

- `sf import:data:bulk`
- `sf import:bulk:data`
- `sf data:bulk:import`
- `sf bulk:data:import`
- `sf bulk:import:data`

## Plugin

**@salesforce/plugin-data** (core)
