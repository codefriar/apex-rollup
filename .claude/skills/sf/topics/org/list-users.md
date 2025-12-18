# org:list:users

**List all locally-authenticated users of an org.**

## Description

For scratch orgs, the list includes any users you've created with the "org create user" command; the original scratch org admin user is marked with "(A)". For other orgs, the list includes the users you used to authenticate to the org.

## Usage

```bash
sf org:list:users [flags]
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

List the locally-authenticated users of your default org:
sf org:list:users

List the locally-authenticated users of the specified org:
sf org:list:users --target-org me@my.org

## Aliases

- `force:user:list`

## Alternative Syntaxes

- `sf list:org:users`
- `sf list:users:org`
- `sf org:users:list`
- `sf users:org:list`
- `sf users:list:org`

## Plugin

**@salesforce/plugin-user** (core)
