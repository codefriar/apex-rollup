# project:deploy:quick

**Quickly deploy a validated deployment to an org.**

## Description

Before you run this command, first create a validated deployment with the "sf project deploy validate" command, which returns a job ID. Validated deployments haven't been deployed to the org yet; you deploy them with this command. Either pass the job ID to this command or use the --use-most-recent flag to use the job ID of the most recently validated deployment. For the quick deploy to succeed, the associated validated deployment must also have succeeded.

Executing this quick deploy command takes less time than a standard deploy because it skips running Apex tests. These tests were previously run as part of the validation. Validating first and then running a quick deploy is useful if the deployment to your production org take several hours and you don’t want to risk a failed deploy.

This command doesn't support source-tracking. The source you deploy overwrites the corresponding metadata in your org. This command doesn’t attempt to merge your source with the versions in your org.

Note: Don't use this command on sandboxes; the command is intended to be used on production orgs. By default, sandboxes don't run tests during a deploy. Use "sf project deploy start" instead.

## Usage

```bash
sf project:deploy:quick [flags]
```

## Flags

### Command Flags

### `-a, --api-version`

Target API version for the deploy.

- **Type**: option

### `--async`

Run the command asynchronously.

- **Type**: boolean

### `--concise`

Show concise output of the deploy result.

- **Type**: boolean

### `-i, --job-id`

Job ID of the deployment you want to quick deploy.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org.

- **Type**: option

### `-r, --use-most-recent`

Use the job ID of the most recently validated deployment.

- **Type**: boolean

### `--verbose`

Show verbose output of the deploy result.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for the command to complete and display results.

- **Type**: option
- **Default**: `33 minutes`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Run a quick deploy to your default org using a job ID:
sf project:deploy:quick --job-id 0Af0x000017yLUFCA2

Asynchronously run a quick deploy of the most recently validated deployment to an org with alias "my-prod-org":
sf project:deploy:quick --async --use-most-recent --target-org my-prod-org

## Aliases

- `deploy:metadata:quick`

## Alternative Syntaxes

- `sf deploy:project:quick`
- `sf deploy:quick:project`
- `sf project:quick:deploy`
- `sf quick:project:deploy`
- `sf quick:deploy:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
