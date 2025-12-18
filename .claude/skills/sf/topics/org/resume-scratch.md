# org:resume:scratch

**Resume the creation of an incomplete scratch org.**

## Description

When the original "sf org create scratch" command either times out or is run with the --async flag, it displays a job ID.

Run this command by either passing it a job ID or using the --use-most-recent flag to specify the most recent incomplete scratch org.

## Usage

```bash
sf org:resume:scratch [flags]
```

## Flags

### Command Flags

### `-i, --job-id`

Job ID of the incomplete scratch org create that you want to resume.

- **Type**: option

### `-r, --use-most-recent`

Use the job ID of the most recent incomplete scratch org.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for the scratch org to be ready.

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

Resume a scratch org create with a job ID:
sf org:resume:scratch --job-id 2SR3u0000008fBDGAY

Resume your most recent incomplete scratch org:
sf org:resume:scratch --use-most-recent

## Aliases

- `env:resume:scratch`

## Alternative Syntaxes

- `sf resume:org:scratch`
- `sf resume:scratch:org`
- `sf org:scratch:resume`
- `sf scratch:org:resume`
- `sf scratch:resume:org`

## Plugin

**@salesforce/plugin-org** (core)
