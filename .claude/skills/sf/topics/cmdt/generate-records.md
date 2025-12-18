# cmdt:generate:records

**Generate new custom metadata type records from a CSV file.**

## Description

The custom metadata type must already exist in your project. By default, the Name column is used to determine the record name; use the --name-column flag to specify a different column.

## Usage

```bash
sf cmdt:generate:records [flags]
```

## Flags

### Command Flags

### `-f, --csv`

Pathname of the CSV file.

- **Type**: option
- **Required**: Yes

### `-i, --input-directory`

Directory from which to get the custom metadata type definition from.

- **Type**: option
- **Default**: `force-app/main/default/objects`

### `--loglevel`

- **Type**: option

### `-n, --name-column`

Column used to determine the name of the record.

- **Type**: option
- **Default**: `Name`

### `-d, --output-directory`

Directory to store newly-created custom metadata record files.

- **Type**: option
- **Default**: `force-app/main/default/customMetadata`

### `-t, --type-name`

API name of the custom metadata type to create a record for.

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

Generate record metadata files from values in a CSV file for the custom metadata type MyCmdt. Use 'Name' as the column that specifies the record name:
sf cmdt:generate:records --csv path/to/my.csv --type-name MyCmdt

Generate record metadata files from a CSV file in the directory different from the default, and use 'PrimaryKey' as the column that specifies the record name:
sf cmdt:generate:records --csv path/to/my.csv --type-name MyCmdt --input-directory path/to/my/cmdt/directory --name-column "PrimaryKey"

## Aliases

- `force:cmdt:record:insert`
- `cmdt:record:insert`

## Alternative Syntaxes

- `sf generate:cmdt:records`
- `sf generate:records:cmdt`
- `sf cmdt:records:generate`
- `sf records:cmdt:generate`
- `sf records:generate:cmdt`

## Plugin

**@salesforce/plugin-custom-metadata** (jit)
