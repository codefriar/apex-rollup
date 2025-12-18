# org:create:sandbox

**Create a sandbox org.**

## Description

There are two ways to create a sandbox org: specify a definition file that contains the sandbox options or use the --name and --license-type flags to specify the two required options. If you want to set an option other than name or license type, such as apexClassId, you must use a definition file.

You can also use this command to clone an existing sandbox. Use the --source-sandbox-name flag to specify the existing sandbox name and the --name flag to the name of the new sandbox.

## Usage

```bash
sf org:create:sandbox [flags]
```

## Flags

### Command Flags

### `-a, --alias`

Alias for the sandbox org.

- **Type**: option

### `--async`

Request the sandbox creation, but don't wait for it to complete.

- **Type**: boolean

### `-f, --definition-file`

Path to a sandbox definition file.

- **Type**: option

### `-l, --license-type`

Type of sandbox license.

- **Type**: option

### `-n, --name`

Name of the sandbox org.

- **Type**: option

### `--no-prompt`

Don't prompt for confirmation about the sandbox configuration.

- **Type**: boolean

### `--no-track-source`

Do not use source tracking for this sandbox.

- **Type**: boolean

### `-i, --poll-interval`

Number of seconds to wait between retries.

- **Type**: option

### `-s, --set-default`

Set the sandbox org as your default org.

- **Type**: boolean

### `--source-id`

ID of the sandbox org to clone.

- **Type**: option

### `--source-sandbox-name`

Name of the sandbox org to clone.

- **Type**: option

### `-o, --target-org`

Username or alias of the production org that contains the sandbox license.

- **Type**: option
- **Required**: Yes

### `-w, --wait`

Number of minutes to wait for the sandbox org to be ready.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Create a sandbox org using a definition file and give it the alias "MyDevSandbox". The production org that contains the sandbox license has the alias "prodOrg".
sf org:create:sandbox --definition-file config/dev-sandbox-def.json --alias MyDevSandbox --target-org prodOrg

Create a sandbox org by directly specifying its name and type of license (Developer) instead of using a definition file. Set the sandbox org as your default.
sf org:create:sandbox --name mysandbox --license-type Developer --alias MyDevSandbox --target-org prodOrg --set-default

Clone the existing sandbox with name "ExistingSandbox" and name the new sandbox "NewClonedSandbox". Set the new sandbox as your default org. Wait for 30 minutes for the sandbox creation to complete.
sf org:create:sandbox --source-sandbox-name ExistingSandbox --name NewClonedSandbox --target-org prodOrg --alias MyDevSandbox --set-default --wait 30

Clone the existing sandbox with ID "0GQB0000000TVobOAG" and do not wait.
sf org:create:sandbox --source-id 0GQB0000000TVobOAG --name SbxClone --target-org prodOrg --async

## Aliases

- `env:create:sandbox`

## Alternative Syntaxes

- `sf create:org:sandbox`
- `sf create:sandbox:org`
- `sf org:sandbox:create`
- `sf sandbox:org:create`
- `sf sandbox:create:org`

## Plugin

**@salesforce/plugin-org** (core)
