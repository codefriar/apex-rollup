# analytics:generate:template

**Generate a simple Analytics template.**

## Description

The metadata files associated with the Analytics template must be contained in a parent directory called "waveTemplates" in your package directory. Either run this command from an existing directory of this name, or use the --output-dir flag to generate one or point to an existing one.

## Usage

```bash
sf analytics:generate:template [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --name`

Name of the Analytics template.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate the metadata files for a simple Analytics template file called myTemplate in the force-app/main/default/waveTemplates directory:
sf analytics:generate:template --name myTemplate --output-dir force-app/main/default/waveTemplates

## Aliases

- `force:analytics:template:create`

## Alternative Syntaxes

- `sf generate:analytics:template`
- `sf generate:template:analytics`
- `sf analytics:template:generate`
- `sf template:analytics:generate`
- `sf template:generate:analytics`

## Plugin

**@salesforce/plugin-templates** (core)
