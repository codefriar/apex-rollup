# lightning:generate:component

**Generate a bundle for an Aura component or a Lightning web component.**

## Description

Generates the bundle in the specified directory or the current working directory. The bundle consists of multiple files in a directory with the designated name. Lightning web components are contained in the directory with name "lwc", Aura components in "aura".

To generate a Lightning web component, pass "--type lwc" to the command. If you don’t specify --type, Salesforce CLI generates an Aura component by default.

## Usage

```bash
sf lightning:generate:component [flags]
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

Name of the generated Lightning Component.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-t, --template`

Template to use for file creation.

- **Type**: option
- **Default**: `default`

### `--type`

Type of the component bundle.

- **Type**: option
- **Default**: `aura`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate the metadata files for an Aura component bundle in the current directory:
sf lightning:generate:component --name mycomponent

Generate a Lightning web component bundle in the current directory:
sf lightning:generate:component --name mycomponent --type lwc

Generate an Aura component bundle in the "force-app/main/default/aura" directory:
sf lightning:generate:component --name mycomponent --output-dir force-app/main/default/aura

Generate a Lightning web component bundle in the "force-app/main/default/lwc" directory:
sf lightning:generate:component --name mycomponent --type lwc --output-dir force-app/main/default/lwc

## Aliases

- `force:lightning:component:create`

## Alternative Syntaxes

- `sf generate:lightning:component`
- `sf generate:component:lightning`
- `sf lightning:component:generate`
- `sf component:lightning:generate`
- `sf component:generate:lightning`

## Plugin

**@salesforce/plugin-templates** (core)
