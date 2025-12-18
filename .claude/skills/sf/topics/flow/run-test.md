# flow:run:test

**Invoke flow tests in an org.**

## Description

Specify which tests to run by using the --class-names flag followed by the names of the flows you want to test. For example, if you save a flow with the name Flow1, then use: --class-names Flow1.

To see code coverage results, use the --code-coverage flag with --result-format. The output displays a high-level summary of the test run and the code coverage values for classes in your org. If you specify human-readable result format, use the --detailed-coverage flag to see detailed coverage results for each test method run.

By default, "flow run test" runs asynchronously and immediately returns a test run ID. If you use the -–synchronous flag, you can use the --wait flag to specify the number of minutes to wait; if the tests finish in that timeframe, the command displays the results. If the tests haven't finished by the end of the wait time, the command displays a test run ID. Use the "flow get test --test-run-id" command to get the results.

You must have the "View All Data" org system permission to use this command. The permission is disabled by default and can be enabled only by a system administrator.

## Usage

```bash
sf flow:run:test [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-n, --class-names`

Flow names that contain flow tests to run.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-c, --code-coverage`

Retrieve code coverage results.

- **Type**: boolean

### `--concise`

Display only failed test results; works with human-readable output only.

- **Type**: boolean

### `-d, --output-dir`

Directory in which to store test result files.

- **Type**: option

### `-r, --result-format`

Format of the test results.

- **Type**: option
- **Default**: `human`

### `-s, --suite-names`

Not available for flow tests.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-y, --synchronous`

Run flow tests for one flow synchronously; if not specified, tests are run asynchronously.

- **Type**: boolean

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-l, --test-level`

Level of tests to run; default is RunLocalTests.

- **Type**: option

### `-t, --tests`

Flow test names to run.

- **Type**: option
- **Multiple**: Can be specified multiple times

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Run all local tests in your default org:
sf flow:run:test --test-level RunLocalTests

Run all the Flow1 and Flow2 flow tests in the org with alias “scratchOrg”:
sf flow:run:test --target-org scratchOrg --class-names Flow1 --class-names Flow2

Run specific Flow1 and Flow2 flow tests in your default org:
sf flow:run:test --tests Flow1.Test1 --tests Flow2.Test2 --test-level RunSpecifiedTests

Run all tests synchronously in your default org; the command waits to display the test results until all tests finish:
sf flow:run:test –synchronous

Run all local tests in the org with the username “me@my.org”; save the output to the specified directory:
sf flow:run:test --test-level RunLocalTests --output-dir /Users/susan/temp/cliOutput --target-org me@my.org

## Alternative Syntaxes

- `sf run:flow:test`
- `sf run:test:flow`
- `sf flow:test:run`
- `sf test:flow:run`
- `sf test:run:flow`

## Plugin

**@salesforce/plugin-flow** (jit)
