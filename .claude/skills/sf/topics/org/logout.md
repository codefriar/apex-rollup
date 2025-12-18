# org:logout

**Log out of a Salesforce org.**

## Description

If you run this command with no flags and no default org set in your config or environment, it first displays a list of orgs you've created or logged into, with none of the orgs selected. Use the arrow keys to scroll through the list and the space bar to select the orgs you want to log out of. Press Enter when you're done; the command asks for a final confirmation before logging out of the selected orgs.

The process is similar if you specify --all, except that in the initial list of orgs, they're all selected. Use --target-org to logout of a specific org. In both these cases by default, you must still confirm that you want to log out. Use --no-prompt to never be asked for confirmation when also using --all or --target-org.

Be careful! If you log out of a scratch org without having access to its password, you can't access the scratch org again, either through the CLI or the Salesforce UI.

Use the --client-app flag to log out of the link you previously created between an authenticated user and a connected app or external client app; you create these links with "org login web --client-app". Run "org display" to get the list of client app names.

## Usage

```bash
sf org:logout [flags]
```

## Flags

### Command Flags

### `-a, --all`

Include all authenticated orgs.

- **Type**: boolean

### `-c, --client-app`

Client app to log out of.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --no-prompt`

Don't prompt for confirmation.

- **Type**: boolean

### `-o, --target-org`

Username or alias of the target org.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Interactively select the orgs to log out of:
sf org:logout

Log out of the org with username me@my.org:
sf org:logout --target-org me@my.org

Log out of all orgs after confirmation:
sf org:logout --all

Logout of the org with alias my-scratch and don't prompt for confirmation:
sf org:logout --target-org my-scratch --no-prompt

## Aliases

- `force:auth:logout`
- `auth:logout`

## Alternative Syntaxes

- `sf logout:org`

## Plugin

**@salesforce/plugin-auth** (core)
