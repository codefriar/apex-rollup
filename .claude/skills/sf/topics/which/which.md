# which

## Description

Show which plugin a command is in.

## Usage

```bash
sf which [flags]
```

## Flags

### Global Flags

### `--json`

Format output as json.

- **Type**: boolean

## Examples

**See which plugin the `help` command is in:**

```bash
sf which help
```

**Use colon separators.**

```bash
sf which foo:bar:baz
```

**Use spaces as separators.**

```bash
sf which foo bar baz
```

**Wrap command in quotes to use spaces as separators.**

```bash
sf which "foo bar baz"
```

## Plugin

**@oclif/plugin-which** (core)
