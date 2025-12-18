# org:display:user

**Display information about a Salesforce user.**

## Description

Output includes the profile name, org ID, access token, instance URL, login URL, and alias if applicable. The displayed alias is local and different from the Alias field of the User sObject record of the new user, which you set in the Setup UI.

## Usage

```bash
sf org:display:user [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

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

Display information about the admin user of your default scratch org:
sf org:display:user

Display information about the specified user and output in JSON format:
sf org:display:user --target-org me@my.org --json

## Aliases

- `force:user:display`

## Alternative Syntaxes

- `sf display:org:user`
- `sf display:user:org`
- `sf org:user:display`
- `sf user:org:display`
- `sf user:display:org`

## Plugin

**@salesforce/plugin-user** (core)
