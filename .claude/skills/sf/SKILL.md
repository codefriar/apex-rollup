---
name: salesforce-cli
description: Comprehensive knowledge of Salesforce CLI (sf) commands for deploying metadata, running tests, managing orgs, querying data, and working with Salesforce development workflows. Includes 36 topics covering 212 commands.
---

# Salesforce CLI (sf)

## Overview

The Salesforce CLI (`sf`) is the official command-line interface for Salesforce development, built on the OCLIF framework. This skill provides comprehensive knowledge of all `sf` commands, organized hierarchically by topic and command.

## Purpose

Use this skill when you need to:

- Deploy or retrieve Salesforce metadata
- Run Apex tests and access test results
- Manage Salesforce orgs and authentication
- Query or manipulate data in Salesforce orgs
- Generate Salesforce metadata (classes, triggers, components)
- Configure and manage packages
- Debug Salesforce applications

## Structure

This skill is organized into:

### Core Concepts

- **[Core Concepts](./core-concepts.md)**: Fundamental patterns, global flags, and OCLIF conventions

### Topics (36 topics, 212 commands)

All topic-specific skills are located in `./topics/<topic-name>/`

Key topics include:

- **[project](./topics/project/)**: Deploy, retrieve, and convert metadata
- **[org](./topics/org/)**: Manage orgs, authentication, and org configuration
- **[apex](./topics/apex/)**: Run Apex code, tests, and manage logs
- **[data](./topics/data/)**: Import, export, and query data
- **[package](./topics/package/)**: Manage packages and package versions
- **[config](./topics/config/)**: Manage CLI configuration

### Workflows

Common multi-command patterns located in `./workflows/`:

- **[Deployment by File](./workflows/deployment-by-file.md)**
- **[Deployment by Type](./workflows/deployment-by-type.md)**
- **[Deployment with Tests](./workflows/deployment-with-tests.md)**
- **[Testing](./workflows/testing.md)**
- **[Debugging](./workflows/debugging.md)**

## Quick Reference

### Most Common Commands

```bash
# Deploy metadata
sf project deploy start -m ApexClass:MyClass -o my-org

# Deploy specific directory
sf project deploy start -d force-app/main/default/classes

# Retrieve metadata
sf project retrieve start -m ApexClass:MyClass

# Run Apex tests
sf apex test run -c -v -t MyClassTests

# List orgs
sf org list

# Get detailed help
sf <topic> <command> -h
```

### Global Flags

All commands support these global flags:

- `--json`: Output results as JSON
- `--help` or `-h`: Display help for the command
- `--flags-dir`: Import flag values from a directory

### Command Discovery

```bash
# List all available commands
sf commands

# List commands as JSON for parsing
sf commands --json

# Get detailed help for any command
sf <topic> <command> -h
```

## Navigation

For detailed information on a specific topic or command:

1. Navigate to `./topics/<topic-name>/SKILL.md` for topic overview
2. Navigate to `./topics/<topic-name>/<command-name>.md` for specific command details
3. Check `./workflows/` for common multi-command patterns

## Additional Resources

- Official Docs: https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/
- OCLIF Documentation: https://oclif.io/
- Salesforce DX Developer Guide: https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/
