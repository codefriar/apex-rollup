# package:version:displayancestry

**Display the ancestry tree for a 2GP managed package version.**

## Usage

```bash
sf package:version:displayancestry [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--dot-code`

Display the ancestry tree in DOT code.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-p, --package`

ID or alias of the package (starts with 0Ho) or package version (starts with 04t) to display ancestry for.

- **Type**: option
- **Required**: Yes

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--verbose`

Display both the package version ID (starts with 04t) and the version number (major.minor.patch.build) in the ancestry tree.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Display the ancestry tree for a package version with the specified alias, using your default Dev Hub org:
sf package:version:displayancestry --package package_version_alias

Similar to previous example, but display the output in DOT code:
sf package:version:displayancestry --package package_version_alias --dot-code

Display the ancestry tree for a package with the specified ID, using the Dev Hub org with username devhub@example.com:
sf package:version:displayancestry --package OHo... --target-dev-hub devhub@example.com

Display the ancestry tree of a package version with the specified ID, using your default Dev Hub org:
sf package:version:displayancestry --package 04t...

## Aliases

- `force:package:version:displayancestry`

## Alternative Syntaxes

- `sf version:package:displayancestry`
- `sf version:displayancestry:package`
- `sf package:displayancestry:version`
- `sf displayancestry:package:version`
- `sf displayancestry:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
