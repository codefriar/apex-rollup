# package:push-upgrade:abort

**Abort a package push upgrade that has been scheduled. Only push upgrade requests with a status of Created or Pending can be aborted.**

## Description

Specify the request ID that you want to abort. If applicable, the command displays errors related to the request.

To show all requests in the org, run "sf package pushupgrade list --package 033...".

## Usage

```bash
sf package:push-upgrade:abort [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-i, --push-request-id`

ID of the package push request (starts with 0DV). This ID is returned after the package push-upgrade schedule command completes successfully.

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

Cancel the specified package push upgrade request with the specified ID; uses your default Dev Hub org:
sf package:push-upgrade:abort --push-request-id 0DV...

Cancel the specified package push upgrade request in the Dev Hub org with username devhub@example.com:
sf package:push-upgrade:abort --push-request-id 0DV... --target-dev-hub devhub@example.com

## Alternative Syntaxes

- `sf push-upgrade:package:abort`
- `sf push-upgrade:abort:package`
- `sf package:abort:push-upgrade`
- `sf abort:package:push-upgrade`
- `sf abort:push-upgrade:package`

## Plugin

**@salesforce/plugin-packaging** (core)
