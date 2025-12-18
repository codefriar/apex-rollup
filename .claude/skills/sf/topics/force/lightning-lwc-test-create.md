# force:lightning:lwc:test:create

## Description

creates a Lightning web component test file with boilerplate code inside a **tests** directory.

## Usage

```bash
sf force:lightning:lwc:test:create [flags]
```

## Flags

### Command Flags

### `-f, --filepath`

path to Lightning web component .js file to create a test for

- **Type**: option
- **Required**: Yes

### `--loglevel`

logging level for this command invocation

- **Type**: option
- **Default**: `warn`

### Global Flags

### `--json`

format output as json

- **Type**: boolean

## Examples

$ sfdx force:lightning:lwc:test:create -f force-app/main/default/lwc/myButton/myButton.js

## Plugin

**@salesforce/sfdx-plugin-lwc-test** (jit)
