# data:export:tree

**Export data from an org into one or more JSON files.**

## Description

Specify a SOQL query, either directly at the command line or read from a file, to retrieve the data you want to export. The exported data is written to JSON files in sObject tree format, which is a collection of nested, parent-child records with a single root record. Use these JSON files to import data into an org with the "sf data import tree" command.

If your SOQL query references multiple objects, the command generates a single JSON file by default. You can specify the --plan flag to generate separate JSON files for each object and a plan definition file that aggregates them. You then specify just this plan definition file when you import the data into an org.

The SOQL query can return a maximum of 2,000 records. For more information, see the REST API Developer Guide. (https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/resources_composite_sobject_tree.htm).

## Usage

```bash
sf data:export:tree [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-d, --output-dir`

Directory in which to generate the JSON files; default is current directory.

- **Type**: option

### `-p, --plan`

Generate multiple sObject tree files and a plan definition file for aggregated import.

- **Type**: boolean

### `-x, --prefix`

Prefix of generated files.

- **Type**: option

### `-q, --query`

SOQL query, or filepath of a file that contains the query, to retrieve records.

- **Type**: option
- **Required**: Yes
- **Multiple**: Can be specified multiple times

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

Export records retrieved with the specified SOQL query into a single JSON file in the current directory; the command uses your default org:
sf data:export:tree --query "SELECT Id, Name, (SELECT Name, Address**c FROM Properties**r) FROM Broker\_\_c"

Export data using a SOQL query in the "query.txt" file and generate JSON files for each object and a plan that aggregates them:
sf data:export:tree --query query.txt --plan

Prepend "export-demo" before each generated file and generate the files in the "export-out" directory; run the command on the org with alias "my-scratch":
sf data:export:tree --query query.txt --plan --prefix export-demo --output-dir export-out --target-org my-scratch

## Aliases

- `force:data:tree:export`

## Alternative Syntaxes

- `sf export:data:tree`
- `sf export:tree:data`
- `sf data:tree:export`
- `sf tree:data:export`
- `sf tree:export:data`

## Plugin

**@salesforce/plugin-data** (core)
