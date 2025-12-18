# org:list:metadata

**List the metadata components and properties of a specified type.**

## Description

Use this command to identify individual components in your manifest file or if you want a high-level view of particular metadata types in your org. For example, you can use this command to return a list of names of all the CustomObject or Layout components in your org, then use this information in a retrieve command that returns a subset of these components.

The username that you use to connect to the org must have the Modify All Data or Modify Metadata Through Metadata API Functions permission.

## Usage

```bash
sf org:list:metadata [flags]
```

## Flags

### Command Flags

### `--api-version`

API version to use; default is the most recent API version.

- **Type**: option

### `--folder`

Folder associated with the component; required for components that use folders; folder names are case-sensitive.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-m, --metadata-type`

Metadata type to be retrieved, such as CustomObject; metadata type names are case-sensitive.

- **Type**: option
- **Required**: Yes

### `-f, --output-file`

Pathname of the file in which to write the results.

- **Type**: option

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

List the CustomObject components, and their properties, in the org with alias "my-dev-org":
$ sf org:list:metadata --metadata-type CustomObject --target-org my-dev-org

List the CustomObject components in your default org, write the output to the specified file, and use API version 57.0:
$ sf org:list:metadata --metadata-type CustomObject --api-version 57.0 --output-file /path/to/outputfilename.txt

List the Dashboard components in your default org that are contained in the "folderSales" folder, write the output to the specified file, and use API version 57.0:
$ sf org:list:metadata --metadata-type Dashboard --folder folderSales --api-version 57.0 --output-file /path/to/outputfilename.txt

## Aliases

- `force:mdapi:listmetadata`

## Alternative Syntaxes

- `sf list:org:metadata`
- `sf list:metadata:org`
- `sf org:metadata:list`
- `sf metadata:org:list`
- `sf metadata:list:org`

## Plugin

**@salesforce/plugin-org** (core)
