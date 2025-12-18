# package:install:report

**Retrieve the status of a package installation request.**

## Usage

```bash
sf package:install:report [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-i, --request-id`

ID of the package install request you want to check; starts with 0Hf.

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

Retrieve the status of a package installation request with the specified ID on your default org:
sf package:install:report --request-id 0Hf...

Similar to previous example, except use the org with username me@example.com:
sf package:install:report --request-id 0Hf... --target-org me@example.com

## Aliases

- `force:package:install:report`

## Alternative Syntaxes

- `sf install:package:report`
- `sf install:report:package`
- `sf package:report:install`
- `sf report:package:install`
- `sf report:install:package`

## Plugin

**@salesforce/plugin-packaging** (core)
