# project:retrieve:start

**Retrieve metadata from an org to your local project.**

## Description

You must run this command from within a project.

Metadata components are retrieved in source format by default. Retrieve them in metadata format by specifying the --target-metadata-dir flag, which retrieves the components into a ZIP file in the specified directory.

If your org allows source tracking, then this command tracks the changes in your source. Some orgs, such as production orgs, never allow source tracking. Source tracking is enabled by default on scratch and sandbox orgs; you can disable source tracking when you create the orgs by specifying the --no-track-source flag on the "sf org create scratch|sandbox" commands.

To retrieve multiple metadata components, either use multiple --metadata <name> flags or use a single --metadata flag with multiple names separated by spaces. Enclose names that contain spaces in one set of double quotes. The same syntax applies to --source-dir.

## Usage

```bash
sf project:retrieve:start [flags]
```

## Flags

### Command Flags

### `-a, --api-version`

Target API version for the retrieve.

- **Type**: option

### `-c, --ignore-conflicts`

Ignore conflicts and retrieve and save files to your local filesystem, even if they overwrite your local changes.

- **Type**: boolean

### `-x, --manifest`

File path for the manifest (package.xml) that specifies the components to retrieve.

- **Type**: option

### `-m, --metadata`

Metadata component names to retrieve. Wildcards (`*`) supported as long as you use quotes, such as `ApexClass:MyClass*`.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-r, --output-dir`

Directory root for the retrieved source files.

- **Type**: option

### `-n, --package-name`

Package names to retrieve. Use of this flag is for reference only; don't use it to retrieve packaged metadata for development.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `--single-package`

Indicates that the zip file points to a directory structure for a single package.

- **Type**: boolean

### `-d, --source-dir`

File paths for source to retrieve from the org.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-t, --target-metadata-dir`

Directory that will contain the retrieved metadata format files or ZIP.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-z, --unzip`

Extract all files from the retrieved zip file.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for the command to complete and display results to the terminal window.

- **Type**: option
- **Default**: `33 minutes`

### `--zip-file-name`

File name to use for the retrieved zip file.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Retrieve all remote changes from your default org:
sf project:retrieve:start

Retrieve the source files in the "force-app" directory from an org with alias "my-scratch":
sf project:retrieve:start --source-dir force-app --target-org my-scratch

Retrieve all the Apex classes and custom objects whose source is in the "force-app" directory. The list views, layouts, etc, that are associated with the custom objects are also retrieved. Both examples are equivalent:
sf project:retrieve:start --source-dir force-app/main/default/classes force-app/main/default/objects
sf project:retrieve:start --source-dir force-app/main/default/classes --source-dir force-app/main/default/objects

Retrieve all Apex classes that are in all package directories defined in the "sfdx-project.json" file:
sf project:retrieve:start --metadata ApexClass

Retrieve a specific Apex class; ignore any conflicts between the local project and org (be careful with this flag, because it will overwrite the Apex class source files in your local project if there are conflicts!):
sf project:retrieve:start --metadata ApexClass:MyApexClass --ignore-conflicts

Retrieve specific Apex classes that match a pattern; in this example, retrieve Apex classes whose names contain the string "MyApex":
sf project:retrieve:start --metadata 'ApexClass:MyApex\*'

Retrieve a custom object called ExcitingObject that's in the SBQQ namespace:
sf project:retrieve:start --metadata CustomObject:SBQQ\_\_ExcitingObject

Retrieve all custom objects in the SBQQ namespace by using a wildcard and quotes:
sf project:retrieve:start --metadata 'CustomObject:SBQQ\_\_\*'

Retrieve all list views for the Case standard object:
sf project:retrieve:start --metadata 'ListView:Case\*'

Retrieve all custom objects and Apex classes found in all defined package directories (both examples are equivalent):
sf project:retrieve:start --metadata CustomObject ApexClass
sf project:retrieve:start --metadata CustomObject --metadata ApexClass

Retrieve all metadata components listed in a manifest:
sf project:retrieve:start --manifest path/to/package.xml

Retrieve metadata from a package:
sf project:retrieve:start --package-name MyPackageName

Retrieve metadata from multiple packages, one of which has a space in its name (both examples are equivalent):
sf project:retrieve:start --package-name Package1 "PackageName With Spaces" Package3
sf project:retrieve:start --package-name Package1 --package-name "PackageName With Spaces" --package-name Package3

Retrieve the metadata components listed in the force-app directory, but retrieve them in metadata format into a ZIP file in the "output" directory:
sf project:retrieve:start --source-dir force-app --target-metadata-dir output

Retrieve in metadata format and automatically extract the contents into the "output" directory:
sf project:retrieve:start --source-dir force-app --target-metadata-dir output --unzip

## Aliases

- `retrieve:metadata`

## Alternative Syntaxes

- `sf retrieve:project:start`
- `sf retrieve:start:project`
- `sf project:start:retrieve`
- `sf start:project:retrieve`
- `sf start:retrieve:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
