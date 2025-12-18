# schema:generate:field

**Generate metadata source files for a new custom field on a specified object.**

## Description

This command is interactive and must be run in a Salesforce DX project directory. You're required to specify the field's label with the "--label" flag. The command uses this label to provide intelligent suggestions for other field properties, such as its API name.

You can generate a custom field on either a standard object, such as Account, or a custom object. In both cases, the source files for the object must already exist in your local project before you run this command. If you create a relationship field, the source files for the parent object must also exist in your local directory. Use the command "sf metadata retrieve -m CustomObject:<object>" to retrieve source files for both standard and custom objects from your org. To create a custom object, run the "sf generate metadata sobject" command or use the Object Manager UI in your Salesforce org.

## Usage

```bash
sf schema:generate:field [flags]
```

## Flags

### Command Flags

### `-l, --label`

The field's label.

- **Type**: option
- **Required**: Yes

### `-o, --object`

The directory that contains the object's source files.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

Create a field with the specified label; the command prompts you for the object:
sf schema:generate:field --label "My Field"

Specify the local path to the object's folder:
sf schema:generate:field --label "My Field" --object force-app/main/default/objects/MyObject\_\_c

## Aliases

- `generate:metadata:field`

## Alternative Syntaxes

- `sf generate:schema:field`
- `sf generate:field:schema`
- `sf schema:field:generate`
- `sf field:schema:generate`
- `sf field:generate:schema`

## Plugin

**@salesforce/plugin-sobject** (core)
