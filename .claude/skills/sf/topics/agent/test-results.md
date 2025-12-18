# agent:test:results

**Get the results of a completed agent test run.**

## Description

This command requires a job ID, which the original "agent test run" command displays when it completes. You can also use the --use-most-recent flag to see results for the most recently run agent test.

By default, this command outputs test results in human-readable tables for each test case. The tables show whether the test case passed, the expected and actual values, the test score, how long the test took, and more. Use the --result-format to display the test results in JSON or Junit format. Use the --output-dir flag to write the results to a file rather than to the terminal.

## Usage

```bash
sf agent:test:results [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-i, --job-id`

Job ID of the completed agent test run.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory to write the agent test results into.

- **Type**: option

### `--result-format`

Format of the agent test run results.

- **Type**: option
- **Default**: `human`

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--verbose`

Show generated data in the test results output.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Get the results of an agent test run in your default org using its job ID:
sf agent:test:results --job-id 4KBfake0000003F4AQ

Get the results of the most recently run agent test in an org with alias "my-org":
sf agent:test:results --use-most-recent --target-org my-org

Get the results of the most recently run agent test in your default org, and write the JSON-formatted results into a directory called "test-results":
sf agent:test:results --use-most-recent --output-dir ./test-results --result-format json

## Alternative Syntaxes

- `sf test:agent:results`
- `sf test:results:agent`
- `sf agent:results:test`
- `sf results:agent:test`
- `sf results:test:agent`

## Plugin

**@salesforce/plugin-agent** (core)
