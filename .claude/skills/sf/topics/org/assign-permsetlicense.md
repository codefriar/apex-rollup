# org:assign:permsetlicense

**Assign a permission set license to one or more org users.**

## Description

To specify an alias for the --target-org or --on-behalf-of flags, use the CLI username alias, such as the one you set with the "alias set" command. Don't use the value of the Alias field of the User Salesforce object for the org user.

To assign multiple permission sets, either set multiple --name flags or a single --name flag with multiple names separated by spaces. Enclose names that contain spaces in one set of double quotes. The same syntax applies to --on-behalf-of.

## Usage

```bash
sf org:assign:permsetlicense [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-n, --name`

Name of the permission set license to assign.

- **Type**: option
- **Required**: Yes
- **Multiple**: Can be specified multiple times

### `-b, --on-behalf-of`

Usernames or alias to assign the permission set license to.

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

Assign the DreamHouse permission set license to original admin user of your default org:
sf org:assign:permsetlicense --name DreamHouse

Assign two permission set licenses to the original admin user of the org with alias "my-scratch":
sf org:assign:permsetlicense --name DreamHouse --name CloudHouse --target-org my-scratch

Assign the Dreamhouse permission set license to the specified list of users of your default org:
sf org:assign:permsetlicense --name DreamHouse --on-behalf-of user1@my.org --on-behalf-of user2 --on-behalf-of user3

## Alternative Syntaxes

- `sf assign:org:permsetlicense`
- `sf assign:permsetlicense:org`
- `sf org:permsetlicense:assign`
- `sf permsetlicense:org:assign`
- `sf permsetlicense:assign:org`

## Plugin

**@salesforce/plugin-user** (core)
