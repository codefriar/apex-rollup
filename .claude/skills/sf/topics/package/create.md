# package:create

**Create a package.**

## Description

First, use this command to create a package. Then create a package version.

If you don’t have a namespace defined in your sfdx-project.json file, use --no-namespace.

Your --name value must be unique within your namespace.

Run 'sf package list to list all packages in the Dev Hub org.

## Usage

```bash
sf package:create [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-d, --description`

Description of the package.

- **Type**: option

### `-o, --error-notification-username`

Active Dev Hub user designated to receive email notifications for package errors.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-n, --name`

Name of the package to create.

- **Type**: option
- **Required**: Yes

### `-e, --no-namespace`

Create the package with no namespace; available only for unlocked packages.

- **Type**: boolean

### `--org-dependent`

Depends on unpackaged metadata in the installation org; applies to unlocked packages only.

- **Type**: boolean

### `-t, --package-type`

Type of package.

- **Type**: option
- **Required**: Yes

### `-r, --path`

Path to directory that contains the contents of the package.

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

Create an unlocked package from the files in the "force-app" directory; uses your default Dev Hub org:
sf package:create --name MyUnlockedPackage --package-type Unlocked --path force-app

Create a managed packaged from the "force-app" directory files, give the package a description, and use the specified Dev Hub org:
sf package:create --name MyManagedPackage --description "Your Package Descripton" --package-type Managed --path force-app --target-dev-hub devhub@example.com

## Aliases

- `force:package:create`

## Alternative Syntaxes

- `sf create:package`

## Plugin

**@salesforce/plugin-packaging** (core)
