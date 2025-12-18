# org:delete:snapshot

**Delete a scratch org snapshot.**

## Description

Dev Hub admins can delete any snapshot. Users can delete only their own snapshots, unless a Dev Hub admin gives the user Modify All permission, which works only with the Salesforce license.

## Usage

```bash
sf org:delete:snapshot [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --no-prompt`

Don't prompt the user to confirm the deletion.

- **Type**: boolean

### `-s, --snapshot`

Name or ID of snapshot to delete.

- **Type**: option
- **Required**: Yes

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

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

Delete a snapshot from the default Dev Hub using the snapshot ID:
sf org:delete:snapshot --snapshot 0Oo...

Delete a snapshot from the specified Dev Hub using the snapshot name:
sf org:delete:snapshot --snapshot BaseSnapshot --target-dev-hub SnapshotDevHub

## Aliases

- `force:org:snapshot:delete`

## Alternative Syntaxes

- `sf delete:org:snapshot`
- `sf delete:snapshot:org`
- `sf org:snapshot:delete`
- `sf snapshot:org:delete`
- `sf snapshot:delete:org`

## Plugin

**@salesforce/plugin-signups** (user)
