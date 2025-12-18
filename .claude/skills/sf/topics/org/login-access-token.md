# org:login:access-token

**Authorize an org using an existing Salesforce access token.**

## Description

By default, the command runs interactively and asks you for the access token. If you previously authorized the org, the command prompts whether you want to overwrite the local file. Specify --no-prompt to not be prompted.

To use the command in a CI/CD script, set the SF_ACCESS_TOKEN environment variable to the access token. Then run the command with the --no-prompt parameter.

## Usage

```bash
sf org:login:access-token [flags]
```

## Flags

### Command Flags

### `-a, --alias`

Alias for the org.

- **Type**: option

### `-r, --instance-url`

URL of the instance that the org lives on.

- **Type**: option
- **Required**: Yes

### `--loglevel`

- **Type**: option

### `-p, --no-prompt`

Don't prompt for confirmation.

- **Type**: boolean

### `-s, --set-default`

Set the authenticated org as the default that all org-related commands run against.

- **Type**: boolean

### `-d, --set-default-dev-hub`

Set the authenticated org as the default Dev Hub.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Authorize an org on https://mycompany.my.salesforce.com; the command prompts you for the access token:
sf org:login:access-token --instance-url https://mycompany.my.salesforce.com

Authorize the org without being prompted; you must have previously set the SF_ACCESS_TOKEN environment variable to the access token:
sf org:login:access-token --instance-url https://dev-hub.my.salesforce.com --no-prompt

## Aliases

- `force:auth:accesstoken:store`
- `auth:accesstoken:store`

## Alternative Syntaxes

- `sf login:org:access-token`
- `sf login:access-token:org`
- `sf org:access-token:login`
- `sf access-token:org:login`
- `sf access-token:login:org`

## Plugin

**@salesforce/plugin-auth** (core)
