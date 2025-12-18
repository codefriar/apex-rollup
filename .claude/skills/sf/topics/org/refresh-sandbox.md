# org:refresh:sandbox

**Refresh a sandbox org using the sandbox name.**

## Description

Refreshing a sandbox copies the metadata, and optionally data, from your source org to the refreshed sandbox org. You can optionally specify a definition file if you want to change the configuration of the refreshed sandbox, such as its license type or template ID. You can also use the --source-id or --source-sandbox-name flags to change the refreshed sandbox org's original source org to a new org; in this case, the refreshed sandbox org's metadata is updated with the new source org's metadata.

You're not allowed to change the sandbox name when you refresh it with this command. If you want to change the sandbox name, first delete it with the "org delete sandbox" command. And then recreate it with the "org create sandbox" command and give it a new name.

## Usage

```bash
sf org:refresh:sandbox [flags]
```

## Flags

### Command Flags

### `--async`

Request the sandbox refresh, but don't wait for it to complete.

- **Type**: boolean

### `-f, --definition-file`

Path to a sandbox definition file for overriding its configuration when you refresh it.

- **Type**: option

### `-n, --name`

Name of the existing sandbox org in your production org that you want to refresh.

- **Type**: option

### `--no-auto-activate`

Disable auto-activation of the sandbox after a successful refresh.

- **Type**: boolean

### `--no-prompt`

Don't prompt for confirmation about the sandbox refresh.

- **Type**: boolean

### `-i, --poll-interval`

Number of seconds to wait between status polling requests.

- **Type**: option

### `--source-id`

ID of the sandbox org that becomes the new source org for the refreshed sandbox.

- **Type**: option

### `--source-sandbox-name`

Name of the sandbox org that becomes the new source org for the refreshed sandbox.

- **Type**: option

### `-o, --target-org`

Username or alias of the production org that contains the sandbox license.

- **Type**: option
- **Required**: Yes

### `-w, --wait`

Number of minutes to poll for sandbox refresh status.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Refresh the sandbox named "devSbx1". The production org that contains the sandbox license has the alias "prodOrg".
sf org:refresh:sandbox --name devSbx1 --target-org prodOrg

Refresh the sandbox named "devSbx2", and override the configuration of the refreshed sandbox with the properties in the specified defintion file. The default target org is the production org, so you don't need to specify the `--target-org` flag in this case.
sf org:refresh:sandbox --name devSbx2 --definition-file devSbx2-config.json

Refresh the sandbox using the name defined in the definition file. The production org that contains the sandbox license has the alias "prodOrg".
sf org:refresh:sandbox --definition-file devSbx3-config.json --target-org prodOrg

Refresh the sandbox named "devSbx2" by changing its original source org to be a sandbox called "devSbx3":
sf org:refresh:sandbox --name devSbx2 --source-sandbox-name devSbx3 --target-org prodOrg

## Alternative Syntaxes

- `sf refresh:org:sandbox`
- `sf refresh:sandbox:org`
- `sf org:sandbox:refresh`
- `sf sandbox:org:refresh`
- `sf sandbox:refresh:org`

## Plugin

**@salesforce/plugin-org** (core)
