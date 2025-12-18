# package1:version:display

**Display details about a first-generation package version.**

## Usage

```bash
sf package1:version:display [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-i, --package-version-id`

ID (starts with 04t) of the metadata package version whose details you want to display.

- **Type**: option
- **Required**: Yes

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

Display details about the first-generation package version with the specified ID in your default org:
sf package1:version:display --package-version-id 04t...

Same as previous example, but use the specified org:
sf package1:version:display --package-version-id 04t... --target-org myorg@example.com

## Aliases

- `force:package1:version:display`

## Alternative Syntaxes

- `sf version:package1:display`
- `sf version:display:package1`
- `sf package1:display:version`
- `sf display:package1:version`
- `sf display:version:package1`

## Plugin

**@salesforce/plugin-packaging** (core)
