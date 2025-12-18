# org:list

**List all orgs you’ve created or authenticated to.**

## Usage

```bash
sf org:list [flags]
```

## Flags

### Command Flags

### `--all`

Include expired, deleted, and unknown-status scratch orgs.

- **Type**: boolean

### `--clean`

Remove all local org authorizations for non-active scratch orgs. Use "org logout" to remove non-scratch orgs.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-p, --no-prompt`

Don't prompt for confirmation.

- **Type**: boolean

### `--skip-connection-status`

Skip retrieving the connection status of non-scratch orgs.

- **Type**: boolean

### `--verbose`

List more information about each org.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

List all orgs you've created or authenticated to:
$ sf org:list

List all orgs, including expired, deleted, and unknown-status orgs; don't include the connection status:
$ sf org:list --skip-connection-status --all

List orgs and remove local org authorization info about non-active scratch orgs:
$ sf org:list --clean

## Aliases

- `force:org:list`

## Alternative Syntaxes

- `sf list:org`

## Plugin

**@salesforce/plugin-org** (core)
