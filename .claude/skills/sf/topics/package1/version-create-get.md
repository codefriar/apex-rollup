# package1:version:create:get

**Retrieve the status of a package version creation request.**

## Usage

```bash
sf package1:version:create:get [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-i, --request-id`

ID of the PackageUploadRequest (starts with 0HD).

- **Type**: option
- **Required**: Yes

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

Get the status of the creation request for the package version with the specified ID in your default org:
sf package1:version:create:get --request-id 0HD...

Same as previous example, but use the specified org:
sf package1:version:create:get --request-id 0HD... --target-org myorg@example.com

## Aliases

- `force:package1:version:create:get`

## Alternative Syntaxes

- `sf version:package1:create:get`
- `sf version:create:package1:get`
- `sf version:create:get:package1`
- `sf package1:create:version:get`
- `sf create:package1:version:get`
- `sf create:version:package1:get`
- `sf create:version:get:package1`
- `sf package1:create:get:version`
- `sf create:package1:get:version`
- `sf create:get:package1:version`
- `sf create:get:version:package1`
- `sf package1:version:get:create`
- `sf version:package1:get:create`
- `sf version:get:package1:create`
- `sf version:get:create:package1`
- `sf package1:get:version:create`
- `sf get:package1:version:create`
- `sf get:version:package1:create`
- `sf get:version:create:package1`
- `sf package1:get:create:version`
- `sf get:package1:create:version`
- `sf get:create:package1:version`
- `sf get:create:version:package1`

## Plugin

**@salesforce/plugin-packaging** (core)
