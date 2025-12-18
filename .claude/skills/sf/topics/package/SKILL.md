---
name: sf-package
description: Salesforce CLI commands for package management including creating packages, managing versions, installing and uninstalling packages, and working with package dependencies.
---

# sf package

**Topic for package-related operations**

## Overview

This topic contains 25 command(s) related to package operations in Salesforce.

## Commands

### [package:convert](./convert.md)

Convert a managed-released first-generation managed package into a second-generation managed package.

### [package:create](./create.md)

Create a package.

### [package:delete](./delete.md)

Delete a package.

### [package:install](./install.md)

Install or upgrade a version of a package in the target org.

### [package:install:report](./install-report.md)

Retrieve the status of a package installation request.

### [package:installed:list](./installed-list.md)

List the org’s installed packages.

### [package:list](./list.md)

List all packages in the Dev Hub org.

### [package:push-upgrade:abort](./push-upgrade-abort.md)

Abort a package push upgrade that has been scheduled. Only push upgrade requests with a status of Created or Pending can be aborted.

### [package:push-upgrade:list](./push-upgrade-list.md)

Lists the status of push upgrade requests for a given package.

### [package:push-upgrade:report](./push-upgrade-report.md)

Retrieve the status of a package push upgrade.

### [package:push-upgrade:schedule](./push-upgrade-schedule.md)

Schedule a package push upgrade.

### [package:uninstall](./uninstall.md)

Uninstall a second-generation package from the target org.

### [package:uninstall:report](./uninstall-report.md)

Retrieve the status of a package uninstall request.

### [package:update](./update.md)

Update package details.

### [package:version:create](./version-create.md)

Create a package version in the Dev Hub org.

### [package:version:create:list](./version-create-list.md)

List package version creation requests.

### [package:version:create:report](./version-create-report.md)

Retrieve details about a package version creation request.

### [package:version:delete](./version-delete.md)

Delete a package version.

### [package:version:displayancestry](./version-displayancestry.md)

Display the ancestry tree for a 2GP managed package version.

### [package:version:displaydependencies](./version-displaydependencies.md)

Display the dependency graph for an unlocked or 2GP managed package version.

### [package:version:list](./version-list.md)

List all package versions in the Dev Hub org.

### [package:version:promote](./version-promote.md)

Promote a package version to released.

### [package:version:report](./version-report.md)

Retrieve details about a package version in the Dev Hub org.

### [package:version:retrieve](./version-retrieve.md)

Retrieve package metadata for a specified package version. Package metadata can be retrieved for second-generation managed package versions or unlocked packages only.

### [package:version:update](./version-update.md)

Update a package version.

## Quick Reference

```bash
sf package:convert
sf package:create
sf package:delete
sf package:install
sf package:install:report
sf package:installed:list
sf package:list
sf package:push-upgrade:abort
sf package:push-upgrade:list
sf package:push-upgrade:report
sf package:push-upgrade:schedule
sf package:uninstall
sf package:uninstall:report
sf package:update
sf package:version:create
sf package:version:create:list
sf package:version:create:report
sf package:version:delete
sf package:version:displayancestry
sf package:version:displaydependencies
sf package:version:list
sf package:version:promote
sf package:version:report
sf package:version:retrieve
sf package:version:update
```
