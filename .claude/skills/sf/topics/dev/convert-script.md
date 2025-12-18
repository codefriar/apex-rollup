# dev:convert:script

**Convert a script file that contains deprecated sfdx-style commands to use the new sf-style commands instead.**

## Description

Important: Use this command only to get started on the sfdx->sf script migration. We don't guarantee that the new sf-style command replacements work correctly or as you expect. You must test, and probably update, the new script before putting it into production. We also don't guarantee that the JSON results are the same as before.

This command can convert a large part of your script, but possibly not all. There are some sfdx-style commands that don't have an obvious sf-style equivalent. In this case, this command doesn't replace the sfdx-style command but instead adds a comment to remind you that you must convert it manually. See the Salesforce CLI Command Reference for migration information about each deprecated sfdx-style command: https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm.

This command is interactive; as it scans your script, it prompts you when it finds an sfdx-style command or flag and asks if you want to convert it to the displayed suggestion. The command doesn't update the script file directly; rather, it creates a new file whose name is the original name but with "-converted" appended to it. The script replaces all instances of "sfdx" with "sf". For each prompt you answer "y" to, the command replaces the sfdx-style names with their equivalent sf-style ones. For example, "sfdx force:apex:execute --targetusername myscratch" is replaced with "sf apex run --target-org myscratch".

## Usage

```bash
sf dev:convert:script [flags]
```

## Flags

### Command Flags

### `--no-prompt`

Don't prompt for suggested replacements.

- **Type**: boolean

### `-s, --script`

Filepath to the script you want to convert.

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

Convert the YAML file called "myScript.yml" located in the current directory; the new file that contains the replacements is called "myScript-converted.yml":
sf dev:convert:script --script ./myScript.yml

## Alternative Syntaxes

- `sf convert:dev:script`
- `sf convert:script:dev`
- `sf dev:script:convert`
- `sf script:dev:convert`
- `sf script:convert:dev`

## Plugin

**@salesforce/plugin-dev** (user)
