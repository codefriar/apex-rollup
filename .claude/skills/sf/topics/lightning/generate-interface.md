# lightning:generate:interface

**Generate a Lightning Interface.**

## Description

Generates a Lightning Interface bundle in the specified directory or the current working directory. The bundle consists of multiple files in a folder with the designated name.

## Usage

```bash
sf lightning:generate:interface [flags]
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

Name of the generated Lightning Interface.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-t, --template`

Template to use for file creation.

- **Type**: option
- **Default**: `DefaultLightningIntf`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate the metadata files for a Lightning interface bundle called "myinterface" in the current directory:
sf lightning:generate:interface --name myinterface

Similar to the previous example but generate the files in the "force-app/main/default/aura" directory:
sf lightning:generate:interface --name myinterface --output-dir force-app/main/default/aura

## Aliases

- `force:lightning:interface:create`

## Alternative Syntaxes

- `sf generate:lightning:interface`
- `sf generate:interface:lightning`
- `sf lightning:interface:generate`
- `sf interface:lightning:generate`
- `sf interface:generate:lightning`

## Plugin

**@salesforce/plugin-templates** (core)
