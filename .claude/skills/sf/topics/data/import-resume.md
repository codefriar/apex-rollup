# data:import:resume

**Resume a bulk import job that you previously started. Uses Bulk API 2.0.**

## Description

When the original "sf data import bulk" command times out, it displays a job ID. To see the status and get the results of the bulk import, run this command by either passing it the job ID or using the --use-most-recent flag to specify the most recent bulk import job.

## Usage

```bash
sf data:import:resume [flags]
```

## Flags

### Command Flags

### `-i, --job-id`

Job ID of the bulk import.

- **Type**: option

### `--use-most-recent`

Use the job ID of the bulk import job that was most recently run.

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

Resume a bulk import job to your default org using an ID:
sf data:import:resume --job-id 750xx000000005sAAA

Resume the most recently run bulk import job for an org with alias my-scratch:
sf data:import:resume --use-most-recent --target-org my-scratch

## Alternative Syntaxes

- `sf import:data:resume`
- `sf import:resume:data`
- `sf data:resume:import`
- `sf resume:data:import`
- `sf resume:import:data`

## Plugin

**@salesforce/plugin-data** (core)
