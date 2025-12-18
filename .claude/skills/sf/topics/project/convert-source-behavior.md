# project:convert:source-behavior

**Enable a behavior of your project source files, and then update your Salesforce DX project to implement the behavior.**

## Description

Specifically, this command updates the "sourceBehaviorOption" option in the "sfdx-project.json" file and then converts the associated local source files in your project as needed.

For example, run this command with the "--behavior decomposePermissionSetBeta" flag to start decomposing permission sets when you deploy or retrieve them. Decomposing means breaking up the monolithic metadata API format XML file that corresponds to a metadata component into smaller XML files and directories based on its subtypes. Permission sets are not decomposed by default; you must opt-in to start decomposing them by using this command. When the command finishes, your "sfdx-project.json" file is updated to always decompose permission sets, and the existing permission set files in your local package directories are converted into the new decomposed format. You run this command only once for a given behavior change.

For more information about the possible values for the --behavior flag, see the "sourceBehaviorOptions" section in the https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm topic.

## Usage

```bash
sf project:convert:source-behavior [flags]
```

## Flags

### Command Flags

### `-b, --behavior`

Behavior to enable; the values correspond to the possible values of the "sourceBehaviorOption" option in the "sfdx-project.json" file.

- **Type**: option
- **Required**: Yes

### `--dry-run`

Display what the command would do, but don't make any actual changes.

- **Type**: boolean

### `--preserve-temp-dir`

Don't delete the metadata API format temporary directory that this command creates. Useful for debugging.

- **Type**: boolean

### `-o, --target-org`

Username or alias of the target org.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Update your Salesforce DX project to decompose custom permission sets:
sf project:convert:source-behavior --behavior decomposePermissionSetBeta

Display what the command would do, but don't change any existing files:
sf project:convert:source-behavior --behavior decomposePermissionSetBeta --dry-run

Keep the temporary directory that contains the interim metadata API formatted files:
sf project:convert:source-behavior --behavior decomposePermissionSetBeta --dry-run --preserve-temp-dir

## Alternative Syntaxes

- `sf convert:project:source-behavior`
- `sf convert:source-behavior:project`
- `sf project:source-behavior:convert`
- `sf source-behavior:project:convert`
- `sf source-behavior:convert:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
