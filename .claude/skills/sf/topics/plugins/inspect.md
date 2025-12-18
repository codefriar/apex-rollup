# plugins:inspect

## Description

Displays installation properties of a plugin.

## Usage

```bash
sf plugins:inspect [flags]
```

## Flags

### Command Flags

### `-h, --help`

Show CLI help.

- **Type**: boolean

### `-v, --verbose`

- **Type**: boolean

### Global Flags

### `--json`

Format output as json.

- **Type**: boolean

## Examples

sf plugins:inspect <%- config.pjson.oclif.examplePlugin || "myplugin" %>

## Alternative Syntaxes

- `sf inspect:plugins`

## Plugin

**@oclif/plugin-plugins** (core)
