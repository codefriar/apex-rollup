# agent:test:resume

**Resume an agent test that you previously started in your org so you can view the test results.**

## Description

This command requires a job ID, which the original "agent test run" command displays when it completes. You can also use the --use-most-recent flag to see results for the most recently run agent test.

Use the --wait flag to specify the number of minutes for this command to wait for the agent test to complete; if the test completes by the end of the wait time, the command displays the test results. If not, the CLI returns control of the terminal to you, and you must run "agent test resume" again.

By default, this command outputs test results in human-readable tables for each test case. The tables show whether the test case passed, the expected and actual values, the test score, how long the test took, and more. Use the --result-format to display the test results in JSON or Junit format. Use the --output-dir flag to write the results to a file rather than to the terminal.

## Usage

```bash
sf agent:test:resume [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-i, --job-id`

Job ID of the original agent test run.

- **Type**: option

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

### `-r, --use-most-recent`

Use the job ID of the most recent agent test run.

- **Type**: boolean

### `--verbose`

Show generated data in the test results output.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for the command to complete and display results to the terminal window.

- **Type**: option
- **Default**: `5 minutes`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Resume an agent test in your default org using a job ID:
sf agent:test:resume --job-id 4KBfake0000003F4AQ

Resume the most recently-run agent test in an org with alias "my-org" org; wait 10 minutes for the tests to finish:
sf agent:test:resume --use-most-recent --wait 10 --target-org my-org

Resume the most recent agent test in your default org, and write the JSON-formatted results into a directory called "test-results":
sf agent:test:resume --use-most-recent --output-dir ./test-results --result-format json

## Alternative Syntaxes

- `sf test:agent:resume`
- `sf test:resume:agent`
- `sf agent:resume:test`
- `sf resume:agent:test`
- `sf resume:test:agent`

## Plugin

**@salesforce/plugin-agent** (core)
