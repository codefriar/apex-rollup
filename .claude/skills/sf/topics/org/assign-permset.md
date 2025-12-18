# org:assign:permset

**Assign a permission set to one or more org users.**

## Description

To specify an alias for the --target-org or --on-behalf-of flags, use the CLI username alias, such as the one you set with the "alias set" command. Don't use the value of the Alias field of the User Salesforce object for the org user.

To assign multiple permission sets, either set multiple --name flags or a single --name flag with multiple names separated by spaces. Enclose names that contain spaces in one set of double quotes. The same syntax applies to --on-behalf-of.

## Usage

```bash
sf org:assign:permset [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-n, --name`

Permission set to assign.

- **Type**: option
- **Required**: Yes
- **Multiple**: Can be specified multiple times

### `-b, --on-behalf-of`

Username or alias to assign the permission set to.

- **Type**: option
- **Multiple**: Can be specified multiple times

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

Assign two permission sets called DreamHouse and CloudHouse to original admin user of your default org:
sf org:assign:permset --name DreamHouse --name CloudHouse

Assign the Dreamhouse permission set to the original admin user of the org with alias "my-scratch":
sf org:assign:permset --name DreamHouse --target-org my-scratch

Assign the Dreamhouse permission set to the specified list of users of your default org:
sf org:assign:permset --name DreamHouse --on-behalf-of user1@my.org --on-behalf-of user2 --on-behalf-of user

## Alternative Syntaxes

- `sf assign:org:permset`
- `sf assign:permset:org`
- `sf org:permset:assign`
- `sf permset:org:assign`
- `sf permset:assign:org`

## Plugin

**@salesforce/plugin-user** (core)
