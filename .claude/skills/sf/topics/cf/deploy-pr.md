# cf:deploy:pr

**Deploy a GitHub Pull Request to a Salesforce org**

## Description

Fetches changed files from a GitHub Pull Request and deploys them to a Salesforce org. The command intelligently identifies Salesforce metadata components, handles object parts, and can run in validation-only mode or perform actual deployment.

## Usage

```bash
sf cf:deploy:pr [flags]
```

## Flags

### Command Flags

### `--deploy`

Perform actual deployment (default is dry-run validation)

- **Type**: boolean

### `-p, --pr`

GitHub Pull Request number to deploy

- **Type**: option
- **Required**: Yes

### `--skip-tests`

Skip running tests altogether

- **Type**: boolean

### `-t, --target-org`

Salesforce org alias to deploy to

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

Validate PR #123 deployment to dev org:
sf cf:deploy:pr --pr 123 --target-org dev

Actually deploy PR #123 to dev org:
sf cf:deploy:pr --pr 123 --target-org dev --deploy

Deploy PR #123 without running tests:
sf cf:deploy:pr --pr 123 --target-org dev --deploy --skip-tests

## Alternative Syntaxes

- `sf deploy:cf:pr`
- `sf deploy:pr:cf`
- `sf cf:pr:deploy`
- `sf pr:cf:deploy`
- `sf pr:deploy:cf`

## Plugin

**codefriar-utils** (link)
