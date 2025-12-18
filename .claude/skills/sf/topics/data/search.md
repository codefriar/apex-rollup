# data:search

**Execute a SOSL text-based search query.**

## Description

Specify the SOSL query at the command line with the --query flag or read the query from a file with the --file flag.

By default, the results are written to the terminal in human-readable format. If you specify `--result-format csv`, the output is written to one or more CSV (comma-separated values) files. The file names correspond to the Salesforce objects in the results, such as Account.csv. Both `--result-format human` and `--result-format json` display only to the terminal.

## Usage

```bash
sf data:search [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-f, --file`

File that contains the SOSL query.

- **Type**: option

### `-q, --query`

SOSL query to execute.

- **Type**: option

### `-r, --result-format`

Format to display the results, or to write to disk if you specify "csv".

- **Type**: option
- **Default**: `human`

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

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

Specify a SOSL query at the command line; the command uses your default org:
sf data:search --query "FIND {Anna Jones} IN Name Fields RETURNING Contact (Name, Phone)"

Read the SOSL query from a file called "query.txt"; the command uses the org with alias "my-scratch":
sf data:search --file query.txt --target-org my-scratch

Similar to the previous example, but write the results to one or more CSV files, depending on the Salesforce objects in the results:
sf data:search --file query.txt --target-org my-scratch --result-format csv

## Alternative Syntaxes

- `sf search:data`

## Plugin

**@salesforce/plugin-data** (core)
