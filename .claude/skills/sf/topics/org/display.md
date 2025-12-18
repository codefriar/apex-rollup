# org:display

**Display information about an org.**

## Description

Output includes your access token, client Id, connected status, org ID, instance URL, username, and alias, if applicable.

Use --verbose to include the SFDX auth URL. WARNING: The SFDX auth URL contains sensitive information, such as a refresh token that can be used to access an org. Don't share or distribute this URL or token.

Including --verbose displays the sfdxAuthUrl property only if you authenticated to the org using "org login web" (not "org login jwt").

## Usage

```bash
sf org:display [flags]
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

### `--verbose`

Display the sfdxAuthUrl property.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Display information about your default org:
$ sf org:display

Display information, including the sfdxAuthUrl property, about the org with alias TestOrg1:
$ sf org:display --target-org TestOrg1 --verbose

## Aliases

- `force:org:display`

## Alternative Syntaxes

- `sf display:org`

## Plugin

**@salesforce/plugin-org** (core)
