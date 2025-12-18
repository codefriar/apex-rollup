# dev:audit:messages

**Audit messages in a plugin's messages directory to locate unused messages and missing messages that have references in source code.**

## Usage

```bash
sf dev:audit:messages [flags]
```

## Flags

### Command Flags

### `-m, --messages-dir`

Directory that contains the plugin's message files.

- **Type**: option
- **Default**: `messages`

### `-p, --project-dir`

Location of the project where messages are to be audited.

- **Type**: option
- **Default**: `.`

### `-s, --source-dir`

Directory that contains the plugin's source code.

- **Type**: option
- **Default**: `src`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Audit messages using default directories:
sf dev:audit:messages

Audit messages in the "messages" directory in the current working directory; the plugin's source directory is in "src":
sf dev:audit:messages --messages-dir ./messages --source-dir ./src

## Alternative Syntaxes

- `sf audit:dev:messages`
- `sf audit:messages:dev`
- `sf dev:messages:audit`
- `sf messages:dev:audit`
- `sf messages:audit:dev`

## Plugin

**@salesforce/plugin-dev** (user)
