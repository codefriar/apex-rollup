# community:list:template

**Retrieve the list of templates available in your org.**

## Description

See 'Which Experience Cloud Template Should I Use?' (https://help.salesforce.com/s/articleView?id=sf.siteforce_commtemp_intro.htm&type=5) in Salesforce Help for more information about the different template types available for Experience Cloud.

## Usage

```bash
sf community:list:template [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

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

Retrieve the template list from an org with alias my-scratch-org:
sf community:list:template --target-org my-scratch-org

## Aliases

- `force:community:template:list`

## Alternative Syntaxes

- `sf list:community:template`
- `sf list:template:community`
- `sf community:template:list`
- `sf template:community:list`
- `sf template:list:community`

## Plugin

**@salesforce/plugin-community** (jit)
