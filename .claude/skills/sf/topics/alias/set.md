# alias:set

**Set one or more aliases on your local computer.**

## Description

Aliases are user-defined short names that make it easier to use the CLI. For example, users often set an alias for a scratch org usernames because they're long and unintuitive. Check the --help of a CLI command to determine where you can use an alias.

You can associate an alias with only one value at a time. If you set an alias multiple times, the alias points to the most recent value. Aliases are global; after you set an alias, you can use it in any Salesforce DX project on your computer.

Use quotes to specify an alias value that contains spaces. You typically use an equal sign to set your alias, although you don't need it if you're setting a single alias in a command.

## Usage

```bash
sf alias:set [flags]
```

## Flags

### Command Flags

### `--loglevel`

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Set an alias for a scratch org username:
sf alias:set my-scratch-org=test-sadbiytjsupn@example.com

Set multiple aliases with a single command:
sf alias:set my-scratch-org=test-sadbiytjsupn@example.com my-other-scratch-org=test-ss0xut7txzxf@example.com

Set an alias that contains spaces:
sf alias:set my-alias='alias with spaces'

Set a single alias without using an equal sign:
sf alias:set my-scratch-org test-ss0xut7txzxf@example.com

## Aliases

- `force:alias:set`

## Alternative Syntaxes

- `sf set:alias`

## Plugin

**@salesforce/plugin-settings** (core)
