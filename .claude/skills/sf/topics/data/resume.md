# data:resume

**View the status of a bulk data load job or batch.**

## Description

Run this command using the job ID or batch ID returned from the "sf data delete bulk" or "sf data upsert bulk" commands.

## Usage

```bash
sf data:resume [flags]
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

View the status of a bulk load job:
sf data:resume --job-id 750xx000000005sAAA

View the status of a bulk load job and a specific batches:
sf data:resume --job-id 750xx000000005sAAA --batch-id 751xx000000005nAAA

## Alternative Syntaxes

- `sf resume:data`

## Plugin

**@salesforce/plugin-data** (core)
