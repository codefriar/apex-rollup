# project:delete:source

**Delete source from your project and from a non-source-tracked org.**

## Description

Use this command to delete components from orgs that don’t have source tracking. To remove deleted items from orgs that have source tracking enabled, "sf project deploy start".

When you run this command, both the local source file and the metadata component in the org are deleted.

To delete multiple metadata components, either set multiple --metadata <name> flags or a single --metadata flag with multiple names separated by spaces. Enclose names that contain spaces in one set of double quotes. The same syntax applies to --source-dir.

## Usage

```bash
sf project:delete:source [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-c, --check-only`

Validate delete command but don't delete anything from the org or the local project.

- **Type**: boolean

### `-f, --force-overwrite`

Ignore conflict warnings and overwrite changes to the org.

- **Type**: boolean

### `--loglevel`

- **Type**: option

### `-m, --metadata`

Metadata components to delete.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-r, --no-prompt`

Don't prompt for delete confirmation.

- **Type**: boolean

### `-p, --source-dir`

Source file paths to delete.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-l, --test-level`

Deployment Apex testing level.

- **Type**: option

### `--tests`

Apex tests to run when --test-level is RunSpecifiedTests.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-t, --track-source`

If the delete succeeds, update the source tracking information.

- **Type**: boolean

### `--verbose`

Verbose output of the delete result.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for the command to finish.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Delete all local Apex source files and all Apex classes from the org with alias "my-scratch":
sf project:delete:source --metadata ApexClass --target-org my-scratch

Delete a specific Apex class and a Profile that has a space in it from your default org; don't prompt for confirmation:
sf project:delete:source --metadata ApexClass:MyFabulousApexClass --metadata "Profile: My Profile" --no-prompt

Run the tests that aren’t in any managed packages as part of the deletion; if the delete succeeds, and the org has source-tracking enabled, update the source tracking information:
sf project:delete:source --metadata ApexClass --test-level RunLocalTests --track-source

Delete the Apex source files in a directory and the corresponding components from your default org:
sf project:delete:source --source-dir force-app/main/default/classes

## Aliases

- `force:source:delete`

## Alternative Syntaxes

- `sf delete:project:source`
- `sf delete:source:project`
- `sf project:source:delete`
- `sf source:project:delete`
- `sf source:delete:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
