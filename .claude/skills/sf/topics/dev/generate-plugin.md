# dev:generate:plugin

**Generate a new sf plugin.**

## Description

This command is interactive. You're prompted for information to populate your new plugin, such as its name, description, author, and percentage of code coverage you want. The command clones the 'salesforcecli/plugin-template-sf' GitHub repository, installs the plug-in's npm package dependencies using yarn install, and updates the package properties.

When the command completes, your new plugin contains the source, message, and test files for a sample "sf hello world" command.

## Usage

```bash
sf dev:generate:plugin [flags]
```

## Flags

### Command Flags

### `--dry-run`

Display the changes that would be made without writing them to disk.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

sf dev:generate:plugin

## Aliases

- `plugins:generate`

## Alternative Syntaxes

- `sf generate:dev:plugin`
- `sf generate:plugin:dev`
- `sf dev:plugin:generate`
- `sf plugin:dev:generate`
- `sf plugin:generate:dev`

## Plugin

**@salesforce/plugin-dev** (user)
