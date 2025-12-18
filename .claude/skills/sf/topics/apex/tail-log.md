# apex:tail:log

**Activate debug logging and display logs in the terminal.**

## Description

You can also pipe the logs to a file.

## Usage

```bash
sf apex:tail:log [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-c, --color`

Apply default colors to noteworthy log lines.

- **Type**: boolean

### `-d, --debug-level`

Debug level to set on the DEVELOPER_LOG trace flag for your user.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-s, --skip-trace-flag`

Skip trace flag setup. Assumes that a trace flag and debug level are fully set up.

- **Type**: boolean

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

Activate debug logging:
sf apex:tail:log

Specify a debug level:
sf apex:tail:log --debug-level MyDebugLevel

Skip the trace flag setup and apply default colors:
sf apex:tail:log --color --skip-trace-flag

## Aliases

- `force:apex:log:tail`

## Alternative Syntaxes

- `sf tail:apex:log`
- `sf tail:log:apex`
- `sf apex:log:tail`
- `sf log:apex:tail`
- `sf log:tail:apex`

## Plugin

**@salesforce/plugin-apex** (core)
