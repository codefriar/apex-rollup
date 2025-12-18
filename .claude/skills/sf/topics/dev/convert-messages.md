# dev:convert:messages

**Convert a .json messages file into Markdown.**

## Description

Preserves the filename and the original messages file, then creates a new file with the Markdown extension and standard headers for the command and flag summaries, descriptions, and so on. After you review the new Markdown file, delete the old .json file.

## Usage

```bash
sf dev:convert:messages [flags]
```

## Flags

### Command Flags

### `-f, --file-name`

Filename to convert.

- **Type**: option
- **Required**: Yes
- **Multiple**: Can be specified multiple times

### `-p, --project-dir`

Location of the project whose messages are to be converted.

- **Type**: option
- **Default**: `.`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Convert the my-command.json message file into my-command.md with the standard messages headers:
sf dev:convert:messages --filename my-command.json

Similar to previous example, but specify the plugin project directory:

sf dev:convert:messages --project-dir ./path/to/plugin --filename my-command.json

## Alternative Syntaxes

- `sf convert:dev:messages`
- `sf convert:messages:dev`
- `sf dev:messages:convert`
- `sf messages:dev:convert`
- `sf messages:convert:dev`

## Plugin

**@salesforce/plugin-dev** (user)
