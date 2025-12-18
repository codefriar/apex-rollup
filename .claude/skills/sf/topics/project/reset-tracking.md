# project:reset:tracking

**Reset local and remote source tracking.**

## Description

WARNING: This command deletes or overwrites all existing source tracking files. Use with extreme caution.

Resets local and remote source tracking so that Salesforce CLI no longer registers differences between your local files and those in the org. When you next run 'project deploy preview', Salesforce CLI returns no results, even though conflicts might actually exist. Salesforce CLI then resumes tracking new source changes as usual.

Use the --revision flag to reset source tracking to a specific revision number of an org source member. To get the revision number, query the SourceMember Tooling API object with the 'data soql' command. For example:

    sf data query --query "SELECT MemberName, MemberType, RevisionCounter FROM SourceMember" --use-tooling-api --target-org my-scratch

## Usage

```bash
sf project:reset:tracking [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --no-prompt`

Don't prompt for source tracking override confirmation.

- **Type**: boolean

### `-r, --revision`

SourceMember revision counter number to reset to.

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

Reset source tracking for the org with alias "my-scratch":
$ sf project:reset:tracking --target-org my-scratch

Reset source tracking to revision number 30 for your default org:
$ sf project:reset:tracking --revision 30

## Aliases

- `force:source:tracking:reset`

## Alternative Syntaxes

- `sf reset:project:tracking`
- `sf reset:tracking:project`
- `sf project:tracking:reset`
- `sf tracking:project:reset`
- `sf tracking:reset:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
