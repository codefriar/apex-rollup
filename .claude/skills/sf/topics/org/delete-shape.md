# org:delete:shape

**Delete all org shapes for a target org.**

## Description

A source org can have only one active org shape. If you try to create an org shape for a source org that already has one, the previous shape is marked inactive and replaced by a new active shape. If you don’t want to create scratch orgs based on this shape, you can delete the org shape.

## Usage

```bash
sf org:delete:shape [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --no-prompt`

Don't prompt for confirmation.

- **Type**: boolean

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Delete all org shapes for the source org with alias SourceOrg:
sf org:delete:shape --target-org SourceOrg

Delete all org shapes without prompting:
sf org:delete:shape --target-org SourceOrg --no-prompt

## Aliases

- `force:org:shape:delete`

## Alternative Syntaxes

- `sf delete:org:shape`
- `sf delete:shape:org`
- `sf org:shape:delete`
- `sf shape:org:delete`
- `sf shape:delete:org`

## Plugin

**@salesforce/plugin-signups** (user)
