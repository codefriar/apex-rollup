# logic:get:test

**Get the results of a test run.**

## Description

When you run 'sf logic run test' to test Apex classes and Flows asynchronously, it returns a test run ID. Use that ID with this command to see the results.

To see code coverage results, use the --code-coverage flag with --result-format. The output displays a high-level summary of the test run and the code coverage values for classes in your org. If you specify human-readable result format, use the --detailed-coverage flag to see detailed coverage results for each test method run.

## Usage

```bash
sf logic:get:test [flags]
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

Get the results for a specific test run ID in the default human-readable format; uses your default org:
sf logic:get:test --test-run-id <test run id>

Get the results for a specific test run ID, format them as JUnit, and save them to the "test-results/junit" directory; uses the org with alias "my-scratch":
sf logic:get:test --test-run-id <test run id> --result-format junit --target-org my-scratch

## Alternative Syntaxes

- `sf get:logic:test`
- `sf get:test:logic`
- `sf logic:test:get`
- `sf test:logic:get`
- `sf test:get:logic`

## Plugin

**@salesforce/plugin-apex** (core)
