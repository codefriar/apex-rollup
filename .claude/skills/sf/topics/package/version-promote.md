# package:version:promote

**Promote a package version to released.**

## Description

Supply the ID or alias of the package version you want to promote. Promotes the package version to released status.

## Usage

```bash
sf package:version:promote [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --no-prompt`

Don't prompt to confirm setting the package version as released.

- **Type**: boolean

### `-p, --package`

ID (starts with 04t) or alias of the package version to promote.

- **Type**: option
- **Required**: Yes

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

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

Promote the package version with the specified ID to released; uses your default Dev Hub org:
sf package:version:promote --package 04t...

Promote the package version with the specified alias to released; uses the Dev Hub org with username devhub@example.com:
sf package:version:promote --package awesome_package_alias --target-dev-hub devhub@example.com

Promote the package version with an alias that has spaces to released:
sf package:version:promote --package "Awesome Package Alias"

## Aliases

- `force:package:version:promote`

## Alternative Syntaxes

- `sf version:package:promote`
- `sf version:promote:package`
- `sf package:promote:version`
- `sf promote:package:version`
- `sf promote:version:package`

## Plugin

**@salesforce/plugin-packaging** (core)
