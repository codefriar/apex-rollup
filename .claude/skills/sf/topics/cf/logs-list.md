# cf:logs:list

**List Apex debug logs from a Salesforce org.**

## Description

Lists Apex debug logs from a Salesforce org. You can list all logs, logs for a specific user, or a specific log by ID. Results include log metadata such as duration, size, and operation.

## Usage

```bash
sf cf:logs:list [flags]
```

## Flags

### Command Flags

### `-a, --all`

List all available logs.

- **Type**: boolean

### `-c, --current-user`

List logs for the currently authenticated user.

- **Type**: boolean

### `-l, --limit`

Maximum number of logs to list.

- **Type**: option

### `-i, --log-id`

ID of a specific log to list.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes
- **Default**: `test-3gw4ptpcb9b4@example.com`

### `-u, --user-id`

List logs for a specific user ID.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

List all logs for the current user:
sf cf:logs:list --current-user

List a specific log by ID:
sf cf:logs:list --log-id 07L5e000006Q0KREA0

List all logs for a specific user:
sf cf:logs:list --user-id 0055e000000Q0ZZAA0

List all logs in the org:
sf cf:logs:list --all

List the 10 most recent logs for the current user:
sf cf:logs:list --current-user --limit 10

## Alternative Syntaxes

- `sf logs:cf:list`
- `sf logs:list:cf`
- `sf cf:list:logs`
- `sf list:cf:logs`
- `sf list:logs:cf`

## Plugin

**codefriar-utils** (link)
