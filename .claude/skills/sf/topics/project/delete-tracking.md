# project:delete:tracking

**Delete all local source tracking information.**

## Description

WARNING: This command deletes or overwrites all existing source tracking files. Use with extreme caution.

Deletes all local source tracking information. When you next run 'project deploy preview', Salesforce CLI displays all local and remote files as changed, and any files with the same name are listed as conflicts.

## Usage

```bash
sf project:delete:tracking [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --no-prompt`

Don't prompt for source tracking override confirmation.

- **Type**: boolean

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

Delete local source tracking for the org with alias "my-scratch":
$ sf project:delete:tracking --target-org my-scratch

## Aliases

- `force:source:tracking:clear`

## Alternative Syntaxes

- `sf delete:project:tracking`
- `sf delete:tracking:project`
- `sf project:tracking:delete`
- `sf tracking:project:delete`
- `sf tracking:delete:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
