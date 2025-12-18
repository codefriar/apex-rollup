# package1:version:list

**List package versions for the specified first-generation package or for the org.**

## Usage

```bash
sf package1:version:list [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-i, --package-id`

Metadata package ID (starts with 033) whose package versions you want to list.

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

List all first-generation package versions in your default org:
sf package1:version:list

List package versions for the specified first-generation package in the specifief org:
sf package1:version:list --package-id 033... --target-org myorg@example.com

## Aliases

- `force:package1:version:list`

## Alternative Syntaxes

- `sf version:package1:list`
- `sf version:list:package1`
- `sf package1:list:version`
- `sf list:package1:version`
- `sf list:version:package1`

## Plugin

**@salesforce/plugin-packaging** (core)
