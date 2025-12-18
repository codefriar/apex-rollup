# project:deploy:start

**Deploy metadata to an org from your local project.**

## Description

You must run this command from within a project.

Metadata components are deployed in source format by default. Deploy them in metadata format by specifying the --metadata-dir flag, which specifies the root directory or ZIP file that contains the metadata formatted files you want to deploy.

If your org allows source tracking, then this command tracks the changes in your source. Some orgs, such as production orgs, never allow source tracking. Source tracking is enabled by default on scratch and sandbox orgs; you can disable source tracking when you create the orgs by specifying the --no-track-source flag on the "sf org create scratch|sandbox" commands.

To deploy multiple metadata components, either set multiple --metadata <name> flags or a single --metadata flag with multiple names separated by spaces. Enclose names that contain spaces in one set of double quotes. The same syntax applies to --source-dir.

## Usage

```bash
sf project:deploy:start [flags]
```

## Flags

### Command Flags

### `-a, --api-version`

Target API version for the deploy.

- **Type**: option

### `--async`

Run the command asynchronously.

- **Type**: boolean

### `--concise`

Show concise output of the deploy result.

- **Type**: boolean

### `--coverage-formatters`

Format of the code coverage results.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `--dry-run`

Validate deploy and run Apex tests but don’t save to the org.

- **Type**: boolean

### `-c, --ignore-conflicts`

Ignore conflicts and deploy local files, even if they overwrite changes in the org.

- **Type**: boolean

### `-r, --ignore-errors`

Ignore any errors and don’t roll back deployment.

- **Type**: boolean

### `-g, --ignore-warnings`

Ignore warnings and allow a deployment to complete successfully.

- **Type**: boolean

### `--junit`

Output JUnit test results.

- **Type**: boolean

### `-x, --manifest`

Full file path for manifest (package.xml) of components to deploy.

- **Type**: option

### `-m, --metadata`

Metadata component names to deploy. Wildcards (`*` ) supported as long as you use quotes, such as `ApexClass:MyClass*`.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `--metadata-dir`

Root of directory or zip file of metadata formatted files to deploy.

- **Type**: option

### `--post-destructive-changes`

File path for a manifest (destructiveChangesPost.xml) of components to delete after the deploy.

- **Type**: option

### `--pre-destructive-changes`

File path for a manifest (destructiveChangesPre.xml) of components to delete before the deploy.

- **Type**: option

### `--purge-on-delete`

Specify that deleted components in the destructive changes manifest file are immediately eligible for deletion rather than being stored in the Recycle Bin.

- **Type**: boolean

### `--results-dir`

Output directory for code coverage and JUnit results; defaults to the deploy ID.

- **Type**: option

### `--single-package`

Indicates that the metadata zip file points to a directory structure for a single package.

- **Type**: boolean

### `-d, --source-dir`

Path to the local source files to deploy.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-l, --test-level`

Deployment Apex testing level.

- **Type**: option

### `-t, --tests`

Apex tests to run when --test-level is RunSpecifiedTests.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `--verbose`

Show verbose output of the deploy result.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for command to complete and display results.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Deploy local changes not in the org; uses your default org:
sf project:deploy:start

Deploy all source files in the "force-app" directory to an org with alias "my-scratch"; show only concise output, in other words don't print a list of all the source that was deployed:
sf project:deploy:start --source-dir force-app --target-org my-scratch --concise

Deploy all the Apex classes and custom objects that are in the "force-app" directory. The list views, layouts, etc, that are associated with the custom objects are also deployed. Both examples are equivalent:
sf project:deploy:start --source-dir force-app/main/default/classes force-app/main/default/objects
sf project:deploy:start --source-dir force-app/main/default/classes --source-dir force-app/main/default/objects

Deploy all Apex classes that are in all package directories defined in the "sfdx-project.json" file:
sf project:deploy:start --metadata ApexClass

Deploy a specific Apex class; ignore any conflicts between the local project and org (be careful with this flag, because it will overwrite the Apex class in the org if there are conflicts!):
sf project:deploy:start --metadata ApexClass:MyApexClass --ignore-conflicts

Deploy specific Apex classes that match a pattern; in this example, deploy Apex classes whose names contain the string "MyApex". Also ignore any deployment warnings (again, be careful with this flag! You typically want to see the warnings):
sf project:deploy:start --metadata 'ApexClass:MyApex\*' --ignore-warnings

Deploy a custom object called ExcitingObject that's in the SBQQ namespace:
sf project:deploy:start --metadata CustomObject:SBQQ\_\_ExcitingObject

Deploy all custom objects in the SBQQ namespace by using a wildcard and quotes:
sf project:deploy:start --metadata 'CustomObject:SBQQ\_\_\*'

Deploy all custom objects and Apex classes found in all defined package directories (both examples are equivalent):
sf project:deploy:start --metadata CustomObject ApexClass
sf project:deploy:start --metadata CustomObject --metadata ApexClass

Deploy all Apex classes and a profile that has a space in its name:
sf project:deploy:start --metadata ApexClass --metadata "Profile:My Profile"

Deploy all components listed in a manifest:
sf project:deploy:start --manifest path/to/package.xml

Run the tests that aren’t in any managed packages as part of a deployment:
sf project:deploy:start --metadata ApexClass --test-level RunLocalTests

Deploy all metadata formatted files in the "MDAPI" directory:
sf project:deploy:start --metadata-dir MDAPI

Deploy all metadata formatted files in the "MDAPI" directory; items listed in the MDAPI/destructiveChangesPre.xml and MDAPI/destructiveChangesPost.xml manifests are immediately eligible for deletion rather than stored in the Recycle Bin:
sf project:deploy:start --metadata-dir MDAPI --purge-on-delete

## Aliases

- `deploy:metadata`

## Alternative Syntaxes

- `sf deploy:project:start`
- `sf deploy:start:project`
- `sf project:start:deploy`
- `sf start:project:deploy`
- `sf start:deploy:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
