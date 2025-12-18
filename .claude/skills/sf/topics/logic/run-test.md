# logic:run:test

**Invoke tests for Apex and Flows in an org.**

## Description

This command provides a single and unified way to run tests for multiple Salesforce features, such as Apex classes and Flows. Running the tests together with a single command ensures seamless interoperability between the features.

By default, the command executes asynchronously and returns a test run ID. Then use the "sf logic get test" command to retrieve the results. If you want to wait for the test run to complete and see the results in the command output, use the --synchronous flag.

To run specific tests, use the --tests flag and pass it the names of Apex and Flow tests. For Apex, simply specify the name of the Apex test class. For Flows, use the format "FlowTesting.<name-of-flow-test>". To find the name of all the flow tests in your org, run this command and specify the Flow category, such as "sf logic run test --synchronous --test-category Flow --test-level RunAllTestsInOrg". The command displays a table of all the flow tests it ran; see the "TEST NAME" column for the full name of all available flow tests in your org.

You can also run specific test methods, although if you run the tests synchronously, the methods must belong to a single Apex class or Flow test. To run all tests of a certain category, use --test-category and --test-level together. If neither of these flags is specified, all local tests for all categories are run by default. You can also use the --class-names and --suite-names flags to run Apex test classes or suites.

To see code coverage results, use the --code-coverage flag with --result-format. The output displays a high-level summary of the test run and the code coverage values for the tested classes or flows. If you specify human-readable result format, use the --detailed-coverage flag to see detailed coverage results for each test method run.

You must have the "View All Data" org system permission to use this command. The permission is disabled by default and can be enabled only by a system administrator.

## Usage

```bash
sf logic:run:test [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-n, --class-names`

Apex test class names to run; default is all classes.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-c, --code-coverage`

Retrieve code coverage results.

- **Type**: boolean

### `--concise`

Display only failed test results; works with human-readable output only.

- **Type**: boolean

### `-v, --detailed-coverage`

Display detailed code coverage per test.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-d, --output-dir`

Directory in which to store test run files.

- **Type**: option

### `-r, --result-format`

Format of the test results.

- **Type**: option
- **Default**: `human`

### `-s, --suite-names`

Apex test suite names to run.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-y, --synchronous`

Runs test methods from a single Apex class synchronously; if not specified, tests are run asynchronously.

- **Type**: boolean

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--test-category`

Category of tests to run, such as Apex or Flow.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-l, --test-level`

Level of tests to run; default is RunLocalTests.

- **Type**: option

### `-t, --tests`

Comma-separated list of test names to run. Can include Apex test classes and Flow tests.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-w, --wait`

Sets the streaming client socket timeout in minutes; specify a longer wait time if timeouts occur frequently.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Run a mix of specific Apex and Flow tests asynchronously in your default org:
sf logic:run:test --tests MyApexClassTest,FlowTesting.Modify_Account_Desc.Modify_Account_Desc_TestAccountDescription

Run all local Apex and Flow tests and wait for the results to complete; run the tests in the org with alias "my-scratch":
sf logic:run:test --test-level RunLocalTests --test-category Apex --test-category Flow --synchronous --target-org my-scratch

Run two methods in an Apex test class and an Apex test suite:
sf logic:run:test --class-names MyApexClassTest.methodA --class-names MyApexClassTest.methodB --suite-names MySuite

Run all local tests for all categories (the default behavior), save the JUnit results to the "test-results" directory, and include code coverage results:
sf logic:run:test --result-format junit --output-dir test-results --synchronous --code-coverage

## Alternative Syntaxes

- `sf run:logic:test`
- `sf run:test:logic`
- `sf logic:test:run`
- `sf test:logic:run`
- `sf test:run:logic`

## Plugin

**@salesforce/plugin-apex** (core)
