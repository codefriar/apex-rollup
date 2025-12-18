# project:deploy:cancel

**Cancel a deploy operation.**

## Description

Use this command to cancel a deploy operation that hasn't yet completed in the org. Deploy operations include standard deploys, quick deploys, deploy validations, and deploy cancellations.

Run this command by either passing it a job ID or specifying the --use-most-recent flag to use the job ID of the most recent deploy operation.

## Usage

```bash
sf project:deploy:cancel [flags]
```

## Flags

### Command Flags

### `--async`

Run the command asynchronously.

- **Type**: boolean

### `-i, --job-id`

Job ID of the deploy operation you want to cancel.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org.

- **Type**: option

### `-r, --use-most-recent`

Use the job ID of the most recent deploy operation.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for the command to complete and display results.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Cancel a deploy operation using a job ID:
sf project:deploy:cancel --job-id 0Af0x000017yLUFCA2

Cancel the most recent deploy operation:
sf project:deploy:cancel --use-most-recent

## Aliases

- `deploy:metadata:cancel`

## Alternative Syntaxes

- `sf deploy:project:cancel`
- `sf deploy:cancel:project`
- `sf project:cancel:deploy`
- `sf cancel:project:deploy`
- `sf cancel:deploy:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
