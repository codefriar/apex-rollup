# flow:scan

## Description

Find and fix potential bugs in Salesforce flows.

## Usage

```bash
sf flow:scan [flags]
```

## Flags

### Command Flags

### `-z, --betamode`

Enable beta rules at run-time (experimental)

- **Type**: boolean

### `-c, --config`

Path to configuration file

- **Type**: option

### `-d, --directory`

Directory to scan for flows

- **Type**: option

### `-f, --failon`

[DEPRECATED] Use --threshold (-t) instead. Threshold failure level (error, warning, note, or never) defining when the command return code will be 1

- **Type**: option
- **Default**: `error`

### `--files`

List of source flows paths to scan

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-s, --sarif`

Get SARIF output in the stdout directly

- **Type**: boolean

### `-t, --threshold`

Fail the command if issues of this severity or higher are found (error, warning, note, never)

- **Type**: option
- **Default**: `error`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

sf flow scan

sf flow scan --threshold warning

sf flow scan -c path/to/config.json

sf flow scan -c path/to/config.json --json

sf flow scan -c path/to/config.json --threshold warning

sf flow scan -d path/to/flows/directory

sf flow scan --files path/to/single/file.flow-meta.xml path/to/another/file.flow-meta.xml

sf flow scan -p path/to/single/file.flow-meta.xml path/to/another/file.flow-meta.xml

sf flow scan --sarif > results.sarif

## Plugin

**lightning-flow-scanner** (user)
