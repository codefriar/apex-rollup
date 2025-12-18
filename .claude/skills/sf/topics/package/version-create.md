# package:version:create

**Create a package version in the Dev Hub org.**

## Description

The package version is based on the package contents in the specified directory.

To retrieve details about a package version create request, including status and package version ID (04t), run "sf package version create report -i 08c...".

We recommend that you specify the --installation-key parameter to protect the contents of your package and to prevent unauthorized installation of your package.

To list package version creation requests in the org, run "sf package version create list".
To promote a package version to released, you must use the --code-coverage parameter. The package must also meet the code coverage requirements. This requirement applies to both managed and unlocked packages.

We don’t calculate code coverage for org-dependent unlocked packages, or for package versions that specify --skip-validation.

## Usage

```bash
sf package:version:create [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--async-validation`

Return a new package version before completing package validations.

- **Type**: boolean

### `-b, --branch`

Name of the branch in your source control system that the package version is based on.

- **Type**: option

### `-s, --build-instance`

Instance where the package version will be created, such as NA50.

- **Type**: option

### `-c, --code-coverage`

Calculate and store the code coverage percentage by running the packaged Apex tests included in this package version.

- **Type**: boolean

### `-f, --definition-file`

Path to a definition file similar to scratch org definition file that contains the list of features and org preferences that the metadata of the package version depends on.

- **Type**: option

### `-k, --installation-key`

Installation key for key-protected package. (either --installation-key or --installation-key-bypass is required)

- **Type**: option

### `-x, --installation-key-bypass`

Bypass the installation key requirement. (either --installation-key or --installation-key-bypass is required)

- **Type**: boolean

### `--language`

Language for the package.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --package`

ID (starts with 0Ho) or alias of the package to create a version of.

- **Type**: option

### `-d, --path`

Path to the directory that contains the contents of the package.

- **Type**: option

### `--post-install-script`

Name of the post-install script; applies to managed packages only.

- **Type**: option

### `--post-install-url`

Post-install instructions URL.

- **Type**: option

### `-r, --preserve`

Preserve temp files that would otherwise be deleted.

- **Type**: boolean

### `--releasenotes-url`

Release notes URL.

- **Type**: option

### `--skip-ancestor-check`

Overrides ancestry requirements, which allows you to specify a package ancestor that isn’t the highest released package version.

- **Type**: boolean

### `--skip-validation`

Skip validation during package version creation; you can’t promote unvalidated package versions.

- **Type**: boolean

### `-t, --tag`

Package version’s tag.

- **Type**: option

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--uninstall-script`

Uninstall script name; applies to managed packages only.

- **Type**: option

### `-j, --validate-schema`

Validate the sfdx-project.json file against the JSON schema.

- **Type**: boolean

### `--verbose`

Display verbose command output.

- **Type**: boolean

### `-e, --version-description`

Description of the package version to be created; overrides the sfdx-project.json value.

- **Type**: option

### `-a, --version-name`

Name of the package version to be created; overrides the sfdx-project.json value.

- **Type**: option

### `-n, --version-number`

Version number of the package version to be created; overrides the sfdx-project.json value.

- **Type**: option

### `-w, --wait`

Number of minutes to wait for the package version to be created.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Create a package version from the contents of the "common" directory and give it an installation key of "password123"; uses your default Dev Hub org:
sf package:version:create --path common --installation-key password123

Create a package version from a package with the specified alias; uses the Dev Hub org with username devhub@example.com:
sf package:version:create --package "Your Package Alias" --installation-key password123 --target-dev-hub devhub@example.com

Create a package version from a package with the specified ID:
sf package:version:create --package 0Ho... --installation-key password123

Create a package version and skip the validation step:
sf package:version:create --path common --installation-key password123 --skip-validation

Create a package version and perform package validations asynchronously:
sf package:version:create --path common --installation-key password123 --async-validation

## Aliases

- `force:package:version:create`

## Alternative Syntaxes

- `sf version:package:create`
- `sf version:create:package`
- `sf package:create:version`
- `sf create:package:version`
- `sf create:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
