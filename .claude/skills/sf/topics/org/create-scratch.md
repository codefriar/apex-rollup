# org:create:scratch

**Create a scratch org.**

## Description

There are four ways to create a scratch org:

    * Specify a definition file that contains the scratch org options.
    * Use the --edition flag to specify the one required option; this method doesn't require a defintion file.
    * Use the --snapshot flag to create a scratch org from a snapshot. Snapshots are a point-in-time copy of a scratch org; you create a snapshot with the "sf org create snapshot" command.
    * Use the --source-org flag to create a scratch org from an org shape. Org shapes mimic the baseline setup of a source org without the extraneous data and metadata; you create an org shape with the "sf org create shape" command.

The --edition, --snapshot, and --source-org flags are mutually exclusive, which means if you specify one, you can't also specify the others.

For any of the methods, you can also use these flags; if you use them with --definition-file, they override their equivalent option in the scratch org definition file:

    * --description
    * --name  (equivalent to the "orgName" option)
    * --username
    * --release
    * --admin-email (equivalent to the "adminEmail" option)

If you want to set options such as org features or settings, you must use a definition file.

You must specify a Dev Hub to create a scratch org, either with the --target-dev-hub flag or by setting your default Dev Hub with the target-dev-hub configuration variable.

## Usage

```bash
sf org:create:scratch [flags]
```

## Flags

### Command Flags

### `--admin-email`

Email address that will be applied to the org's admin user. Overrides the value of the "adminEmail" option in the definition file, if set.

- **Type**: option

### `-a, --alias`

Alias for the scratch org.

- **Type**: option

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--async`

Request the org, but don't wait for it to complete.

- **Type**: boolean

### `-i, --client-id`

Consumer key of the Dev Hub connected app.

- **Type**: option

### `-f, --definition-file`

Path to a scratch org definition file.

- **Type**: option

### `--description`

Description of the scratch org in the Dev Hub. Overrides the value of the "description" option in the definition file, if set.

- **Type**: option

### `-y, --duration-days`

Number of days before the org expires.

- **Type**: option

### `-e, --edition`

Salesforce edition of the scratch org. Overrides the value of the "edition" option in the definition file, if set.

- **Type**: option

### `--name`

Name of the org, such as "Acme Company". Overrides the value of the "orgName" option in the definition file, if set.

- **Type**: option

### `-c, --no-ancestors`

Don't include second-generation managed package (2GP) ancestors in the scratch org.

- **Type**: boolean

### `-m, --no-namespace`

Create the scratch org with no namespace, even if the Dev Hub has a namespace.

- **Type**: boolean

### `--release`

Release of the scratch org as compared to the Dev Hub release.

- **Type**: option

### `-d, --set-default`

Set the scratch org as your default org

- **Type**: boolean

### `-s, --snapshot`

Name of the snapshot to use when creating this scratch org. Overrides the value of the "snapshot" option in the defintion file, if set.

- **Type**: option

### `--source-org`

15-character ID of the org shape that the new scratch org is based on. Overrides the value of the "sourceOrg" option in the definition file, if set.

- **Type**: option

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org.

- **Type**: option
- **Required**: Yes

### `-t, --track-source`

Use source tracking for this scratch org. Set --no-track-source to disable source tracking.

- **Type**: boolean

### `--username`

Username of the scratch org admin user. Overrides the value of the "username" option in the definition file, if set.

- **Type**: option

### `-w, --wait`

Number of minutes to wait for the scratch org to be ready.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Create a Developer edition scratch org using your default Dev Hub and give the scratch org an alias:
sf org:create:scratch --edition developer --alias my-scratch-org

Create a scratch org with a definition file. Specify the Dev Hub using its alias, set the scratch org as your default, and specify that it expires in 3 days:
sf org:create:scratch --target-dev-hub MyHub --definition-file config/project-scratch-def.json --set-default --duration-days 3

Create a preview Enterprise edition scratch org; for use only during Salesforce release transition periods:
sf org:create:scratch --edition enterprise --alias my-scratch-org --target-dev-hub MyHub --release preview

Create a scratch org from a snapshot called "NightlyBranch"; be sure you specify the same Dev Hub org associated with the snapshot. We recommend you increase the --wait time because creating a scratch org from a snapshot can take a while:
sf org:create:scratch --alias my-scratch-org --target-dev-hub MyHub --snapshot NightlyBranch --wait 10

## Aliases

- `env:create:scratch`

## Alternative Syntaxes

- `sf create:org:scratch`
- `sf create:scratch:org`
- `sf org:scratch:create`
- `sf scratch:org:create`
- `sf scratch:create:org`

## Plugin

**@salesforce/plugin-org** (core)
