# org:delete:scratch

**Delete a scratch org.**

## Description

Salesforce CLI marks the org for deletion in the Dev Hub org and then deletes all local references to the org from your computer.
Specify a scratch org with either the username or the alias you gave the scratch org when you created it. Run "sf org list" to view all your orgs, including scratch orgs, and their aliases.

## Usage

```bash
sf org:delete:scratch [flags]
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

Delete a scratch org with alias my-scratch-org:
sf org:delete:scratch --target-org my-scratch-org

Specify a username instead of an alias:
sf org:delete:scratch --target-org test-123456-abcdefg@example.com

Delete the scratch org without prompting to confirm :
sf org:delete:scratch --target-org my-scratch-org --no-prompt

## Aliases

- `env:delete:scratch`

## Alternative Syntaxes

- `sf delete:org:scratch`
- `sf delete:scratch:org`
- `sf org:scratch:delete`
- `sf scratch:org:delete`
- `sf scratch:delete:org`

## Plugin

**@salesforce/plugin-org** (core)
