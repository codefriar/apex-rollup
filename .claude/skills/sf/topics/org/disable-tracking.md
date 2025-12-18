# org:disable:tracking

**Prevent Salesforce CLI from tracking changes in your source files between your project and an org.**

## Description

Disabling source tracking has no direct effect on the org, it affects only your local environment. Specifically, Salesforce CLI stores the setting in the org's local configuration file so that no source tracking operations are executed when working with the org.

## Usage

```bash
sf org:disable:tracking [flags]
```

## Flags

### Command Flags

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

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

Disable source tracking for an org with alias "myscratch":
sf org:disable:tracking --target-org myscratch

Disable source tracking for an org using a username:
sf org:disable:tracking --target-org you@example.com

Disable source tracking for your default org:
sf org:disable:tracking

## Alternative Syntaxes

- `sf disable:org:tracking`
- `sf disable:tracking:org`
- `sf org:tracking:disable`
- `sf tracking:org:disable`
- `sf tracking:disable:org`

## Plugin

**@salesforce/plugin-org** (core)
