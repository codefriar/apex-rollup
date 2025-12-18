# sobject:list

**List all Salesforce objects of a specified category.**

## Description

You can list the standard objects, custom objects, or all. The lists include only Salesforce objects, not Tooling API objects.

## Usage

```bash
sf sobject:list [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-s, --sobject`

Category of objects to list.

- **Type**: option
- **Default**: `ALL`

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

List all objects in your default org:
sf sobject:list --sobject all

List only custom objects in the org with alias "my-scratch-org":
sf sobject:list --sobject custom --target-org my-scratch-org

## Aliases

- `force:schema:sobject:list`

## Alternative Syntaxes

- `sf list:sobject`

## Plugin

**@salesforce/plugin-schema** (core)
