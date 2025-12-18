# org:open

**Open your default scratch org, or another specified org, in a browser.**

## Description

To open a specific page, specify the portion of the URL after "https://mydomain.my.salesforce.com" as the value for the --path flag. For example, specify "--path lightning" to open Lightning Experience, or specify "--path /apex/YourPage" to open a Visualforce page.

Use the --source-file flag to open ApexPage, FlexiPage, Flow, or Agent metadata from your local project in the associated Builder within the Org.

To generate a URL but not launch it in your browser, specify --url-only.

To open in a specific browser, use the --browser flag. Supported browsers are "chrome", "edge", and "firefox". If you don't specify --browser, the org opens in your default browser.

## Usage

```bash
sf org:open [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-b, --browser`

Browser where the org opens.

- **Type**: option

### `--loglevel`

- **Type**: option

### `-p, --path`

Navigation URL path to open a specific page.

- **Type**: option

### `--private`

Open the org in the default browser using private (incognito) mode.

- **Type**: boolean

### `-f, --source-file`

Path to ApexPage, FlexiPage, Flow, or Agent metadata to open in the associated Builder.

- **Type**: option

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

Open your default org in your default browser:
$ sf org:open

Open your default org in an incognito window of your default browser:
$ sf org:open --private

Open the org with alias MyTestOrg1 in the Firefox browser:
$ sf org:open --target-org MyTestOrg1 --browser firefox

Display the navigation URL for the Lightning Experience page for your default org, but don't open the page in a browser:
$ sf org:open --url-only --path lightning

Open a local Lightning page in your default org's Lightning App Builder:
$ sf org:open --source-file force-app/main/default/flexipages/Hello.flexipage-meta.xml

Open a local Flow in Flow Builder:
$ sf org:open --source-file force-app/main/default/flows/Hello.flow-meta.xml

Open local Agent metadata (Bot) in Agent Builder:
$ sf org:open --source-file force-app/main/default/bots/Coral_Cloud_Agent/Coral_Cloud_Agent.bot-meta.xml

## Aliases

- `force:org:open`
- `force:source:open`

## Alternative Syntaxes

- `sf open:org`

## Plugin

**@salesforce/plugin-org** (core)
