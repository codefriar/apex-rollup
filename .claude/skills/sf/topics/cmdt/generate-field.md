# cmdt:generate:field

**Generate a field for a custom metadata type based on the provided field type.**

## Description

Similar to a custom object, a custom metadata type has a list of custom fields that represent aspects of the metadata.

This command creates a metadata file that describes the new custom metadata type field. By default, the file is created in a "fields" directory in the current directory. Use the --output-directory to generate the file in the directory that contains the custom metadata type metdata files, such as "force-app/main/default/objects/MyCmdt\_\_mdt" for the custom metadata type called MyCmdt.

## Usage

```bash
sf cmdt:generate:field [flags]
```

## Flags

### Command Flags

### `-s, --decimal-places`

Number of decimal places to use for number or percent fields.

- **Type**: option

### `-l, --label`

Label for the field.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --name`

Unique name for the field.

- **Type**: option
- **Required**: Yes

### `-d, --output-directory`

Directory to store newly-created field definition files.

- **Type**: option

### `-p, --picklist-values`

Picklist values; required for picklist fields.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-f, --type`

Type of the field.

- **Type**: option
- **Required**: Yes

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate a metadata file for a custom checkbox field and add the file to the MyCmdt**mdt/fields directory:
sf cmdt:generate:field --name MyCheckboxField --type Checkbox --output-directory force-app/main/default/objects/MyCmdt**mdt

Generate a metadata file for a custom picklist field and add a few values:
sf cmdt:generate:field --name MyPicklistField --type Picklist --picklist-values A --picklist-values B --picklist-values C --output-directory force-app/main/default/objects/MyCmdt\_\_mdt

Generate a metadata file for a custom number field and specify 2 decimal places:
sf cmdt:generate:field --name MyNumberField --type Number --decimal-places 2 --output-directory force-app/main/default/objects/MyCmdt\_\_mdt

## Aliases

- `force:cmdt:field:create`
- `cmdt:field:create`

## Alternative Syntaxes

- `sf generate:cmdt:field`
- `sf generate:field:cmdt`
- `sf cmdt:field:generate`
- `sf field:cmdt:generate`
- `sf field:generate:cmdt`

## Plugin

**@salesforce/plugin-custom-metadata** (jit)
