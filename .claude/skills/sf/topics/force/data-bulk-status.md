# force:data:bulk:status

**View the status of a bulk data load job or batch. Uses Bulk API 1.0.**

## Description

Run this command using the job ID or batch ID returned from the "sf force data bulk delete" or "sf force data bulk upsert" commands.

## Usage

```bash
sf force:data:bulk:status [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-b, --batch-id`

ID of the batch whose status you want to view; you must also specify the job ID.

- **Type**: option

### `-i, --job-id`

ID of the job whose status you want to view.

- **Type**: option
- **Required**: Yes

### `--loglevel`

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

View the status of a bulk load job in your default org:
sf force:data:bulk:status --job-id 750xx000000005sAAA

View the status of a bulk load job and a specific batches in an org with alias my-scratch:
sf force:data:bulk:status --job-id 750xx000000005sAAA --batch-id 751xx000000005nAAA --target-org my-scratch

## Alternative Syntaxes

- `sf data:force:bulk:status`
- `sf data:bulk:force:status`
- `sf data:bulk:status:force`
- `sf force:bulk:data:status`
- `sf bulk:force:data:status`
- `sf bulk:data:force:status`
- `sf bulk:data:status:force`
- `sf force:bulk:status:data`
- `sf bulk:force:status:data`
- `sf bulk:status:force:data`
- `sf bulk:status:data:force`
- `sf force:data:status:bulk`
- `sf data:force:status:bulk`
- `sf data:status:force:bulk`
- `sf data:status:bulk:force`
- `sf force:status:data:bulk`
- `sf status:force:data:bulk`
- `sf status:data:force:bulk`
- `sf status:data:bulk:force`
- `sf force:status:bulk:data`
- `sf status:force:bulk:data`
- `sf status:bulk:force:data`
- `sf status:bulk:data:force`

## Plugin

**@salesforce/plugin-data** (core)
