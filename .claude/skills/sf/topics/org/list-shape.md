# org:list:shape

**List all org shapes you’ve created.**

## Description

The output includes the alias, username, and ID of the source org, the status of the org shape creation, and more. Use the org ID to update your scratch org configuration file so you can create a scratch org based on this org shape.

## Usage

```bash
sf org:list:shape [flags]
```

## Flags

### Command Flags

### `--loglevel`

- **Type**: option

### `--verbose`

List more information about each org shape.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

List all org shapes you've created:
sf org:list:shape

List all org shapes in JSON format and write the output to a file:
sf org:list:shape --json > tmp/MyOrgShapeList.json

## Aliases

- `force:org:shape:list`

## Alternative Syntaxes

- `sf list:org:shape`
- `sf list:shape:org`
- `sf org:shape:list`
- `sf shape:org:list`
- `sf shape:list:org`

## Plugin

**@salesforce/plugin-signups** (user)
