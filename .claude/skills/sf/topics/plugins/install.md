# plugins:install

**Installs a plugin into sf.**

## Description

Uses npm to install plugins.

Installation of a user-installed plugin will override a core plugin.

Use the SF_NPM_LOG_LEVEL environment variable to set the npm loglevel.
Use the SF_NPM_REGISTRY environment variable to set the npm registry.

## Usage

```bash
sf plugins:install [flags]
```

## Flags

### Command Flags

### `-f, --force`

Force npm to fetch remote resources even if a local copy exists on disk.

- **Type**: boolean

### `-h, --help`

Show CLI help.

- **Type**: boolean

### `--jit`

- **Type**: boolean

### `-s, --silent`

Silences npm output.

- **Type**: boolean

### `-v, --verbose`

Show verbose npm output.

- **Type**: boolean

### Global Flags

### `--json`

Format output as json.

- **Type**: boolean

## Examples

**Install a plugin from npm registry.**

```bash
sf plugins:install [...]
```

**Install a plugin from a github url.**

```bash
sf plugins:install https://github.com/someuser/someplugin
```

**Install a plugin from a github slug.**

```bash
sf plugins:install someuser/someplugin
```

## Aliases

- `plugins:add`

## Alternative Syntaxes

- `sf install:plugins`

## Plugin

**@oclif/plugin-plugins** (core)
