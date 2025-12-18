# flow:fix

## Description

Fix common problems using lfs core engine. Rule definitions that specifies autoFixable can be executed and fixes may be applied automatically

## Usage

```bash
sf flow:fix [flags]
```

## Flags

### Command Flags

### `-d, --dir`

Specify one or more Directorie(s) to find flows and fix

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-f, --files`

Specify one or more flow File(s) to run

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-r, --rules`

Specify one or more Rule Id(s) to run

- **Type**: option
- **Required**: Yes
- **Multiple**: Can be specified multiple times

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

sf flow:fix

## Plugin

**lightning-flow-scanner** (user)
