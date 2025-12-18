# project:deploy:pipeline:quick

**Quickly deploy a validated deployment to an org.**

## Description

The first time you run any "project deploy pipeline" command, be sure to authorize the org in which DevOps Center is installed. The easiest way to authorize an org is with the "org login web" command.

Before you run this command, create a validated deployment with the "project deploy pipeline validate" command, which returns a job ID. Validated deployments haven't been deployed to the org yet; you deploy them with this command. Either pass the job ID to this command or use the --use-most-recent flag to use the job ID of the most recently validated deployment. For the quick deploy to succeed, the associated validated deployment must also have succeeded.

Executing this quick deploy command takes less time than a standard deploy because it skips running Apex tests. These tests were previously run as part of the validation. Validating first and then running a quick deploy is useful if the deployment to your production org take several hours and you don’t want to risk a failed deploy.

This command doesn't support source-tracking. The source you deploy overwrites the corresponding metadata in your org. This command doesn’t attempt to merge your source with the versions in your org.

## Usage

```bash
sf project:deploy:pipeline:quick [flags]
```

## Flags

### Command Flags

### `--async`

Run the command asynchronously.

- **Type**: boolean

### `--concise`

Show concise output of the command result.

- **Type**: boolean

### `-c, --devops-center-username`

Username or alias of the DevOps Center org.

- **Type**: option
- **Required**: Yes

### `-i, --job-id`

Job ID of the validated deployment to quick deploy.

- **Type**: option

### `-r, --use-most-recent`

Use the job ID of the most recently validated deployment.

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

Run a quick deploy using your default Devops Center org and a job ID:
sf project:deploy:pipeline:quick --job-id 0Af0x000017yLUFCA2

Asynchronously run a quick deploy of the most recently validated deployment using an org with alias "my-prod-org":
sf project:deploy:pipeline:quick --async --use-most-recent --devops-center-username my-prod-org

## Plugin

**@salesforce/plugin-devops-center** (jit)
