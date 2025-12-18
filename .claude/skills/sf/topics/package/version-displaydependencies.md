# package:version:displaydependencies

**Display the dependency graph for an unlocked or 2GP managed package version.**

## Usage

```bash
sf package:version:displaydependencies [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--edge-direction`

Order (root-first or root-last) in which the dependencies are displayed.

- **Type**: option
- **Default**: `root-first`

### `--loglevel`

- **Type**: option

### `-p, --package`

ID or alias of the package version (starts with 04t) or the package version create request (starts with 08c) to display the dependency graph for.

- **Type**: option
- **Required**: Yes

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `--verbose`

Display both the package version ID (starts with 04t) and the version number (major.minor.patch.build) in each node.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Display the dependency graph for a package version with the specified alias, using your default Dev Hub org and the default edge-direction:
sf package:version:displaydependencies --package package_version_alias

Display the dependency graph for a package version with the specified ID and display the graph using a root-last edge direction. Use the Dev Hub org with username devhub@example.com:
sf package:version:displaydependencies --package 04t... --edge-direction root-last --target-dev-hub devhub@example.com

Display the dependency graph of a version create request with the specified ID, using your default Dev Hub org and the default edge-direction:
sf package:version:displaydependencies --package 08c...

## Alternative Syntaxes

- `sf version:package:displaydependencies`
- `sf version:displaydependencies:package`
- `sf package:displaydependencies:version`
- `sf displaydependencies:package:version`
- `sf displaydependencies:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
