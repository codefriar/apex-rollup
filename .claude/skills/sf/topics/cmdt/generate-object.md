# cmdt:generate:object

**Generate a new custom metadata type in the current project.**

## Description

This command creates a metadata file that describes the new custom metadata type. By default, the file is created in the MyCustomType\_\_mdt directory in the current directory, where MyCustomType is the value of the required --type-name flag. Use the --output-directory to generate the file in a package directory with other custom metadata types, such as "force-app/main/default/objects".

## Usage

```bash
sf cmdt:generate:object [flags]
```

## Flags

### Command Flags

### `-l, --label`

Label for the custom metadata type.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-d, --output-directory`

Directory to store the newly-created custom metadata type files

- **Type**: option

### `-p, --plural-label`

Plural version of the label value; if blank, uses label.

- **Type**: option

### `-n, --type-name`

Unique object name for the custom metadata type.

- **Type**: option
- **Required**: Yes

### `-v, --visibility`

Who can see the custom metadata type.

- **Type**: option
- **Default**: `Public`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate a custom metadata type with developer name 'MyCustomType'; this name is also used as the label:
sf cmdt:generate:object --type-name MyCustomType

Generate a protected custom metadata type with a specific label:
sf cmdt:generate:object --type-name MyCustomType --label "Custom Type" --plural-label "Custom Types" --visibility Protected

## Aliases

- `force:cmdt:create`
- `cmdt:create`

## Alternative Syntaxes

- `sf generate:cmdt:object`
- `sf generate:object:cmdt`
- `sf cmdt:object:generate`
- `sf object:cmdt:generate`
- `sf object:generate:cmdt`

## Plugin

**@salesforce/plugin-custom-metadata** (jit)
