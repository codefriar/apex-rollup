# alias:unset

**Unset one or more aliases that are currently set on your local computer.**

## Description

Aliases are global, so when you unset one it's no longer available in any Salesforce DX project.

## Usage

```bash
sf alias:unset [flags]
```

## Flags

### Command Flags

### `-a, --all`

Unset all currently set aliases.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-p, --no-prompt`

Don't prompt the user for confirmation when unsetting all aliases.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Unset an alias:
sf alias:unset my-alias

Unset multiple aliases with a single command:
sf alias:unset my-alias my-other-alias

Unset all aliases:
sf alias:unset --all [--no-prompt]

## Aliases

- `force:alias:unset`

## Alternative Syntaxes

- `sf unset:alias`

## Plugin

**@salesforce/plugin-settings** (core)
