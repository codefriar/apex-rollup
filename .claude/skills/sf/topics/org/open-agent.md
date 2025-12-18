# org:open:agent

**Open an agent in your org's Agent Builder UI in a browser.**

## Description

Use the --api-name flag to open an agent using its API name in the Agent Builder UI of your org. To find the agent's API name, go to Setup in your org and navigate to the agent's details page.

To generate the URL but not launch it in your browser, specify --url-only.

To open Agent Builder in a specific browser, use the --browser flag. Supported browsers are "chrome", "edge", and "firefox". If you don't specify --browser, the org opens in your default browser.

## Usage

```bash
sf org:open:agent [flags]
```

## Flags

### Command Flags

### `-n, --api-name`

API name, also known as developer name, of the agent you want to open in the org's Agent Builder UI.

- **Type**: option
- **Required**: Yes

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-b, --browser`

Browser where the org opens.

- **Type**: option

### `--private`

Open the org in the default browser using private (incognito) mode.

- **Type**: boolean

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-r, --url-only`

Display navigation URL, but don’t launch browser.

- **Type**: boolean

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Open the agent with API name Coral_Cloud_Agent in your default org using your default browser:
$ sf org:open:agent --api-name Coral_Cloud_Agent

Open the agent in an incognito window of your default browser:
$ sf org:open:agent --private --api-name Coral_Cloud_Agent:

Open the agent in an org with alias MyTestOrg1 using the Firefox browser:
$ sf org:open:agent --target-org MyTestOrg1 --browser firefox --api-name Coral_Cloud_Agent

## Alternative Syntaxes

- `sf open:org:agent`
- `sf open:agent:org`
- `sf org:agent:open`
- `sf agent:org:open`
- `sf agent:open:org`

## Plugin

**@salesforce/plugin-org** (core)
