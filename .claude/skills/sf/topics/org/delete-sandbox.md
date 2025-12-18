# org:delete:sandbox

**Delete a sandbox.**

## Description

Salesforce CLI marks the org for deletion in the production org that contains the sandbox licenses and then deletes all local references to the org from your computer.
Specify a sandbox with either the username you used when you logged into it, or the alias you gave the sandbox when you created it. Run "sf org list" to view all your orgs, including sandboxes, and their aliases.
Both the sandbox and the associated production org must already be authenticated with the CLI to successfully delete the sandbox.

## Usage

```bash
sf org:delete:sandbox [flags]
```

## Flags

### Command Flags

### `-p, --no-prompt`

Don't prompt the user to confirm the deletion.

- **Type**: boolean

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

Delete a sandbox with alias my-sandbox:
sf org:delete:sandbox --target-org my-sandbox

Specify a username instead of an alias:
sf org:delete:sandbox --target-org myusername@example.com.qa

Delete the sandbox without prompting to confirm:
sf org:delete:sandbox --target-org my-sandbox --no-prompt

## Aliases

- `env:delete:sandbox`

## Alternative Syntaxes

- `sf delete:org:sandbox`
- `sf delete:sandbox:org`
- `sf org:sandbox:delete`
- `sf sandbox:org:delete`
- `sf sandbox:delete:org`

## Plugin

**@salesforce/plugin-org** (core)
