# package:version:create:report

**Retrieve details about a package version creation request.**

## Description

Specify the request ID for which you want to view details. If applicable, the command displays errors related to the request.

To show all requests in the org, run "sf package version create list".

## Usage

```bash
sf package:version:create:report [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-i, --package-create-request-id`

ID (starts with 08c) of the package version creation request you want to display.

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

Retrieve details about the package version creation request with the specified ID; uses your default Dev Hub org:
sf package:version:create:report --package-create-request-id 08c...

Retrieve details about the specified package version creation request in the Dev Hub org with username devhub@example.com:
sf package:version:create:report --package-create-request-id 08c... --target-dev-hub devhub@example.com

## Aliases

- `force:package:version:create:report`

## Alternative Syntaxes

- `sf version:package:create:report`
- `sf version:create:package:report`
- `sf version:create:report:package`
- `sf package:create:version:report`
- `sf create:package:version:report`
- `sf create:version:package:report`
- `sf create:version:report:package`
- `sf package:create:report:version`
- `sf create:package:report:version`
- `sf create:report:package:version`
- `sf create:report:version:package`
- `sf package:version:report:create`
- `sf version:package:report:create`
- `sf version:report:package:create`
- `sf version:report:create:package`
- `sf package:report:version:create`
- `sf report:package:version:create`
- `sf report:version:package:create`
- `sf report:version:create:package`
- `sf package:report:create:version`
- `sf report:package:create:version`
- `sf report:create:package:version`
- `sf report:create:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
