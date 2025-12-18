# project:deploy:validate

**Validate a metadata deployment without actually executing it.**

## Description

Use this command to verify whether a deployment will succeed without actually deploying the metadata to your org. This command is similar to "sf project deploy start", except you're required to run Apex tests, and the command returns a job ID rather than executing the deployment. If the validation succeeds, then you pass this job ID to the "sf project deploy quick" command to actually deploy the metadata. This quick deploy takes less time because it skips running Apex tests. The job ID is valid for 10 days from when you started the validation. Validating first is useful if the deployment to your production org take several hours and you don’t want to risk a failed deploy.

You must run this command from within a project.

This command doesn't support source-tracking. When you quick deploy with the resulting job ID, the source you deploy overwrites the corresponding metadata in your org.

To validate the deployment of multiple metadata components, either set multiple --metadata <name> flags or a single --metadata flag with multiple names separated by spaces. Enclose names that contain spaces in one set of double quotes. The same syntax applies to --source-dir.

Note: Don't use this command on sandboxes; the command is intended to be used on production orgs. By default, sandboxes don't run tests during a deploy. If you want to validate a deployment with tests on a sandbox, use "sf project deploy start --dry-run --test-level RunLocalTests" instead.

## Usage

```bash
sf project:deploy:validate [flags]
```

## Flags

### Command Flags

### `-a, --api-version`

Target API version for the validation.

- **Type**: option

### `--async`

Run the command asynchronously.

- **Type**: boolean

### `--concise`

Show concise output of the validation result.

- **Type**: boolean

### `--coverage-formatters`

Format of the code coverage results.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-g, --ignore-warnings`

Ignore warnings and allow a deployment to complete successfully.

- **Type**: boolean

### `--junit`

Output JUnit test results.

- **Type**: boolean

### `-x, --manifest`

Full file path for manifest (package.xml) of components to validate for deployment.

- **Type**: option

### `-m, --metadata`

Metadata component names to validate for deployment.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `--metadata-dir`

Root of directory or zip file of metadata formatted files to deploy.

- **Type**: option

### `--post-destructive-changes`

File path for a manifest (destructiveChangesPost.xml) of components to delete after the deploy.

- **Type**: option

### `--pre-destructive-changes`

File path for a manifest (destructiveChangesPre.xml) of components to delete before the deploy

- **Type**: option

### `--purge-on-delete`

Specify that deleted components in the destructive changes manifest file are immediately eligible for deletion rather than being stored in the Recycle Bin.

- **Type**: boolean

### `--results-dir`

Output directory for code coverage and JUnit results; defaults to the deploy ID.

- **Type**: option

### `--single-package`

Indicates that the metadata zip file points to a directory structure for a single package.

- **Type**: boolean

### `-d, --source-dir`

Path to the local source files to validate for deployment.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-l, --test-level`

Deployment Apex testing level.

- **Type**: option
- **Default**: `RunLocalTests`

### `-t, --tests`

Apex tests to run when --test-level is RunSpecifiedTests.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `--verbose`

Show verbose output of the validation result.

- **Type**: boolean

### `-w, --wait`

Number of minutes to wait for the command to complete and display results.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

NOTE: These examples focus on validating large deployments. See the help for "sf project deploy start" for examples of deploying smaller sets of metadata which you can also use to validate.

Validate the deployment of all source files in the "force-app" directory to the default org:
sf project:deploy:validate --source-dir force-app

Validate the deployment of all source files in two directories: "force-app" and "force-app-utils":
sf project:deploy:validate --source-dir force-app --source-dir force-app-utils

Asynchronously validate the deployment and run all tests in the org with alias "my-prod-org"; command immediately returns the job ID:
sf project:deploy:validate --source-dir force-app --async --test-level RunAllTestsInOrg --target-org my-prod-org

Validate the deployment of all components listed in a manifest:
sf project:deploy:validate --manifest path/to/package.xml

## Aliases

- `deploy:metadata:validate`

## Alternative Syntaxes

- `sf deploy:project:validate`
- `sf deploy:validate:project`
- `sf project:validate:deploy`
- `sf validate:project:deploy`
- `sf validate:deploy:project`

## Plugin

**@salesforce/plugin-deploy-retrieve** (core)
