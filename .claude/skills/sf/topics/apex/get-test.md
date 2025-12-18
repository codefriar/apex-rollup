# apex:get:test

**Display test results for a specific asynchronous test run.**

## Description

Provide a test run ID to display test results for an enqueued or completed asynchronous test run. The test run ID is displayed after running the "sf apex test run" command.

To see code coverage results, use the --code-coverage flag with --result-format. The output displays a high-level summary of the test run and the code coverage values for classes in your org. If you specify human-readable result format, use the --detailed-coverage flag to see detailed coverage results for each test method run.

## Usage

```bash
sf apex:get:test [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-c, --code-coverage`

Retrieve code coverage results.

- **Type**: boolean

### `--concise`

Display only failed test results; works with human-readable output only.

- **Type**: boolean

### `--detailed-coverage`

Display detailed code coverage per test.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-d, --output-dir`

Directory in which to store test result files.

- **Type**: option

### `-r, --result-format`

Format of the test results.

- **Type**: option
- **Default**: `human`

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-i, --test-run-id`

ID of the test run.

- **Type**: option
- **Required**: Yes

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Display test results for your default org using a test run ID:
sf apex:get:test --test-run-id <test run id>

Similar to previous example, but output the result in JUnit format:
sf apex:get:test --test-run-id <test run id> --result-format junit

Also retrieve code coverage results and output in JSON format:
sf apex:get:test --test-run-id <test run id> --code-coverage --json

Specify a directory in which to save the test results from the org with the specified username (rather than your default org):
sf apex:get:test --test-run-id <test run id> --code-coverage --output-dir <path to outputdir> --target-org me@myorg'

## Aliases

- `force:apex:test:report`

## Alternative Syntaxes

- `sf get:apex:test`
- `sf get:test:apex`
- `sf apex:test:get`
- `sf test:apex:get`
- `sf test:get:apex`

## Plugin

**@salesforce/plugin-apex** (core)
