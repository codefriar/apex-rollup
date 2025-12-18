# dev:generate:flag

**Generate a flag for an existing command.**

## Description

You must run this command from within a plugin directory, such as the directory created with the "sf dev generate plugin" command.

This command is interactive. It first discovers all the commands currently implemented in the plugin, and asks you which you want to create a new flag for. It then prompts for other flag properties, such as its long name, optional short name, type, whether it's required, and so on. Long flag names must be kebab-case and not camelCase. The command doesn't let you use an existing long or short flag name. When the command completes, the Typescript file for the command is updated with the code for the new flag.

Use the --dry-run flag to review new code for the command file without actually updating it.

## Usage

```bash
sf dev:generate:flag [flags]
```

## Flags

### Command Flags

### `-d, --dry-run`

Print new flag code instead of adding it to the command file.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

Generate a new flag and update the command file:
sf dev:generate:flag

Don't actually update the command file, just view the generated code:
sf dev:generate:flag --dry-run

## Alternative Syntaxes

- `sf generate:dev:flag`
- `sf generate:flag:dev`
- `sf dev:flag:generate`
- `sf flag:dev:generate`
- `sf flag:generate:dev`

## Plugin

**@salesforce/plugin-dev** (user)
