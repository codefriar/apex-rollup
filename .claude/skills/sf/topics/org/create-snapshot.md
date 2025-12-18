# org:create:snapshot

**Create a snapshot of a scratch org.**

## Description

A snapshot is a point-in-time copy of a scratch org. The copy is referenced by its unique name in a scratch org definition file.

Use "sf org get snapshot" to get details, including status, about a snapshot creation request.

To create a scratch org from a snapshot, include the "snapshot" option (instead of "edition") in the scratch org definition file and set it to the name of the snapshot. Then use "sf org create scratch" to create the scratch org.

## Usage

```bash
sf org:create:snapshot [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-d, --description`

Description of snapshot.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --name`

Unique name of snapshot.

- **Type**: option
- **Required**: Yes

### `-o, --source-org`

ID or locally authenticated username or alias of scratch org to snapshot.

- **Type**: option
- **Required**: Yes

### `-v, --target-dev-hub`

Username or alias of the Dev Hub org. Not required if the `target-dev-hub` configuration variable is already set.

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

Create a snapshot called "Dependencies" using the source scratch org ID and your default Dev Hub org:
sf org:create:snapshot --source-org 00Dxx0000000000 --name Dependencies --description 'Contains PackageA v1.1.0'

Create a snapshot called "NightlyBranch" using the source scratch org username and a Dev Hub org with alias NightlyDevHub:
sf org:create:snapshot --source-org myuser@myorg --name NightlyBranch --description 'Contains PkgA v2.1.0 and PkgB 3.3.0' --target-dev-hub NightlyDevHub

## Aliases

- `force:org:snapshot:create`

## Alternative Syntaxes

- `sf create:org:snapshot`
- `sf create:snapshot:org`
- `sf org:snapshot:create`
- `sf snapshot:org:create`
- `sf snapshot:create:org`

## Plugin

**@salesforce/plugin-signups** (user)
