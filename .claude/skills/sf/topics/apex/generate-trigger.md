# apex:generate:trigger

**Generate an Apex trigger.**

## Description

Generates the Apex trigger \*.trigger file and associated metadata file. These files must be contained in a parent directory called "triggers" in your package directory. Either run this command from an existing directory of this name, or use the --output-dir flag to generate one or point to an existing one.

If you don't specify the --sobject flag, the .trigger file contains the generic placeholder SOBJECT; replace it with the Salesforce object you want to generate a trigger for. If you don't specify --event, "before insert" is used.

## Usage

```bash
sf apex:generate:trigger [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-e, --event`

Events that fire the trigger.

- **Type**: option
- **Multiple**: Can be specified multiple times
- **Default**: `['before insert']`

### `--loglevel`

- **Type**: option

### `-n, --name`

Name of the generated Apex trigger

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-s, --sobject`

Salesforce object to generate a trigger on.

- **Type**: option
- **Default**: `SOBJECT`

### `-t, --template`

Template to use for file creation.

- **Type**: option
- **Default**: `ApexTrigger`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate two files associated with the MyTrigger Apex trigger (MyTrigger.trigger and MyTrigger.trigger-meta.xml) in the current directory:
sf apex:generate:trigger --name MyTrigger

Similar to the previous example, but generate the files in the "force-app/main/default/triggers" directory:
sf apex:generate:trigger --name MyTrigger --output-dir force-app/main/default/triggers

Generate files for a trigger that fires on the Account object before and after an insert:
sf apex:generate:trigger --name MyTrigger --sobject Account --event "before insert,after insert"

## Aliases

- `force:apex:trigger:create`

## Alternative Syntaxes

- `sf generate:apex:trigger`
- `sf generate:trigger:apex`
- `sf apex:trigger:generate`
- `sf trigger:apex:generate`
- `sf trigger:generate:apex`

## Plugin

**@salesforce/plugin-templates** (core)
