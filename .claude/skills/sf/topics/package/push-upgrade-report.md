# package:push-upgrade:report

**Retrieve the status of a package push upgrade.**

## Description

Specify the request ID for which you want to view details. If applicable, the command displays errors related to the request.

To show all requests in the org, run "sf package pushupgrade list".

## Usage

```bash
sf package:push-upgrade:report [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-i, --push-request-id`

ID of the package push request (starts with 0DV). This ID is returned after the package push-upgrade schedule command completes successfully.

- **Type**: option
- **Required**: Yes

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

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

Retrieve details about the package push upgrade with the specified ID; uses your default Dev Hub org:
sf package:push-upgrade:report --push-request-id 0DV...

Retrieve details about the specified package push request in the Dev Hub org with username devhub@example.com:
sf package:push-upgrade:report --push-request-id 0DV... --target-dev-hub devhub@example.com

## Aliases

- `force:package:push-upgrade:report`

## Alternative Syntaxes

- `sf push-upgrade:package:report`
- `sf push-upgrade:report:package`
- `sf package:report:push-upgrade`
- `sf report:package:push-upgrade`
- `sf report:push-upgrade:package`

## Plugin

**@salesforce/plugin-packaging** (core)
