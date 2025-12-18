# project:list:ignored

**Check your local project package directories for forceignored files.**

## Description

When deploying or retrieving metadata between your local project and an org, you can specify the source files you want to exclude with a .forceignore file. The .forceignore file structure mimics the .gitignore structure. Each line in .forceignore specifies a pattern that corresponds to one or more files. The files typically represent metadata components, but can be any files you want to exclude, such as LWC configuration JSON files or tests.

## Usage

```bash
sf project:list:ignored [flags]
```

## Flags

### Command Flags

### `-p, --source-dir`

File or directory of files that the command checks for foreceignored files.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

List all the files in all package directories that are ignored:
sf project:list:ignored

List all the files in a specific directory that are ignored:
sf project:list:ignored --source-dir force-app

Check if a particular file is ignored:
sf project:list:ignored --source-dir package.xml

## Aliases

- `force:source:ignored:list`

## Alternative Syntaxes

- `sf list:project:ignored`
- `sf list:ignored:project`
- `sf project:ignored:list`
- `sf ignored:project:list`
- `sf ignored:list:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
