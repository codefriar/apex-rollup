# project:generate

**Generate a Salesforce DX project.**

## Description

A Salesforce DX project has a specific structure and a configuration file (sfdx-project.json) that identifies the directory as a Salesforce DX project. This command generates the necessary configuration files and directories to get you started.

By default, the generated sfdx-project.json file sets the sourceApiVersion property to the default API version currently used by Salesforce CLI. To specify a different version, set the apiVersion configuration variable. For example: "sf config set apiVersion=57.0 --global".

## Usage

```bash
sf project:generate [flags]
```

## Flags

### Command Flags

### `--api-version`

Will set this version as sourceApiVersion in the sfdx-project.json file

- **Type**: option

### `-p, --default-package-dir`

Default package directory name.

- **Type**: option
- **Default**: `force-app`

### `-l, --login-url`

Salesforce instance login URL.

- **Type**: option
- **Default**: `https://login.salesforce.com`

### `--loglevel`

- **Type**: option

### `-x, --manifest`

Generate a manifest (package.xml) for change-set based development.

- **Type**: boolean

### `-n, --name`

Name of the generated project.

- **Type**: option
- **Required**: Yes

### `-s, --namespace`

Namespace associated with this project and any connected scratch orgs.

- **Type**: option

### `-d, --output-dir`

Directory for saving the created files.

- **Type**: option
- **Default**: `.`

### `-t, --template`

Template to use for project creation.

- **Type**: option
- **Default**: `standard`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Generate a project called "mywork":
sf project:generate --name mywork

Similar to previous example, but generate the files in a directory called "myapp":
sf project:generate --name mywork --default-package-dir myapp

Similar to prevoius example, but also generate a default package.xml manifest file:
sf project:generate --name mywork --default-package-dir myapp --manifest

Generate a project with the minimum files and directories:
sf project:generate --name mywork --template empty

## Aliases

- `force:project:create`

## Alternative Syntaxes

- `sf generate:project`

## Plugin

**@salesforce/plugin-templates** (core)
