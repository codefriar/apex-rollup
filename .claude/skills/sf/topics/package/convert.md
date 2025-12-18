# package:convert

**Convert a managed-released first-generation managed package into a second-generation managed package.**

## Description

The package conversion command automatically selects the latest released major.minor first-generation managed package version, and converts it into a second-generation managed package version.

Use --patch-version to specify a released patch version.

To retrieve details about a package version create request, including status and package version ID (04t), run "sf package version create report -i 08c...".

To protect the contents of your package and to prevent unauthorized installation of your package, specify the --installation-key flag.

To promote a package version to released, you must use the --code-coverage parameter. The package must also meet the code coverage requirements.

To list package version creation requests in the org, run "sf package version create list".

## Usage

```bash
sf package:convert [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-s, --build-instance`

Instance where the conversion package version will be created, such as NA50.

- **Type**: option

### `-c, --code-coverage`

Calculate and store the code coverage percentage by running the packaged Apex tests included in this package version.

- **Type**: boolean

### `-f, --definition-file`

Path to a definition file that contains features and org preferences that the metadata of the package version depends on.

- **Type**: option

### `-k, --installation-key`

Installation key for key-protected package.

- **Type**: option

### `-x, --installation-key-bypass`

Bypass the installation key requirement.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-p, --package`

ID (starts with 033) of the first-generation managed package to convert.

- **Type**: option
- **Required**: Yes

### `-a, --patch-version`

Specific released patch version to be converted.

- **Type**: option

### `-m, --seed-metadata`

Directory containing metadata to be deployed prior to conversion.

- **Type**: option

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--verbose`

Display verbose command output.

- **Type**: boolean

### `-w, --wait`

Minutes to wait for the package version to be created.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Create a second-generation managed package version from the first-generation managed package with the specified ID and give it the installation key "password123"; uses your default Dev Hub org:
sf package:convert --package 033... --installation-key password123

Similar to previous example, but uses the specified Dev Hub org:
sf package:convert --package 033... --installation-key password123 --target-dev-hub devhuborg@example.com

## Aliases

- `force:package:convert`

## Alternative Syntaxes

- `sf convert:package`

## Plugin

**@salesforce/plugin-packaging** (core)
