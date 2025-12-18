# apex:get:log

**Fetch the specified log or given number of most recent logs from the org.**

## Description

To get the IDs for your debug logs, run "sf apex log list". Executing this command without flags returns the most recent log.

## Usage

```bash
sf apex:get:log [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-i, --log-id`

ID of the specific log to display.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --number`

Number of the most recent logs to display.

- **Type**: option

### `-d, --output-dir`

Directory for saving the log files.

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

Fetch the log in your default org using an ID:
sf apex:get:log --log-id <log id>

Fetch the log in the org with the specified username using an ID:
sf apex:get:log --log-id <log id> --target-org me@my.org

Fetch the two most recent logs in your default org:
sf apex:get:log --number 2

Similar to previous example, but save the two log files in the specified directory:
sf apex:get:log --output-dir /Users/sfdxUser/logs --number 2

## Aliases

- `force:apex:log:get`

## Alternative Syntaxes

- `sf get:apex:log`
- `sf get:log:apex`
- `sf apex:log:get`
- `sf log:apex:get`
- `sf log:get:apex`

## Plugin

**@salesforce/plugin-apex** (core)
