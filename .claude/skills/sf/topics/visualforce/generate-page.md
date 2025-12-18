# visualforce:generate:page

**Generate a Visualforce Page.**

## Description

The command generates the .Page file and associated metadata file in the specified directory or the current working directory by default.

## Usage

```bash
sf visualforce:generate:page [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-l, --label`

Visualforce Page label.

- **Type**: option
- **Required**: Yes

### `--loglevel`

- **Type**: option

### `-n, --name`

Name of the generated Visualforce Page.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-t, --template`

Template to use for file creation.

- **Type**: option
- **Default**: `DefaultVFPage`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate the metadata files for a Visualforce page in the current directory:
sf visualforce:generate:page --name mypage --label mylabel

Similar to previous example, but generate the files in the directory "force-app/main/default/pages":
sf visualforce:generate:page --name mypage --label mylabel --output-dir pages

## Aliases

- `force:visualforce:page:create`

## Alternative Syntaxes

- `sf generate:visualforce:page`
- `sf generate:page:visualforce`
- `sf visualforce:page:generate`
- `sf page:visualforce:generate`
- `sf page:generate:visualforce`

## Plugin

**@salesforce/plugin-templates** (core)
