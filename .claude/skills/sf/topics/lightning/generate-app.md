# lightning:generate:app

**Generate a Lightning App.**

## Description

Generates a Lightning App bundle in the specified directory or the current working directory. The bundle consists of multiple files in a folder with the designated name.

## Usage

```bash
sf lightning:generate:app [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-i, --internal`

Generate lightning bundles without creating a -meta.xml file.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-n, --name`

Name of the generated Lightning App.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-t, --template`

Template to use for file creation.

- **Type**: option
- **Default**: `DefaultLightningApp`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate the metadata files for a Lightning app bundle called "myapp" in the current directory:
sf lightning:generate:app --name myapp

Similar to the previous example, but generate the files in the "force-app/main/default/aura" directory:
sf lightning:generate:app --name myapp --output-dir force-app/main/default/aura

## Aliases

- `force:lightning:app:create`

## Alternative Syntaxes

- `sf generate:lightning:app`
- `sf generate:app:lightning`
- `sf lightning:app:generate`
- `sf app:lightning:generate`
- `sf app:generate:lightning`

## Plugin

**@salesforce/plugin-templates** (core)
