# data:update:resume

**Resume a bulk update job that you previously started. Uses Bulk API 2.0.**

## Description

When the original "sf data update bulk" command times out, it displays a job ID. To see the status and get the results of the bulk update, run this command by either passing it the job ID or using the --use-most-recent flag to specify the most recent bulk update job.

Using either `--job-id` or `--use-most-recent` will properly resolve to the correct org where the bulk job was started based on the cached data by "data update bulk".

## Usage

```bash
sf data:update:resume [flags]
```

## Flags

### Command Flags

### `-i, --job-id`

Job ID of the bulk update.

- **Type**: option

### `--use-most-recent`

Use the job ID of the bulk update job that was most recently run.

- **Type**: boolean

### `-w, --wait`

Time to wait for the command to finish, in minutes.

- **Type**: option
- **Default**: `5 minutes`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Resume a bulk update job using a job ID:
sf data:update:resume --job-id 750xx000000005sAAA

Resume the most recently run bulk update job:
sf data:update:resume --use-most-recent

## Alternative Syntaxes

- `sf update:data:resume`
- `sf update:resume:data`
- `sf data:resume:update`
- `sf resume:data:update`
- `sf resume:update:data`

## Plugin

**@salesforce/plugin-data** (core)
