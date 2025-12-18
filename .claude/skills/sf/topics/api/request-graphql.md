# api:request:graphql

**Execute a GraphQL statement.**

## Description

Specify the GraphQL statement with the "--body" flag, either directly at the command line or with a file that contains the statement. You can query Salesforce records using a "query" statement or use mutations to modify Salesforce records.

This command uses the GraphQL API to query or modify Salesforce objects. For details about the API, and examples of queries and mutations, see https://developer.salesforce.com/docs/platform/graphql/guide/graphql-about.html.

## Usage

```bash
sf api:request:graphql [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--body`

File or content with the GraphQL statement. Specify "-" to read from standard input.

- **Type**: option
- **Required**: Yes

### `-i, --include`

Include the HTTP response status and headers in the output.

- **Type**: boolean

### `-S, --stream-to-file`

Stream responses to a file.

- **Type**: option

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

Execute a GraphQL query on the Account object by specifying the query directly to the "--body" flag; the command uses your default org:
sf api:request:graphql --body "query accounts { uiapi { query { Account { edges { node { Id \n Name { value } } } } } } }"

Read the GraphQL statement from a file called "example.txt" and execute it on an org with alias "my-org":
sf api:request:graphql --body example.txt --target-org my-org

Pipe the GraphQL statement that you want to execute from standard input to the command:
$ echo graphql | sf api request graphql --body -

Write the output of the command to a file called "output.txt" and include the HTTP response status and headers:
sf api:request:graphql --body example.txt --stream-to-file output.txt --include

## Alternative Syntaxes

- `sf request:api:graphql`
- `sf request:graphql:api`
- `sf api:graphql:request`
- `sf graphql:api:request`
- `sf graphql:request:api`

## Plugin

**@salesforce/plugin-api** (core)
