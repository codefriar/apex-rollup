# cf:build:scratch:step1

**Create or identify a scratch org for deployment.**

## Description

This command creates a new scratch org or identifies an existing one with the specified alias. It intelligently checks for existing orgs before attempting creation and provides interactive confirmation for scratch org parameters. If an org with the specified alias already exists and is accessible, creation will be skipped.

## Usage

```bash
sf cf:build:scratch:step1 [flags]
```

## Flags

### Command Flags

### `-a, --alias`

Alias for the scratch org.

- **Type**: option
- **Default**: `scratchDev`

### `-y, --duration-days`

Duration in days for the scratch org.

- **Type**: option
- **Default**: `5`

### `-f, --file`

Scratch org definition file.

- **Type**: option
- **Default**: `config/project-scratch-def-shape.json`

### `--no-prompt`

Skip interactive prompts.

- **Type**: boolean

### `-o, --target-dev-hub`

Dev Hub org to use for scratch org creation.

- **Type**: option
- **Default**: `test-3gw4ptpcb9b4@example.com`

### `-w, --wait`

Number of minutes to wait for org creation

- **Type**: option
- **Default**: `5`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Create a scratch org with default settings:
sf cf:build:scratch:step1

Create a scratch org with custom alias and duration:
sf cf:build:scratch:step1 --alias myOrg --duration-days 7

Create a scratch org with custom definition file:
sf cf:build:scratch:step1 --file config/custom-scratch-def.json

Create a scratch org without interactive prompts:
sf cf:build:scratch:step1 --no-prompt

## Alternative Syntaxes

- `sf build:cf:scratch:step1`
- `sf build:scratch:cf:step1`
- `sf build:scratch:step1:cf`
- `sf cf:scratch:build:step1`
- `sf scratch:cf:build:step1`
- `sf scratch:build:cf:step1`
- `sf scratch:build:step1:cf`
- `sf cf:scratch:step1:build`
- `sf scratch:cf:step1:build`
- `sf scratch:step1:cf:build`
- `sf scratch:step1:build:cf`
- `sf cf:build:step1:scratch`
- `sf build:cf:step1:scratch`
- `sf build:step1:cf:scratch`
- `sf build:step1:scratch:cf`
- `sf cf:step1:build:scratch`
- `sf step1:cf:build:scratch`
- `sf step1:build:cf:scratch`
- `sf step1:build:scratch:cf`
- `sf cf:step1:scratch:build`
- `sf step1:cf:scratch:build`
- `sf step1:scratch:cf:build`
- `sf step1:scratch:build:cf`

## Plugin

**codefriar-utils** (link)
