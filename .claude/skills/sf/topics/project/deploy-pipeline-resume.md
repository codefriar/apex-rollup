# project:deploy:pipeline:resume

**Resume watching a pipeline deploy operation.**

## Description

The first time you run any "project deploy pipeline" command, be sure to authorize the org in which DevOps Center is installed. The easiest way to authorize an org is with the "org login web" command.

Use this command to resume watching a pipeline deploy operation if the original command times out or you specified the --async flag.

Run this command by either indicating a job ID or specifying the --use-most-recent flag to use the job ID of the most recent deploy operation.

## Usage

```bash
sf project:deploy:pipeline:resume [flags]
```

## Flags

### Command Flags

### `--concise`

Show concise output of the command result.

- **Type**: boolean

### `-c, --devops-center-username`

Username or alias of the DevOps Center org.

- **Type**: option
- **Required**: Yes

### `-i, --job-id`

Job ID of the pipeline deploy operation you want to resume.

- **Type**: option

### `-r, --use-most-recent`

Use the job ID of the most recent deploy operation.

- **Type**: boolean

### `--verbose`

Show verbose output of the command result.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for command to complete and display results.

- **Type**: option
- **Default**: `33 minutes`

### Global Flags

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Resume watching a deploy operation using a job ID:
sf project:deploy:pipeline:resume --job-id 0Af0x000017yLUFCA2

Resume watching the most recent deploy operation:
sf project:deploy:pipeline:resume --use-most-recent

## Plugin

**@salesforce/plugin-devops-center** (jit)
