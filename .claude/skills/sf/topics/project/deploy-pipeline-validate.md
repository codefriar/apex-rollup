# project:deploy:pipeline:validate

**Perform a validate-only deployment from a branch to the pipeline stage’s org.**

## Description

The first time you run any "project deploy pipeline" command, be sure to authorize the org in which DevOps Center is installed. The easiest way to authorize an org is with the "org login web" command.

A validation runs Apex tests to verify whether a deployment will succeed without actually deploying the metadata to your environment, so you can then quickly deploy the changes later without re-running the tests.

## Usage

```bash
sf project:deploy:pipeline:validate [flags]
```

## Flags

### Command Flags

### `--async`

Run the command asynchronously.

- **Type**: boolean

### `-b, --branch-name`

Name of the branch in the source control repository that corresponds to the pipeline stage that you want to deploy the changes to.

- **Type**: option
- **Required**: Yes

### `-v, --bundle-version-name`

Version name of the bundle.

- **Type**: option

### `--concise`

Show concise output of the command result.

- **Type**: boolean

### `-a, --deploy-all`

Deploy all metadata in the branch to the stage's org.

- **Type**: boolean

### `-p, --devops-center-project-name`

Name of the DevOps Center project.

- **Type**: option
- **Required**: Yes

### `-c, --devops-center-username`

Username or alias of the DevOps Center org.

- **Type**: option
- **Required**: Yes

### `-l, --test-level`

Deployment Apex testing level.

- **Type**: option

### `-t, --tests`

Apex tests to run when --test-level is RunSpecifiedTests.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `--verbose`

Show verbose output of the command result.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for command to complete and display results.

- **Type**: option
- **Default**: `33 minutes`

### Global Flags

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Perform a validate-only deployment from the Staging branch to the Staging environment (sandbox):
sf project:deploy:pipeline:validate --devops-center-project-name “Recruiting App” --branch-name staging --devops-center-username MyStagingSandbox

Perform a validate-only deployment of all changes from the main branch to the release environment:
sf project:deploy:pipeline:validate --devops-center-project-name “Recruiting App” --branch-name main --devops-center-username MyReleaseOrg --deploy-all

## Plugin

**@salesforce/plugin-devops-center** (jit)
