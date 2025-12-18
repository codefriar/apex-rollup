# cf:logs:delete

**Delete Apex debug logs from a Salesforce org.**

## Description

Deletes Apex debug logs from the target org using the Tooling API. Supports filtering by user, date range, or maximum number of logs. By default, requires confirmation before deletion unless the --all flag is used.

## Usage

```bash
sf cf:logs:delete [flags]
```

## Flags

### Command Flags

### `-a, --all`

Delete all matching logs without confirmation.

- **Type**: boolean

### `-d, --days`

Delete logs from the last X days.

- **Type**: option

### `-m, --max-logs`

Maximum number of logs to delete.

- **Type**: option

### `-o, --target-org`

Target org for log deletion.

- **Type**: option
- **Required**: Yes
- **Default**: `test-3gw4ptpcb9b4@example.com`

### `-u, --user`

Delete logs for a specific user.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Delete last 10 logs: sf cf:logs:delete --target-org myorg --max-logs 10

Delete logs from last 7 days: sf cf:logs:delete --target-org myorg --days 7

Delete logs for specific user: sf cf:logs:delete --target-org myorg --user user@example.com

Delete logs with multiple filters: sf cf:logs:delete --target-org myorg --days 3 --max-logs 50

Delete all logs without confirmation: sf cf:logs:delete --target-org myorg --days 30 --all

## Alternative Syntaxes

- `sf logs:cf:delete`
- `sf logs:delete:cf`
- `sf cf:delete:logs`
- `sf delete:cf:logs`
- `sf delete:logs:cf`

## Plugin

**codefriar-utils** (link)
