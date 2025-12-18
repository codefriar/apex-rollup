---
name: sf-org
description: Salesforce CLI commands for org management including authentication, creating and managing scratch orgs and sandboxes, user administration, and org configuration.
---

# sf org

**Topic for org-related operations**

## Overview

This topic contains 36 command(s) related to org operations in Salesforce.

## Commands

### [org:assign:permset](./assign-permset.md)

Assign a permission set to one or more org users.

### [org:assign:permsetlicense](./assign-permsetlicense.md)

Assign a permission set license to one or more org users.

### [org:create:sandbox](./create-sandbox.md)

Create a sandbox org.

### [org:create:scratch](./create-scratch.md)

Create a scratch org.

### [org:create:shape](./create-shape.md)

Create a scratch org configuration (shape) based on the specified source org.

### [org:create:snapshot](./create-snapshot.md)

Create a snapshot of a scratch org.

### [org:create:user](./create-user.md)

Create a user for a scratch org.

### [org:delete:sandbox](./delete-sandbox.md)

Delete a sandbox.

### [org:delete:scratch](./delete-scratch.md)

Delete a scratch org.

### [org:delete:shape](./delete-shape.md)

Delete all org shapes for a target org.

### [org:delete:snapshot](./delete-snapshot.md)

Delete a scratch org snapshot.

### [org:disable:tracking](./disable-tracking.md)

Prevent Salesforce CLI from tracking changes in your source files between your project and an org.

### [org:display](./display.md)

Display information about an org.

### [org:display:user](./display-user.md)

Display information about a Salesforce user.

### [org:enable:tracking](./enable-tracking.md)

Allow Salesforce CLI to track changes in your source files between your project and an org.

### [org:generate:password](./generate-password.md)

Generate a random password for scratch org users.

### [org:get:snapshot](./get-snapshot.md)

Get details about a scratch org snapshot.

### [org:list](./list.md)

List all orgs you’ve created or authenticated to.

### [org:list:auth](./list-auth.md)

List authorization information about the orgs you created or logged into.

### [org:list:limits](./list-limits.md)

Display information about limits in your org.

### [org:list:metadata](./list-metadata.md)

List the metadata components and properties of a specified type.

### [org:list:metadata-types](./list-metadata-types.md)

Display details about the metadata types that are enabled for your org.

### [org:list:shape](./list-shape.md)

List all org shapes you’ve created.

### [org:list:snapshot](./list-snapshot.md)

List scratch org snapshots.

### [org:list:sobject:record-counts](./list-sobject-record-counts.md)

Display record counts for the specified standard or custom objects.

### [org:list:users](./list-users.md)

List all locally-authenticated users of an org.

### [org:login:access-token](./login-access-token.md)

Authorize an org using an existing Salesforce access token.

### [org:login:jwt](./login-jwt.md)

Log in to a Salesforce org using a JSON web token (JWT).

### [org:login:sfdx-url](./login-sfdx-url.md)

Authorize an org using a Salesforce DX authorization URL stored in a file or through standard input (stdin).

### [org:login:web](./login-web.md)

Log in to a Salesforce org using the web server flow.

### [org:logout](./logout.md)

Log out of a Salesforce org.

### [org:open](./open.md)

Open your default scratch org, or another specified org, in a browser.

### [org:open:agent](./open-agent.md)

Open an agent in your org's Agent Builder UI in a browser.

### [org:refresh:sandbox](./refresh-sandbox.md)

Refresh a sandbox org using the sandbox name.

### [org:resume:sandbox](./resume-sandbox.md)

Check the status of a sandbox creation, and log in to it if it's ready.

### [org:resume:scratch](./resume-scratch.md)

Resume the creation of an incomplete scratch org.

## Quick Reference

```bash
sf org:assign:permset
sf org:assign:permsetlicense
sf org:create:sandbox
sf org:create:scratch
sf org:create:shape
sf org:create:snapshot
sf org:create:user
sf org:delete:sandbox
sf org:delete:scratch
sf org:delete:shape
sf org:delete:snapshot
sf org:disable:tracking
sf org:display
sf org:display:user
sf org:enable:tracking
sf org:generate:password
sf org:get:snapshot
sf org:list
sf org:list:auth
sf org:list:limits
sf org:list:metadata
sf org:list:metadata-types
sf org:list:shape
sf org:list:snapshot
sf org:list:sobject:record-counts
sf org:list:users
sf org:login:access-token
sf org:login:jwt
sf org:login:sfdx-url
sf org:login:web
sf org:logout
sf org:open
sf org:open:agent
sf org:refresh:sandbox
sf org:resume:sandbox
sf org:resume:scratch
```
