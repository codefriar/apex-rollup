# project:deploy:preview

**Preview a deployment to see what will deploy to the org, the potential conflicts, and the ignored files.**

## Description

You must run this command from within a project.

The command outputs a table that describes what will happen if you run the "sf project deploy start" command. The table lists the metadata components that will be deployed and deleted. The table also lists the current conflicts between files in your local project and components in the org. Finally, the table lists the files that won't be deployed because they're included in your .forceignore file.

If your org allows source tracking, then this command displays potential conflicts between the org and your local project. Some orgs, such as production org, never allow source tracking. Source tracking is enabled by default on scratch and sandbox orgs; you can disable source tracking when you create the orgs by specifying the --no-track-source flag on the "sf org create scratch|sandbox" commands.

To preview the deployment of multiple metadata components, either set multiple --metadata <name> flags or a single --metadata flag with multiple names separated by spaces. Enclose names that contain spaces in one set of double quotes. The same syntax applies to --source-dir.

## Usage

```bash
sf project:deploy:preview [flags]
```

## Flags

### Command Flags

### `--concise`

Show only the changes that will be deployed; omits files that are forceignored.

- **Type**: boolean

### `-c, --ignore-conflicts`

Don't display conflicts in preview of the deployment.

- **Type**: boolean

### `-x, --manifest`

Full file path for manifest (package.xml) of components to preview.

- **Type**: option

### `-m, --metadata`

Metadata component names to preview.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-d, --source-dir`

Path to the local source files to preview.

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

NOTE: The commands to preview a deployment and actually deploy it use similar flags. We provide a few preview examples here, but see the help for "sf project deploy start" for more examples that you can adapt for previewing.

Preview the deployment of source files in a directory, such as force-app, to your default org:
sf project:deploy:preview --source-dir force-app

Preview the deployment of all Apex classes to an org with alias "my-scratch":
sf project:deploy:preview --metadata ApexClass --target-org my-scratch

Preview deployment of a specific Apex class:
sf project:deploy:preview --metadata ApexClass:MyApexClass

Preview deployment of all components listed in a manifest:
sf project:deploy:preview --manifest path/to/package.xml

## Aliases

- `deploy:metadata:preview`

## Alternative Syntaxes

- `sf deploy:project:preview`
- `sf deploy:preview:project`
- `sf project:preview:deploy`
- `sf preview:project:deploy`
- `sf preview:deploy:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
