# plugins:link

**Links a plugin into the CLI for development.**

## Description

Installation of a linked plugin will override a user-installed or core plugin.

e.g. If you have a user-installed or core plugin that has a 'hello' command, installing a linked plugin with a 'hello' command will override the user-installed or core plugin implementation. This is useful for development work.

## Usage

```bash
sf plugins:link [flags]
```

## Flags

### Command Flags

### `-h, --help`

Show CLI help.

- **Type**: boolean

### `--install`

Install dependencies after linking the plugin.

- **Type**: boolean

### `-v, --verbose`

- **Type**: boolean

## Examples

sf plugins:link <%- config.pjson.oclif.examplePlugin || "myplugin" %>

## Alternative Syntaxes

- `sf link:plugins`

## Plugin

**@oclif/plugin-plugins** (core)
