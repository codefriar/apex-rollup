# package:version:retrieve

**Retrieve package metadata for a specified package version. Package metadata can be retrieved for second-generation managed package versions or unlocked packages only.**

## Description

Retrieving a package version downloads the metadata into the directory you specify.

When you run this command, specify the subscriber package version ID (starts with 04t) and the path to an empty directory.

By default, the package version retrieve command is available to 2GP managed packages that were converted from 1GP. To use this command with a managed package created using 2GP (not converted from 1GP) or with an unlocked package, specify IsDevUsePkgZipRequested = true in the Package2VersionCreateRequest Tooling API object. If you run this command and the zip folder with the package version’s source files is missing, confirm that IsDevUsePkgZipRequested is set to true.

## Usage

```bash
sf package:version:retrieve [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-d, --output-dir`

Path within your Salesforce DX project directory in which to download the metadata. This directory must be empty.

- **Type**: option
- **Default**: `force-app`

### `-p, --package`

Subscriber package version ID (starts with 04t).

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

Retrieve package metadata for a converted subscriber package version ID (starts with 04t) into my-directory/ within your Salesforce DX project directory:

sf package:version:retrieve --package 04tXXX --output-dir my-directory/ --target-dev-hub devhub@example.com

## Alternative Syntaxes

- `sf version:package:retrieve`
- `sf version:retrieve:package`
- `sf package:retrieve:version`
- `sf retrieve:package:version`
- `sf retrieve:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
