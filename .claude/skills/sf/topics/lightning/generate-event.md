# lightning:generate:event

**Generate a Lightning Event.**

## Description

Generates a Lightning Event bundle in the specified directory or the current working directory. The bundle consists of multiple files in a folder with the designated name.

## Usage

```bash
sf lightning:generate:event [flags]
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

Name of the generated Lightning Event.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-t, --template`

Template to use for file creation.

- **Type**: option
- **Default**: `DefaultLightningEvt`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate the metadata files for a Lightning event bundle called "myevent" in the current directory:
sf lightning:generate:event --name myevent

Similar to previous example, but generate the files in the "force-app/main/default/aura" directory:
sf lightning:generate:event --name myevent --output-dir force-app/main/default/aura

## Aliases

- `force:lightning:event:create`

## Alternative Syntaxes

- `sf generate:lightning:event`
- `sf generate:event:lightning`
- `sf lightning:event:generate`
- `sf event:lightning:generate`
- `sf event:generate:lightning`

## Plugin

**@salesforce/plugin-templates** (core)
