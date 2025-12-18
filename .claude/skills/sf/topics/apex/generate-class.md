# apex:generate:class

**Generate an Apex class.**

## Description

Generates the Apex \*.cls file and associated metadata file. These files must be contained in a parent directory called "classes" in your package directory. Either run this command from an existing directory of this name, or use the --output-dir flag to generate one or point to an existing one.

## Usage

```bash
sf apex:generate:class [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --name`

Name of the generated Apex class.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-t, --template`

Template to use for file creation.

- **Type**: option
- **Default**: `DefaultApexClass`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate two metadata files associated with the MyClass Apex class (MyClass.cls and MyClass.cls-meta.xml) in the current directory:
sf apex:generate:class --name MyClass

Similar to previous example, but generates the files in the "force-app/main/default/classes" directory:
sf apex:generate:class --name MyClass --output-dir force-app/main/default/classes

## Aliases

- `force:apex:class:create`

## Alternative Syntaxes

- `sf generate:apex:class`
- `sf generate:class:apex`
- `sf apex:class:generate`
- `sf class:apex:generate`
- `sf class:generate:apex`

## Plugin

**@salesforce/plugin-templates** (core)
