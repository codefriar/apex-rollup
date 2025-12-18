# project:deploy:report

**Check or poll for the status of a deploy operation.**

## Description

Deploy operations include standard deploys, quick deploys, deploy validations, and deploy cancellations.

Run this command by either passing it a job ID or specifying the --use-most-recent flag to use the job ID of the most recent deploy operation. If you specify the --wait flag, the command polls for the status every second until the timeout of --wait minutes. If you don't specify the --wait flag, the command simply checks and displays the status of the deploy; the command doesn't poll for the status.

You typically don't specify the --target-org flag because the cached job already references the org to which you deployed. But if you run this command on a computer different than the one from which you deployed, then you must specify the --target-org and it must point to the same org.

This command doesn't update source tracking information.

## Usage

```bash
sf project:deploy:report [flags]
```

## Flags

### Command Flags

### `--coverage-formatters`

Format of the code coverage results.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-i, --job-id`

Job ID of the deploy operation you want to check the status of.

- **Type**: option

### `--junit`

Output JUnit test results.

- **Type**: boolean

### `--results-dir`

Output directory for code coverage and JUnit results; defaults to the deploy ID.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org.

- **Type**: option

### `-r, --use-most-recent`

Use the job ID of the most recent deploy operation.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for command to complete and display results.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Check the status using a job ID:
sf project:deploy:report --job-id 0Af0x000017yLUFCA2

Check the status of the most recent deploy operation:
sf project:deploy:report --use-most-recent

Poll for the status using a job ID and target org:
sf project:deploy:report --job-id 0Af0x000017yLUFCA2 --target-org me@my.org --wait 30

## Aliases

- `deploy:metadata:report`

## Alternative Syntaxes

- `sf deploy:project:report`
- `sf deploy:report:project`
- `sf project:report:deploy`
- `sf report:project:deploy`
- `sf report:deploy:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
