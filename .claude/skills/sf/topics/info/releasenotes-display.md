# info:releasenotes:display

**Display Salesforce CLI release notes on the command line.**

## Description

By default, this command displays release notes for the currently installed CLI version on your computer. Use the --version flag to view release notes for a different release.

## Usage

```bash
sf info:releasenotes:display [flags]
```

## Flags

### Command Flags

### `--hook`

This hidden parameter is used in post install or update hooks.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-v, --version`

CLI version or tag for which to display release notes.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Display release notes for the currently installed CLI version:
sf info:releasenotes:display

Display release notes for CLI version 7.120.0:
sf info:releasenotes:display --version 7.120.0

Display release notes for the CLI version that corresponds to a tag (stable, stable-rc, latest, latest-rc, rc):
sf info:releasenotes:display --version latest

## Aliases

- `whatsnew`

## Alternative Syntaxes

- `sf releasenotes:info:display`
- `sf releasenotes:display:info`
- `sf info:display:releasenotes`
- `sf display:info:releasenotes`
- `sf display:releasenotes:info`

## Plugin

**@salesforce/plugin-info** (core)
