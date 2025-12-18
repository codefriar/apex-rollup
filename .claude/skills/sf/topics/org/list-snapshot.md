# org:list:snapshot

**List scratch org snapshots.**

## Description

You can view all the snapshots in a Dev Hub that you have access to. If you’re an admin, you can see all snapshots associated with the Dev Hub org. If you’re a user, you can see only your snapshots unless a Dev Hub admin gives you View All permissions.

To create a snapshot, use the "sf org create snapshot" command. To get details about a snapshot request, use "sf org get snapshot".

## Usage

```bash
sf org:list:snapshot [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

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

List snapshots in the default Dev Hub:
sf org:list:snapshot

List snapshots in the Dev Hub with alias SnapshotDevHub:
sf org:list:snapshot --target-dev-hub SnapshotDevHub

## Aliases

- `force:org:snapshot:list`

## Alternative Syntaxes

- `sf list:org:snapshot`
- `sf list:snapshot:org`
- `sf org:snapshot:list`
- `sf snapshot:org:list`
- `sf snapshot:list:org`

## Plugin

**@salesforce/plugin-signups** (user)
