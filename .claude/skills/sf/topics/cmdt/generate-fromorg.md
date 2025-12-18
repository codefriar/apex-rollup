# cmdt:generate:fromorg

**Generate a custom metadata type and all its records from a Salesforce object.**

## Description

Use this command to migrate existing custom objects or custom settings in an org to custom metadata types. If a field of the Salesforce object is of an unsupported type, the field type is automatically converted to text. Run "sf cmdt generate field --help" to see the list of supported cmdt field types, listed in the --type flag summary. Use the --ignore-unsupported to ignore these fields.

This command creates the metadata files that describe the new custom metadata type and its fields in the "force-app/main/default/objects/TypeName\_\_mdt" directory by default, where "TypeName" is the value of the required --dev-name flag. Use --type-output-directory to create them in a different directory.

## Usage

```bash
sf cmdt:generate:fromorg [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-n, --dev-name`

Name of the custom metadata type.

- **Type**: option
- **Required**: Yes

### `-i, --ignore-unsupported`

Ignore unsupported field types.

- **Type**: boolean

### `-l, --label`

Label for the custom metadata type.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --plural-label`

Plural version of the label value; if blank, uses label.

- **Type**: option

### `-r, --records-output-dir`

Directory to store newly-created custom metadata record files.

- **Type**: option
- **Default**: `force-app/main/default/customMetadata`

### `-s, --sobject`

API name of the source Salesforce object used to generate the custom metadata type.

- **Type**: option
- **Required**: Yes

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-d, --type-output-directory`

Directory to store newly-created custom metadata type files.

- **Type**: option
- **Default**: `force-app/main/default/objects`

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

Generate a custom metadata type from a custom object called MySourceObject**c in your default org:
sf cmdt:generate:fromorg --dev-name MyCMDT --sobject MySourceObject**c

Generate a custom metadata type from a custom object in an org with alias my-scratch-org; ignore unsupported field types instead of converting them to text:
sf cmdt:generate:fromorg --dev-name MyCMDT --sobject MySourceObject\_\_c --ignore-unsupported --target-org my-scratch-org

Generate a protected custom metadata type from a custom object:
sf cmdt:generate:fromorg --dev-name MyCMDT --sobject MySourceObject\_\_c --visibility Protected

Generate a protected custom metadata type from a custom setting with a specific singular and plural label:
sf cmdt:generate:fromorg --dev-name MyCMDT --label "My CMDT" --plural-label "My CMDTs" --sobject MySourceSetting\_\_c --visibility Protected

Generate a custom metadata type and put the resulting metadata files in the specified directory:
sf cmdt:generate:fromorg --dev-name MyCMDT --sobject MySourceObject\_\_c --type-output-directory path/to/my/cmdt/directory

Generate a custom metadata type and put the resulting record metadata file(s) in the specified directory:
sf cmdt:generate:fromorg --dev-name MyCMDT --sobject MySourceObject\_\_c --records-output-dir path/to/my/cmdt/record/directory

## Aliases

- `force:cmdt:generate`

## Alternative Syntaxes

- `sf generate:cmdt:fromorg`
- `sf generate:fromorg:cmdt`
- `sf cmdt:fromorg:generate`
- `sf fromorg:cmdt:generate`
- `sf fromorg:generate:cmdt`

## Plugin

**@salesforce/plugin-custom-metadata** (jit)
