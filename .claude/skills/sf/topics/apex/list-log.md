# apex:list:log

**Display a list of IDs and general information about debug logs.**

## Description

Run this command in a project to list the IDs and general information for all debug logs in your default org.

To fetch a specific log from your org, obtain the ID from this command's output, then run the “sf apex log get” command.

## Usage

```bash
sf apex:list:log [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

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

List the IDs and information about the debug logs in your default org:
sf apex:list:log

Similar to previous example, but use the org with the specified username:
sf apex:list:log --target-org me@my.org

## Aliases

- `force:apex:log:list`

## Alternative Syntaxes

- `sf list:apex:log`
- `sf list:log:apex`
- `sf apex:log:list`
- `sf log:apex:list`
- `sf log:list:apex`

## Plugin

**@salesforce/plugin-apex** (core)
