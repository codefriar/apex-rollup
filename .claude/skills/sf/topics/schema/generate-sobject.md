# schema:generate:sobject

**Generate metadata source files for a new custom object.**

## Description

This command is interactive and must be run in a Salesforce DX project directory. You're required to specify the object's label with the "--label" flag. The command uses this label to provide intelligent suggestions for other object properties, such as its API name and plural label.

All Salesforce objects are required to have a Name field, so this command also prompts you for the label and type of the Name field. Run the "sf metadata generate field" command to create additional fields for the object.

To reduce the number of prompts, use the "--use-default-features" flag to automatically enable some features, such as reporting and search on the object.

## Usage

```bash
sf schema:generate:sobject [flags]
```

## Flags

### Command Flags

### `-l, --label`

The custom object's label.

- **Type**: option
- **Required**: Yes

### `-f, --use-default-features`

Enable all optional features without prompting.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

Create a custom object with the specified label and be prompted for additional information:
sf schema:generate:sobject --label "My Object"

Create a custom object and enable optional features without prompting:
sf schema:generate:sobject --label "My Object" --use-default-features

## Aliases

- `generate:metadata:sobject`

## Alternative Syntaxes

- `sf generate:schema:sobject`
- `sf generate:sobject:schema`
- `sf schema:sobject:generate`
- `sf sobject:schema:generate`
- `sf sobject:generate:schema`

## Plugin

**@salesforce/plugin-sobject** (core)
