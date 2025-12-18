# org:list:auth

**List authorization information about the orgs you created or logged into.**

## Description

This command uses local authorization information that Salesforce CLI caches when you create a scratch org or log into an org. The command doesn't actually connect to the orgs to verify that they're still active. As a result, this command executes very quickly. If you want to view live information about your authorized orgs, such as their connection status, use the "org list" command.

## Usage

```bash
sf org:list:auth [flags]
```

## Flags

### Command Flags

### `--loglevel`

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

List local authorization information about your orgs:
sf org:list:auth

## Aliases

- `force:auth:list`
- `auth:list`

## Alternative Syntaxes

- `sf list:org:auth`
- `sf list:auth:org`
- `sf org:auth:list`
- `sf auth:org:list`
- `sf auth:list:org`

## Plugin

**@salesforce/plugin-auth** (core)
