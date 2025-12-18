# org:get:snapshot

**Get details about a scratch org snapshot.**

## Description

Snapshot creation can take a while. Use this command with the snapshot name or ID to check its creation status. After the status changes to Active, you can use the snapshot to create scratch orgs.

To create a snapshot, use the "sf org create snapshot" command. To retrieve a list of all snapshots, use "sf org list snapshot".

## Usage

```bash
sf org:get:snapshot [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-s, --snapshot`

Name or ID of snapshot to retrieve.

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

Get snapshot details using its ID and the default Dev Hub org:
sf org:get:snapshot --snapshot 0Oo...

Get snapshot details using its name from a Dev Hub org with alias SnapshotDevHub:
sf org:get:snapshot --snapshot Dependencies --target-dev-hub SnapshotDevHub

## Aliases

- `force:org:snapshot:get`

## Alternative Syntaxes

- `sf get:org:snapshot`
- `sf get:snapshot:org`
- `sf org:snapshot:get`
- `sf snapshot:org:get`
- `sf snapshot:get:org`

## Plugin

**@salesforce/plugin-signups** (user)
