# org:resume:sandbox

**Check the status of a sandbox creation, and log in to it if it's ready.**

## Description

Sandbox creation can take a long time. If the original "sf org create sandbox" command either times out, or you specified the --async flag, the command displays a job ID. Use this job ID to check whether the sandbox creation is complete, and if it is, the command then logs into it.

You can also use the sandbox name to check the status or the --use-most-recent flag to use the job ID of the most recent sandbox creation.

## Usage

```bash
sf org:resume:sandbox [flags]
```

## Flags

### Command Flags

### `-i, --job-id`

Job ID of the incomplete sandbox creation that you want to check the status of.

- **Type**: option

### `-n, --name`

Name of the sandbox org.

- **Type**: option

### `-o, --target-org`

Username or alias of the production org that contains the sandbox license.

- **Type**: option

### `-l, --use-most-recent`

Use the most recent sandbox create request.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for the sandbox org to be ready.

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

Check the status of a sandbox creation using its name and specify a production org with alias "prodOrg":
sf org:resume:sandbox --name mysandbox --target-org prodOrg

Check the status using the job ID:
sf org:resume:sandbox --job-id 0GRxxxxxxxx

Check the status of the most recent sandbox create request:
sf org:resume:sandbox --use-most-recent

## Aliases

- `env:resume:sandbox`

## Alternative Syntaxes

- `sf resume:org:sandbox`
- `sf resume:sandbox:org`
- `sf org:sandbox:resume`
- `sf sandbox:org:resume`
- `sf sandbox:resume:org`

## Plugin

**@salesforce/plugin-org** (core)
