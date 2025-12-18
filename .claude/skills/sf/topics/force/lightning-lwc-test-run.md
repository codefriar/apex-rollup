# force:lightning:lwc:test:run

## Description

invokes Lightning Web Components Jest unit tests.

## Usage

```bash
sf force:lightning:lwc:test:run [flags]
```

## Flags

### Command Flags

### `-d, --debug`

run tests in debug mode

- **Type**: boolean

### `--loglevel`

logging level for this command invocation

- **Type**: option
- **Default**: `warn`

### `--watch`

run tests in watch mode

- **Type**: boolean

### Global Flags

### `--json`

format output as json

- **Type**: boolean

## Examples

$ sfdx force:lightning:lwc:test:run

$ sfdx force:lightning:lwc:test:run -w

## Plugin

**@salesforce/sfdx-plugin-lwc-test** (jit)
