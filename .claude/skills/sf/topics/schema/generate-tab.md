# schema:generate:tab

**Generate the metadata source files for a new custom tab on a custom object.**

## Description

Custom tabs let you display custom object data or other web content in Salesforce. Custom tabs appear in Salesforce as an item in the app’s navigation bar and in the App Launcher.

This command must be run in a Salesforce DX project directory. You must pass all required information to it with the required flags. The source files for the custom object for which you're generating a tab don't need to exist in your local project.

## Usage

```bash
sf schema:generate:tab [flags]
```

## Flags

### Command Flags

### `-d, --directory`

Path to a "tabs" directory that will contain the source files for your new tab.

- **Type**: option
- **Required**: Yes

### `-i, --icon`

Number from 1 to 100 that specifies the color scheme and icon for the custom tab.

- **Type**: option
- **Required**: Yes
- **Default**: `1`

### `-o, --object`

API name of the custom object you're generating a tab for.

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

Create a tab on the `MyObject__c` custom object:
sf schema:generate:tab --object `MyObject__c` --icon 54 --directory force-app/main/default/tabs

## Aliases

- `generate:metadata:tab`

## Alternative Syntaxes

- `sf generate:schema:tab`
- `sf generate:tab:schema`
- `sf schema:tab:generate`
- `sf tab:schema:generate`
- `sf tab:generate:schema`

## Plugin

**@salesforce/plugin-sobject** (core)
