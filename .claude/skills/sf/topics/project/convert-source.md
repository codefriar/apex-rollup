# project:convert:source

**Convert source-formatted files into metadata that you can deploy using Metadata API.**

## Description

To convert source-formatted files into the metadata format, so that you can deploy them using Metadata API, run this command. Then deploy the metadata using "sf project deploy".

To convert Metadata API–formatted files into the source format, run "sf project convert mdapi".

To specify a package name that includes spaces, enclose the name in single quotes.

To convert multiple components, either set multiple --metadata <name> flags or a single --metadata flag with multiple names separated by spaces. Enclose names that contain spaces in one set of double quotes. The same syntax applies to --source-dir.

## Usage

```bash
sf project:convert:source [flags]
```

## Flags

### Command Flags

### `--api-version`

API Version to use in the generated project's manifest. By default, will use the version from sfdx-project.json

- **Type**: option

### `--loglevel`

- **Type**: option

### `-x, --manifest`

Path to the manifest (package.xml) file that specifies the metadata types to convert.

- **Type**: option

### `-m, --metadata`

Metadata component names to convert.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-d, --output-dir`

Output directory to store the Metadata API–formatted files in.

- **Type**: option
- **Default**: `metadataPackage_>timestamp<`

### `-n, --package-name`

Name of the package to associate with the metadata-formatted files.

- **Type**: option

### `-r, --root-dir`

Source directory other than the default package to convert.

- **Type**: option

### `-p, --source-dir`

Paths to the local source files to convert.

- **Type**: option
- **Multiple**: Can be specified multiple times

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Convert source-formatted files in the specified directory into metadata-formatted files; writes converted files into a new directory:
$ sf project:convert:source --root-dir path/to/source

Similar to previous example, but writes converted files to the specified output directory and associates the files with the specified package:
$ sf project:convert:source --root-dir path/to/source --output-dir path/to/outputdir --package-name 'My Package'

## Aliases

- `force:source:convert`

## Alternative Syntaxes

- `sf convert:project:source`
- `sf convert:source:project`
- `sf project:source:convert`
- `sf source:project:convert`
- `sf source:convert:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
