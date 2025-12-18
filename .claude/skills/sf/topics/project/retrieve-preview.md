# project:retrieve:preview

**Preview a retrieval to see what will be retrieved from the org, the potential conflicts, and the ignored files.**

## Description

You must run this command from within a project.

The command outputs a table that describes what will happen if you run the "sf project retrieve start" command. The table lists the metadata components that will be retrieved and deleted. The table also lists the current conflicts between files in your local project and components in the org. Finally, the table lists the files that won't be retrieved because they're included in your .forceignore file.

If your org allows source tracking, then this command displays potential conflicts between the org and your local project. Some orgs, such as production org, never allow source tracking. Source tracking is enabled by default on scratch and sandbox orgs; you can disable source tracking when you create the orgs by specifying the --no-track-source flag on the "sf org create scratch|sandbox" commands.

## Usage

```bash
sf project:retrieve:preview [flags]
```

## Flags

### Command Flags

### `--concise`

Show only the changes that will be retrieved; omits files that are forceignored.

- **Type**: boolean

### `-c, --ignore-conflicts`

Don't display conflicts in the preview of the retrieval.

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

Preview the retrieve of all changes from your default org:
sf project:retrieve:preview

Preview the retrieve when ignoring any conflicts from an org with alias "my-scratch":
sf project:retrieve:preview --ignore-conflicts --target-org my-scratch

## Aliases

- `retrieve:metadata:preview`

## Alternative Syntaxes

- `sf retrieve:project:preview`
- `sf retrieve:preview:project`
- `sf project:preview:retrieve`
- `sf preview:project:retrieve`
- `sf preview:retrieve:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
