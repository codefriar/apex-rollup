# project:deploy:pipeline:report

**Check the status of a pipeline deploy operation.**

## Description

The first time you run any "project deploy pipeline" command, be sure to authorize the org in which DevOps Center is installed. The easiest way to authorize an org is with the "org login web" command.

Run this command by either indicating a job ID or specifying the —use-most-recent flag to use the job ID of the most recent deploy operation.

## Usage

```bash
sf project:deploy:pipeline:report [flags]
```

## Flags

### Command Flags

### `-c, --devops-center-username`

Username or alias of the DevOps Center org.

- **Type**: option
- **Required**: Yes

### `-i, --job-id`

Job ID of the pipeline deployment to check the status of.

- **Type**: option

### `-r, --use-most-recent`

Use the job ID of the most recent deploy operation.

- **Type**: boolean

### Global Flags

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Check the status using a job ID:
sf project:deploy:pipeline:report --devops-center-username MyStagingSandbox --job-id 0Af0x000017yLUFCA2

Check the status of the most recent deploy operation:
sf project:deploy:pipeline:report --devops-center-username MyStagingSandbox --use-most-recent

## Plugin

**@salesforce/plugin-devops-center** (jit)
