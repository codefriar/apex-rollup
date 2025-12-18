# project:convert:mdapi

**Convert metadata retrieved via Metadata API into the source format used in Salesforce DX projects.**

## Description

To use Salesforce CLI to work with components that you retrieved via Metadata API, first convert your files from the metadata format to the source format using this command.

To convert files from the source format back to the metadata format, run "sf project convert source".

To convert multiple metadata components, either set multiple --metadata <name> flags or a single --metadata flag with multiple names separated by spaces. Enclose names that contain spaces in one set of double quotes. The same syntax applies to --source-dir.

## Usage

```bash
sf project:convert:mdapi [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-x, --manifest`

File path to manifest (package.xml) of metadata types to convert.

- **Type**: option

### `-m, --metadata`

Metadata component names to convert.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-p, --metadata-dir`

Root of directory or zip file of metadata formatted files to convert.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-d, --output-dir`

Directory to store your files in after they’re converted to source format; can be an absolute or relative path.

- **Type**: option

### `-r, --root-dir`

Root directory that contains the Metadata API–formatted metadata.

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

Convert metadata formatted files in the specified directory into source formatted files; writes converted files to your default package directory:
$ sf project:convert:mdapi --root-dir path/to/metadata

Similar to previous example, but writes converted files to the specified output directory:
$ sf project:convert:mdapi --root-dir path/to/metadata --output-dir path/to/outputdir

## Aliases

- `force:mdapi:convert`

## Alternative Syntaxes

- `sf convert:project:mdapi`
- `sf convert:mdapi:project`
- `sf project:mdapi:convert`
- `sf mdapi:project:convert`
- `sf mdapi:convert:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
