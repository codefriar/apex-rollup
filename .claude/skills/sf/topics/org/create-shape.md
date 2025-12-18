# org:create:shape

**Create a scratch org configuration (shape) based on the specified source org.**

## Description

Scratch org shapes mimic the baseline setup (features, limits, edition, and Metadata API settings) of a source org without the extraneous data and metadata.

Run "sf org list shape" to view the available org shapes and their IDs.

To create a scratch org from an org shape, include the "sourceOrg" property in the scratch org definition file and set it to the org ID of the source org. Then create a scratch org with the "sf org create scratch" command.

## Usage

```bash
sf org:create:shape [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

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

Create an org shape for the source org with alias SourceOrg:
sf org:create:shape --target-org SourceOrg

## Aliases

- `force:org:shape:create`

## Alternative Syntaxes

- `sf create:org:shape`
- `sf create:shape:org`
- `sf org:shape:create`
- `sf shape:org:create`
- `sf shape:create:org`

## Plugin

**@salesforce/plugin-signups** (user)
