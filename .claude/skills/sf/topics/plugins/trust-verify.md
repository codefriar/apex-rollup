# plugins:trust:verify

**Validate a digital signature.**

## Description

Verifies the digital signature on an npm package matches the signature and key stored at the expected URLs.

## Usage

```bash
sf plugins:trust:verify [flags]
```

## Flags

### Command Flags

### `--loglevel`

- **Type**: option

### `-n, --npm`

Specify the npm name. This can include a tag/version.

- **Type**: option
- **Required**: Yes

### `-r, --registry`

The registry name. The behavior is the same as npm.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

sf plugins:trust:verify --npm @scope/npmName --registry https://npm.pkg.github.com

sf plugins:trust:verify --npm @scope/npmName

## Alternative Syntaxes

- `sf trust:plugins:verify`
- `sf trust:verify:plugins`
- `sf plugins:verify:trust`
- `sf verify:plugins:trust`
- `sf verify:trust:plugins`

## Plugin

**@salesforce/plugin-trust** (core)
