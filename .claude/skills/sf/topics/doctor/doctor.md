# doctor

**Gather CLI configuration data and run diagnostic tests to discover and report potential problems in your environment.**

## Description

When you run the doctor command without parameters, it first displays a diagnostic overview of your environment. It then writes a detailed diagnosis to a JSON file in the current directory. Use the --outputdir to specify a different directory. To run diagnostic tests on a specific plugin, use the --plugin parameter. If the plugin isn't listening to the doctor, then you get a warning.

Use the --command parameter to run a specific command in debug mode; the doctor writes both stdout and stderr to \*.log files that you can provide to Salesforce Customer Support or attach to a GitHub issue.

Plugin providers can also implement their own doctor diagnostic tests by listening to the "sf-doctor" event and running plugin specific tests that are then included in the doctor diagnostics log.

## Usage

```bash
sf doctor [flags]
```

## Flags

### Command Flags

### `-c, --command`

Command to run in debug mode; results are written to a log file.

- **Type**: option

### `-i, --create-issue`

Create a new issue on our GitHub repo and attach all diagnostic results.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-d, --output-dir`

Directory to save all created files rather than the current working directory.

- **Type**: option

### `-p, --plugin`

Specific plugin on which to run diagnostics.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Run CLI doctor diagnostics:
sf doctor

Run CLI doctor diagnostics and the specified command, and write the debug output to a file:
sf doctor --command "force:org:list --all"

Run CLI doctor diagnostics for a specific plugin:
sf doctor --plugin @salesforce/plugin-source

## Plugin

**@salesforce/plugin-info** (core)
