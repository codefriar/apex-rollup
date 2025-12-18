# cmdt:generate:record

**Generate a new record for a given custom metadata type in the current project.**

## Description

The custom metadata type must already exist in your project. You must specify a name for the new record. Use name=value pairs to specify the values for the fields, such as MyTextField="some text here" or MyNumberField=32.

## Usage

```bash
sf cmdt:generate:record [flags]
```

## Flags

### Command Flags

### `-i, --input-directory`

Directory from which to get the custom metadata type definition from.

- **Type**: option
- **Default**: `force-app/main/default/objects`

### `-l, --label`

Label for the new record.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-d, --output-directory`

Directory to store newly-created custom metadata record files.

- **Type**: option
- **Default**: `force-app/main/default/customMetadata`

### `-p, --protected`

Protect the record when it's in a managed package.

- **Type**: option
- **Default**: `false`

### `-n, --record-name`

Name of the new record.

- **Type**: option
- **Required**: Yes

### `-t, --type-name`

API name of the custom metadata type to create a record for; must end in "\_\_mdt".

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

Create a record metadata file for custom metadata type 'MyCMT' with specified values for two custom fields:
sf cmdt:generate:record --type-name MyCMT\_\_mdt --record-name MyRecord My_Custom_Field_1=Foo My_Custom_Field_2=Bar

Create a protected record metadata file for custom metadata type 'MyCMT' with a specific label and values specified for two custom fields:
sf cmdt:generate:record --type-name MyCMT\_\_mdt --record-name MyRecord --label "My Record" --protected true My_Custom_Field_1=Foo My_Custom_Field_2=Bar

## Aliases

- `force:cmdt:record:create`
- `cmdt:record:create`

## Alternative Syntaxes

- `sf generate:cmdt:record`
- `sf generate:record:cmdt`
- `sf cmdt:record:generate`
- `sf record:cmdt:generate`
- `sf record:generate:cmdt`

## Plugin

**@salesforce/plugin-custom-metadata** (jit)
