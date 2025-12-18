# package1:version:create

**Create a first-generation package version in the release org.**

## Description

The package version is based on the contents of the specified metadata package. Omit --managed-released if you want to create an unmanaged package version.

## Usage

```bash
sf package1:version:create [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-d, --description`

Package version description.

- **Type**: option

### `-k, --installation-key`

Installation key for key-protected package (default: null).

- **Type**: option

### `--loglevel`

- **Type**: option

### `-m, --managed-released`

Create a managed package version.

- **Type**: boolean

### `-n, --name`

Package version name.

- **Type**: option
- **Required**: Yes

### `-i, --package-id`

ID of the metadata package (starts with 033) of which you’re creating a new version.

- **Type**: option
- **Required**: Yes

### `-p, --post-install-url`

Post install URL.

- **Type**: option

### `-r, --release-notes-url`

Release notes URL.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-v, --version`

Package version in major.minor format, for example, 3.2.

- **Type**: option

### `-w, --wait`

Minutes to wait for the package version to be created (default: 2 minutes).

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Create a first-generation package version from the package with the specified ID and name the package version "example"; use your default org:
sf package1:version:create --package-id 033... --name example

Same as previous example, but provide a description and wait for 30 minutes for the package version to be created; use the specified org:
sf package1:version:create --package-id 033... --name example --description "example description" --wait 30 --target-org myorg@example.com

## Aliases

- `force:package1:version:create`

## Alternative Syntaxes

- `sf version:package1:create`
- `sf version:create:package1`
- `sf package1:create:version`
- `sf create:package1:version`
- `sf create:version:package1`

## Plugin

**@salesforce/plugin-packaging** (core)
