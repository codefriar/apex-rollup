# org:create:user

**Create a user for a scratch org.**

## Description

A scratch org includes one administrator user by default. For testing purposes, however, you sometimes need to create additional users.

The easiest way to create a user is to let this command assign default or generated characteristics to the new user. If you want to customize your new user, create a definition file and specify it with the --definition-file flag. In the file, you can include all the User sObject (SSalesforce object) fields and Salesforce DX-specific options, as described in "User Definition File for Customizing a Scratch Org User" (https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_scratch_orgs_users_def_file.htm). You can also specify these options on the command line.

If you don't customize your new user, this command creates a user with the following default characteristics:

    * The username is the existing administrator’s username prepended with a timestamp, such as 1505759162830_test-wvkpnfm5z113@example.com.
    * The user’s profile is Standard User.
    * The values of the required fields of the User sObject are the corresponding values of the administrator user.
    * The user has no password.

Use the --set-alias flag to assign a simple name to the user that you can reference in later CLI commands. This alias is local and different from the Alias field of the User sObject record of the new user, which you set in the Setup UI.

When this command completes, it displays the new username and user ID. Run the "org display user" command to get more information about the new user.

After the new user has been created, Salesforce CLI automatically authenticates it to the scratch org so the new user can immediately start using the scratch org. The CLI uses the same authentication method that was used on the associated Dev Hub org. Due to Hyperforce limitations, the scratch org user creation fails if the Dev Hub authentication used the JWT flow and the scratch org is on Hyperforce. For this reason, if you plan to create scratch org users, authenticate to the Dev Hub org with either the "org login web" or "org login sfdx-url" command, and not "org login jwt".

For more information about user limits, defaults, and other considerations when creating a new scratch org user, see https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_scratch_orgs_users.htm.

## Usage

```bash
sf org:create:user [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-f, --definition-file`

File path to a user definition file for customizing the new user.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-a, --set-alias`

Set an alias for the created username to reference in other CLI commands.

- **Type**: option

### `-s, --set-unique-username`

Force the username, if specified in the definition file or at the command line, to be unique by appending the org ID.

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

Create a user for your default scratch org and let this command generate a username, user ID, and other characteristics:
sf org:create:user

Create a user with alias "testuser1" using a user definition file. Set the "profileName" option to "Chatter Free User", which overrides the value in the defintion file if it also exists there. Create the user for the scratch org with alias "my-scratch":
sf org:create:user --set-alias testuser1 --definition-file config/project-user-def.json profileName='Chatter Free User' --target-org my-scratch

Create a user by specifying the username, email, and perm set assignment at the command line; command fails if the username already exists in Salesforce:
sf org:create:user username=testuser1@my.org email=me@my.org permsets=DreamHouse

Create a user with a definition file, set the email value as specified (overriding any value in the definition file), and generate a password for the user. If the username in the definition file isn't unique, the command appends the org ID to make it unique:
sf org:create:user --definition-file config/project-user-def.json email=me@my.org generatepassword=true --set-unique-username

## Aliases

- `force:user:create`

## Alternative Syntaxes

- `sf create:org:user`
- `sf create:user:org`
- `sf org:user:create`
- `sf user:org:create`
- `sf user:create:org`

## Plugin

**@salesforce/plugin-user** (core)
