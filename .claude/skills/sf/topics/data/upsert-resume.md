# data:upsert:resume

**Resume a bulk upsert job that you previously started. Uses Bulk API 2.0.**

## Description

The command uses the job ID returned from the "sf data upsert bulk" command or the most recently-run bulk upsert job.

## Usage

```bash
sf data:upsert:resume [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-i, --job-id`

ID of the job you want to resume.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the "target-org" configuration variable is already set.

- **Type**: option

### `--use-most-recent`

Use the ID of the most recently-run bulk job.

- **Type**: boolean

### `--wait`

Number of minutes to wait for the command to complete before displaying the results.

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

Resume a bulk upsert job from your default org using an ID:
sf data:upsert:resume --job-id 750xx000000005sAAA

Resume the most recently run bulk upsert job for an org with alias my-scratch:
sf data:upsert:resume --use-most-recent --target-org my-scratch

## Alternative Syntaxes

- `sf upsert:data:resume`
- `sf upsert:resume:data`
- `sf data:resume:upsert`
- `sf resume:data:upsert`
- `sf resume:upsert:data`

## Plugin

**@salesforce/plugin-data** (core)
