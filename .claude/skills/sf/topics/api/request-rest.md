# api:request:rest

**Make an authenticated HTTP request using the Salesforce REST API.**

## Description

When sending the HTTP request with the "--body" flag, you can specify the request directly at the command line or with a file that contains the request.

For a full list of supported REST endpoints and resources, see https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/resources_list.htm.

## Usage

```bash
sf api:request:rest [flags]
```

## Flags

### Command Flags

### `-b, --body`

File or content for the body of the HTTP request. Specify "-" to read from standard input or "" for an empty body. If passing a file, prefix the filename with '@'.

- **Type**: option

### `-f, --file`

JSON file that contains values for the request header, body, method, and URL.

- **Type**: option

### `-H, --header`

HTTP header in "key:value" format.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-i, --include`

Include the HTTP response status and headers in the output.

- **Type**: boolean

### `-X, --method`

HTTP method for the request.

- **Type**: option

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

## Examples

List information about limits in the org with alias "my-org":
sf api:request:rest 'services/data/v56.0/limits' --target-org my-org

List all endpoints in your default org; write the output to a file called "output.txt" and include the HTTP response status and headers:
sf api:request:rest '/services/data/v56.0/' --stream-to-file output.txt --include

Get the response in XML format by specifying the "Accept" HTTP header:
sf api:request:rest '/services/data/v56.0/limits' --header 'Accept: application/xml'

Create an account record using the POST method; specify the request details directly in the "--body" flag:
sf api:request:rest /services/data/v56.0/sobjects/account --body "{\"Name\" : \"Account from REST API\",\"ShippingCity\" : \"Boise\"}" --method POST

Create an account record using the information in a file called "info.json" (note the @ prefixing the file name):
sf api:request:rest '/services/data/v56.0/sobjects/account' --body @info.json --method POST

Update an account record using the PATCH method:
sf api:request:rest '/services/data/v56.0/sobjects/account/<Account ID>' --body "{\"BillingCity\": \"San Francisco\"}" --method PATCH

Store the values for the request header, body, and so on, in a file, which you then specify with the --file flag; see the description of --file for more information:
sf api:request:rest --file myFile.json

## Alternative Syntaxes

- `sf request:api:rest`
- `sf request:rest:api`
- `sf api:rest:request`
- `sf rest:api:request`
- `sf rest:request:api`

## Plugin

**@salesforce/plugin-api** (core)
