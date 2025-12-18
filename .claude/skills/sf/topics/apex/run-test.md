# apex:run:test

**Invoke Apex tests in an org.**

## Description

Specify which tests to run by using the --class-names, --suite-names, or --tests flags. Alternatively, use the --test-level flag to run all the tests in your org, local tests, or specified tests.

To see code coverage results, use the --code-coverage flag with --result-format. The output displays a high-level summary of the test run and the code coverage values for classes in your org. If you specify human-readable result format, use the --detailed-coverage flag to see detailed coverage results for each test method run.

By default, Apex tests run asynchronously and immediately return a test run ID. You can use the --wait flag to specify the number of minutes to wait; if the tests finish in that timeframe, the command displays the results. If the tests haven't finished by the end of the wait time, the command displays a test run ID. Use the "sf apex get test --test-run-id" command to get the results.

To run both Apex and Flow tests together, run the "sf logic run test" CLI command, which has similar flags as this command, but expands the --tests flag to also include Flow tests.

You must have the "View All Data" system permission to use this command. The permission is disabled by default and can be enabled only by a system administrator.

NOTE: The testRunCoverage value (JSON and JUnit result formats) is a percentage of the covered lines and total lines from all the Apex classes evaluated by the tests in this run.

## Usage

```bash
sf apex:run:test [flags]
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

### `-l, --test-level`

Level of tests to run; default is RunLocalTests.

- **Type**: option

### `-t, --tests`

Apex test class names or IDs and, if applicable, test methods to run; default is all tests.

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

Run all Apex tests and suites in your default org:
sf apex:run:test

Run the specified Apex test classes in your default org and display results in human-readable form:
sf apex:run:test --class-names MyClassTest --class-names MyOtherClassTest --result-format human

Run the specified Apex test suites in your default org and include code coverage results and additional details:
sf apex:run:test --suite-names MySuite --suite-names MyOtherSuite --code-coverage --detailed-coverage

Run the specified Apex tests in your default org and display results in human-readable output:
sf apex:run:test --tests MyClassTest.testCoolFeature --tests MyClassTest.testAwesomeFeature --tests AnotherClassTest --tests namespace.TheirClassTest.testThis --result-format human

Run all tests in the org with the specified username with the specified test level; save the output to the specified directory:
sf apex:run:test --test-level RunLocalTests --output-dir <path to outputdir> --target-org me@my.org

Run all tests in the org asynchronously:
sf apex:run:test --target-org myscratch

Run all tests synchronously; the command waits to display the test results until all tests finish:
sf apex:run:test --synchronous

Run specific tests using the --test-level flag:
sf apex:run:test --test-level RunLocalTests

Run Apex tests on all the methods in the specified class; output results in Test Anything Protocol (TAP) format and request code coverage results:
sf apex:run:test --class-names TestA --class-names TestB --result-format tap --code-coverage

Run Apex tests on methods specified using the standard Class.method notation; if you specify a test class without a method, the command runs all methods in the class:
sf apex:run:test --tests TestA.excitingMethod --tests TestA.boringMethod --tests TestB

Run Apex tests on methods specified using the standard Class.method notation with a namespace:
sf apex:run:test --tests ns.TestA.excitingMethod --tests ns.TestA.boringMethod --tests ns.TestB

## Aliases

- `force:apex:test:run`

## Alternative Syntaxes

- `sf run:apex:test`
- `sf run:test:apex`
- `sf apex:test:run`
- `sf test:apex:run`
- `sf test:run:apex`

## Plugin

**@salesforce/plugin-apex** (core)
