# org:generate:password

**Generate a random password for scratch org users.**

## Description

By default, new scratch orgs contain one admin user with no password. Use this command to generate or change a password for this admin user. After it's set, you can’t unset a password, you can only change it.

You can also use the --on-behalf-of flag to generate a password for a scratch org user that you've created locally with the "org create user" command. This command doesn't work for users you created in the scratch org using Setup.

To change the password strength, set the --complexity flag to a value between 0 and 5. Each value specifies the types of characters used in the generated password:

0 - lower case letters only
1 - lower case letters and numbers only
2 - lower case letters and symbols only
3 - lower and upper case letters and numbers only
4 - lower and upper case letters and symbols only
5 - lower and upper case letters and numbers and symbols only

To see a password that was previously generated, run "org display user".

## Usage

```bash
sf org:generate:password [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-c, --complexity`

Level of password complexity or strength; the higher the value, the stronger the password.

- **Type**: option
- **Default**: `5`

### `-l, --length`

Number of characters in the generated password; valid values are between 8 and 100.

- **Type**: option
- **Default**: `13`

### `-b, --on-behalf-of`

Comma-separated list of usernames or aliases to assign the password to; must have been created locally with the "org create user" command.

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

Generate a password for the original admin user of your default scratch org:
sf org:generate:password

Generate a password that contains 12 characters for the original admin user of the scratch org with alias "my-scratch":
sf org:generate:password --length 12 --target-org my-scratch

Generate a password for your default scratch org admin user that uses lower and upper case letters and numbers only:
sf org:generate:password --complexity 3

Generate a password for the specified users in the default scratch org; these users must have been created locally with the "org create user" command:
sf org:generate:password --on-behalf-of user1@my.org --on-behalf-of user2@my.org --on-behalf-of user3@my.org

## Alternative Syntaxes

- `sf generate:org:password`
- `sf generate:password:org`
- `sf org:password:generate`
- `sf password:org:generate`
- `sf password:generate:org`

## Plugin

**@salesforce/plugin-user** (core)
