---
name: sf-project
description: Salesforce CLI commands for project operations including deploying and retrieving metadata, converting source formats, managing source tracking, and validating deployments.
---

# sf project

**Topic for project-related operations**

## Overview

This topic contains 23 command(s) related to project operations in Salesforce.

## Commands

### [project:convert:mdapi](./convert-mdapi.md)

Convert metadata retrieved via Metadata API into the source format used in Salesforce DX projects.

### [project:convert:source](./convert-source.md)

Convert source-formatted files into metadata that you can deploy using Metadata API.

### [project:convert:source-behavior](./convert-source-behavior.md)

Enable a behavior of your project source files, and then update your Salesforce DX project to implement the behavior.

### [project:delete:source](./delete-source.md)

Delete source from your project and from a non-source-tracked org.

### [project:delete:tracking](./delete-tracking.md)

Delete all local source tracking information.

### [project:deploy:cancel](./deploy-cancel.md)

Cancel a deploy operation.

### [project:deploy:pipeline:quick](./deploy-pipeline-quick.md)

Quickly deploy a validated deployment to an org.

### [project:deploy:pipeline:report](./deploy-pipeline-report.md)

Check the status of a pipeline deploy operation.

### [project:deploy:pipeline:resume](./deploy-pipeline-resume.md)

Resume watching a pipeline deploy operation.

### [project:deploy:pipeline:start](./deploy-pipeline-start.md)

Deploy changes from a branch to the pipeline stage’s org.

### [project:deploy:pipeline:validate](./deploy-pipeline-validate.md)

Perform a validate-only deployment from a branch to the pipeline stage’s org.

### [project:deploy:preview](./deploy-preview.md)

Preview a deployment to see what will deploy to the org, the potential conflicts, and the ignored files.

### [project:deploy:quick](./deploy-quick.md)

Quickly deploy a validated deployment to an org.

### [project:deploy:report](./deploy-report.md)

Check or poll for the status of a deploy operation.

### [project:deploy:resume](./deploy-resume.md)

Resume watching a deploy operation and update source tracking when the deploy completes.

### [project:deploy:start](./deploy-start.md)

Deploy metadata to an org from your local project.

### [project:deploy:validate](./deploy-validate.md)

Validate a metadata deployment without actually executing it.

### [project:generate](./generate.md)

Generate a Salesforce DX project.

### [project:generate:manifest](./generate-manifest.md)

Create a project manifest that lists the metadata components you want to deploy or retrieve.

### [project:list:ignored](./list-ignored.md)

Check your local project package directories for forceignored files.

### [project:reset:tracking](./reset-tracking.md)

Reset local and remote source tracking.

### [project:retrieve:preview](./retrieve-preview.md)

Preview a retrieval to see what will be retrieved from the org, the potential conflicts, and the ignored files.

### [project:retrieve:start](./retrieve-start.md)

Retrieve metadata from an org to your local project.

## Quick Reference

```bash
sf project:convert:mdapi
sf project:convert:source
sf project:convert:source-behavior
sf project:delete:source
sf project:delete:tracking
sf project:deploy:cancel
sf project:deploy:pipeline:quick
sf project:deploy:pipeline:report
sf project:deploy:pipeline:resume
sf project:deploy:pipeline:start
sf project:deploy:pipeline:validate
sf project:deploy:preview
sf project:deploy:quick
sf project:deploy:report
sf project:deploy:resume
sf project:deploy:start
sf project:deploy:validate
sf project:generate
sf project:generate:manifest
sf project:list:ignored
sf project:reset:tracking
sf project:retrieve:preview
sf project:retrieve:start
```
