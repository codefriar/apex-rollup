# visualforce:generate:component

**Generate a Visualforce Component.**

## Description

The command generates the .Component file and associated metadata file in the specified directory or the current working directory by default.

## Usage

```bash
sf visualforce:generate:component [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-l, --label`

Visualforce Component label.

- **Type**: option
- **Required**: Yes

### `--loglevel`

- **Type**: option

### `-n, --name`

Name of the generated Visualforce Component.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-t, --template`

Template to use for file creation.

- **Type**: option
- **Default**: `DefaultVFComponent`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate the metadata files for a Visualforce component in the current directory:
sf visualforce:generate:component --name mycomponent --label mylabel

Similar to previous example, but generate the files in the directory "force-app/main/default/components":
sf visualforce:generate:component --name mycomponent --label mylabel --output-dir components

## Aliases

- `force:visualforce:component:create`

## Alternative Syntaxes

- `sf generate:visualforce:component`
- `sf generate:component:visualforce`
- `sf visualforce:component:generate`
- `sf component:visualforce:generate`
- `sf component:generate:visualforce`

## Plugin

**@salesforce/plugin-templates** (core)
