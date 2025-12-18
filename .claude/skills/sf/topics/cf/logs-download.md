# cf:logs:download

**Download Apex debug logs from a Salesforce org.**

## Description

Downloads Apex debug logs from a Salesforce org to a local directory. You can download all logs, logs for a specific user, or a specific log by ID. Optionally delete logs after downloading to free up storage space.

## Usage

```bash
sf cf:logs:download [flags]
```

## Flags

### Command Flags

### `-a, --all`

Download all available logs.

- **Type**: boolean

### `-n, --concurrency`

Maximum number of concurrent downloads.

- **Type**: option
- **Default**: `10`

### `-c, --current-user`

Download logs for the currently authenticated user.

- **Type**: boolean

### `-x, --delete`

Delete logs after downloading.

- **Type**: boolean

### `-l, --limit`

Maximum number of logs to download.

- **Type**: option

### `-i, --log-id`

ID of a specific log to download.

- **Type**: option

### `-d, --output-dir`

Directory to save downloaded logs.

- **Type**: option
- **Default**: `./logs`

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes
- **Default**: `test-3gw4ptpcb9b4@example.com`

### `-u, --user-id`

Download logs for a specific user ID.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Download all logs for the current user to the default ./logs directory:
sf cf:logs:download --current-user

Download a specific log by ID:
sf cf:logs:download --log-id 07L5e000006Q0KREA0

Download all logs for a specific user and delete them after download:
sf cf:logs:download --user-id 0055e000000Q0ZZAA0 --delete

Download all logs in the org to a custom directory:
sf cf:logs:download --all --output-dir ./my-logs

Download the 10 most recent logs for the current user:
sf cf:logs:download --current-user --limit 10

Download all logs with limited concurrency (5 at a time):
sf cf:logs:download --all --concurrency 5

## Alternative Syntaxes

- `sf logs:cf:download`
- `sf logs:download:cf`
- `sf cf:download:logs`
- `sf download:cf:logs`
- `sf download:logs:cf`

## Plugin

**codefriar-utils** (link)
