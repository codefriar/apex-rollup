# org:enable:tracking

**Allow Salesforce CLI to track changes in your source files between your project and an org.**

## Description

Enabling source tracking has no direct effect on the org, it affects only your local environment. Specifically, Salesforce CLI stores the setting in the org's local configuration file so that source tracking operations are executed when working with the org.

This command throws an error if the org doesn't support tracking. Examples of orgs that don't support source tracking include Developer Edition orgs, production orgs, Partial Copy sandboxes, and Full sandboxes.

## Usage

```bash
sf org:enable:tracking [flags]
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

Enable source tracking for an org with alias "myscratch":
sf org:enable:tracking --target-org myscratch

Enable source tracking for an org using a username:
sf org:enable:tracking --target-org you@example.com

Enable source tracking for your default org:
sf org:enable:tracking

## Alternative Syntaxes

- `sf enable:org:tracking`
- `sf enable:tracking:org`
- `sf org:tracking:enable`
- `sf tracking:org:enable`
- `sf tracking:enable:org`

## Plugin

**@salesforce/plugin-org** (core)
