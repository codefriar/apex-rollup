# lightning:generate:test

**Generate a Lightning test.**

## Description

Generates the test in the specified directory or the current working directory. The .resource file and associated metadata file are generated.

## Usage

```bash
sf lightning:generate:test [flags]
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

Name of the generated Lightning Test.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-t, --template`

Template to use for file creation.

- **Type**: option
- **Default**: `DefaultLightningTest`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate the metadata files for the Lightning test called MyLightningTest in the current directory:
sf lightning:generate:test --name MyLightningTest

Similar to the previous example but generate the files in the "force-app/main/default/lightningTests" directory:
sf lightning:generate:test --name MyLightningTest --output-dir force-app/main/default/lightningTests

## Aliases

- `force:lightning:test:create`

## Alternative Syntaxes

- `sf generate:lightning:test`
- `sf generate:test:lightning`
- `sf lightning:test:generate`
- `sf test:lightning:generate`
- `sf test:generate:lightning`

## Plugin

**@salesforce/plugin-templates** (core)
