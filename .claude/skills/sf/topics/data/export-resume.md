# data:export:resume

**Resume a bulk export job that you previously started. Uses Bulk API 2.0.**

## Description

When the original "data export bulk" command times out, it displays a job ID. To see the status and get the results of the bulk export, run this command by either passing it the job ID or using the --use-most-recent flag to specify the most recent bulk export job.

Using either `--job-id` or `--use-most-recent` will properly resolve to the correct org where the bulk job was started based on the cached data by "data export bulk".

## Usage

```bash
sf data:export:resume [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-i, --job-id`

Job ID of the bulk export.

- **Type**: option

### `--use-most-recent`

Use the job ID of the bulk export job that was most recently run.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Resume a bulk export job run by specifying a job ID:
sf data:export:resume --job-id 750xx000000005sAAA

Resume the most recently-run bulk export job:
sf data export resume --use-most-recent

## Alternative Syntaxes

- `sf export:data:resume`
- `sf export:resume:data`
- `sf data:resume:export`
- `sf resume:data:export`
- `sf resume:export:data`

## Plugin

**@salesforce/plugin-data** (core)
