# static-resource:generate

**Generate a static resource.**

## Description

Generates the metadata resource file in the specified directory or the current working directory. Static resource files must be contained in a parent directory called "staticresources" in your package directory. Either run this command from an existing directory of this name, or use the --output-dir flag to create one or point to an existing one.

## Usage

```bash
sf static-resource:generate [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --name`

Name of the generated static resource.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `--type`

Content type (mime type) of the generated static resource.

- **Type**: option
- **Default**: `application/zip`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate the metadata file for a static resource called MyResource in the current directory:
sf static-resource:generate --name MyResource

Similar to previous example, but specifies a MIME type of application/json:
sf static-resource:generate --name MyResource --type application/json

Generate the resource file in the "force-app/main/default/staticresources" directory:
sf static-resource:generate --name MyResource --output-dir force-app/main/default/staticresources

## Aliases

- `force:staticresource:create`

## Alternative Syntaxes

- `sf generate:static-resource`

## Plugin

**@salesforce/plugin-templates** (core)
