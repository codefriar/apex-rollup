# update

## Description

update the sf CLI

## Usage

```bash
sf update [flags]
```

## Flags

### Command Flags

### `--autoupdate`

- **Type**: boolean

### `-a, --available`

See available versions.

- **Type**: boolean

### `--force`

Force a re-download of the requested version.

- **Type**: boolean

### `-i, --interactive`

Interactively select version to install. This is ignored if a channel is provided.

- **Type**: boolean

### `-b, --verbose`

Show more details about the available versions.

- **Type**: boolean

### `-v, --version`

Install a specific version.

- **Type**: option

## Examples

**Update to the stable channel:**

```bash
sf update stable
```

**Update to a specific version:**

```bash
sf update --version 1.0.0
```

**Interactively select version:**

```bash
sf update --interactive
```

**See available versions:**

```bash
sf update --available
```

## Plugin

**@oclif/plugin-update** (core)
