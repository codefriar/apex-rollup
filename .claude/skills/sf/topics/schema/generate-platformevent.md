# schema:generate:platformevent

**Generate metadata source files for a new platform event.**

## Description

This command is interactive and must be run in a Salesforce DX project directory. You're required to specify the event's label with the "--label" flag. The command uses this label to provide intelligent suggestions for other event properties, such as its API name.

## Usage

```bash
sf schema:generate:platformevent [flags]
```

## Flags

### Command Flags

### `-l, --label`

The platform event's label.

- **Type**: option
- **Required**: Yes

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

Create a platform event with the specified label:
sf schema:generate:platformevent --label "My Platform Event"

## Aliases

- `generate:metadata:platformevent`

## Alternative Syntaxes

- `sf generate:schema:platformevent`
- `sf generate:platformevent:schema`
- `sf schema:platformevent:generate`
- `sf platformevent:schema:generate`
- `sf platformevent:generate:schema`

## Plugin

**@salesforce/plugin-sobject** (core)
