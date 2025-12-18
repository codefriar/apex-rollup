# project:deploy:resume

**Resume watching a deploy operation and update source tracking when the deploy completes.**

## Description

Use this command to resume watching a deploy operation if the original command times out or you specified the --async flag. Deploy operations include standard deploys, quick deploys, deploy validations, and deploy cancellations. This command doesn't resume the original operation itself, because the operation always continues after you've started it, regardless of whether you're watching it or not. When the deploy completes, source tracking information is updated as needed.

Run this command by either passing it a job ID or specifying the --use-most-recent flag to use the job ID of the most recent deploy operation.

## Usage

```bash
sf project:deploy:resume [flags]
```

## Flags

### Command Flags

### `--concise`

Show concise output of the deploy operation result.

- **Type**: boolean

### `--coverage-formatters`

Format of the code coverage results.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-i, --job-id`

Job ID of the deploy operation you want to resume.

- **Type**: option

### `--junit`

Output JUnit test results.

- **Type**: boolean

### `--results-dir`

Output directory for code coverage and JUnit results; defaults to the deploy ID.

- **Type**: option

### `-r, --use-most-recent`

Use the job ID of the most recent deploy operation.

- **Type**: boolean

### `--verbose`

Show verbose output of the deploy operation result.

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

Resume watching a deploy operation using a job ID:
sf project:deploy:resume --job-id 0Af0x000017yLUFCA2

Resume watching the most recent deploy operation:
sf project:deploy:resume --use-most-recent

## Aliases

- `deploy:metadata:resume`

## Alternative Syntaxes

- `sf deploy:project:resume`
- `sf deploy:resume:project`
- `sf project:resume:deploy`
- `sf resume:project:deploy`
- `sf resume:deploy:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
