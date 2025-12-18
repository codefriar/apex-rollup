# package:uninstall:report

**Retrieve the status of a package uninstall request.**

## Usage

```bash
sf package:uninstall:report [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-i, --request-id`

ID of the package uninstall request you want to check; starts with 06y.

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

Retrieve the status of a package uninstall in your default org using the specified request ID:
sf package:uninstall:report --request-id 06y...

Similar to previous example, but use the org with username me@example.com:
sf package:uninstall:report --request-id 06y... --target-org me@example.com

## Aliases

- `force:package:uninstall:report`

## Alternative Syntaxes

- `sf uninstall:package:report`
- `sf uninstall:report:package`
- `sf package:report:uninstall`
- `sf report:package:uninstall`
- `sf report:uninstall:package`

## Plugin

**@salesforce/plugin-packaging** (core)
