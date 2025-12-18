# data:query

**Execute a SOQL query.**

## Description

Specify the SOQL query at the command line with the --query flag or read the query from a file with the --file flag.

If your query returns more than 10,000 records, prefer to use the `sf data export bulk` command instead. It runs the query using Bulk API 2.0, which has higher limits than the default API used by the command.

## Usage

```bash
sf data:query [flags]
```

## Flags

### Command Flags

### `--all-rows`

Include deleted records. By default, deleted records are not returned.

- **Type**: boolean

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-f, --file`

File that contains the SOQL query.

- **Type**: option

### `--loglevel`

- **Type**: option

### `--output-file`

File where records are written; only CSV and JSON output formats are supported.

- **Type**: option

### `--perflog`

Get API performance data.

- **Type**: boolean

### `-q, --query`

SOQL query to execute.

- **Type**: option

### `-r, --result-format`

Format to display the results; the --json flag overrides this flag.

- **Type**: option
- **Default**: `human`

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-t, --use-tooling-api`

Use Tooling API so you can run queries on Tooling API objects.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Specify a SOQL query at the command line; the command uses your default org:
sf data:query --query "SELECT Id, Name, Account.Name FROM Contact"

Read the SOQL query from a file called "query.txt" and write the CSV-formatted output to a file; the command uses the org with alias "my-scratch":
sf data:query --file query.txt --output-file output.csv --result-format csv --target-org my-scratch

Use Tooling API to run a query on the ApexTrigger Tooling API object:
sf data:query --query "SELECT Name FROM ApexTrigger" --use-tooling-api

## Aliases

- `force:data:soql:query`

## Alternative Syntaxes

- `sf query:data`

## Plugin

**@salesforce/plugin-data** (core)
