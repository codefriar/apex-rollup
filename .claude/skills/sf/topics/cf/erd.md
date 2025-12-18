# cf:erd

**Generate an Entity Relationship Diagram (ERD) from local Salesforce metadata using Mermaid syntax.**

## Description

Analyzes local SFDX project metadata to create an Entity Relationship Diagram starting from a specified object. Traverses relationships up to a configurable depth (default: 10 levels) and outputs a Mermaid-formatted ERD to a markdown file. Supports limiting traversal depth for specific objects to prevent diagram complexity.

## Usage

```bash
sf cf:erd [flags]
```

## Flags

### Command Flags

### `-f, --include-fields`

Include field details in the ERD.

- **Type**: boolean

### `-n, --include-namespaced`

Include namespaced objects in the ERD.

- **Type**: boolean

### `-d, --max-depth`

Maximum relationship traversal depth.

- **Type**: option
- **Default**: `10`

### `-u, --output`

Output file path for the ERD.

- **Type**: option

### `-l, --shallow-objects`

Objects to limit to single-level traversal.

- **Type**: option

### `-a, --show-attributes`

Show object fields as attributes in the ERD.

- **Type**: boolean

### `-s, --source-object`

The starting object for ERD generation.

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

Generate ERD starting from Account object: sf cf:erd --source-object Account

Generate ERD with custom depth and shallow objects: sf cf:erd --source-object Contact --max-depth 5 --shallow-objects Account,User

Generate ERD with object attributes: sf cf:erd --source-object Contract\_\_c --show-attributes

Generate ERD including namespaced objects: sf cf:erd --source-object Account --include-namespaced

Generate ERD with custom output file: sf cf:erd --source-object Opportunity --output ./diagrams/sales-erd.md

## Alternative Syntaxes

- `sf erd:cf`

## Plugin

**codefriar-utils** (link)
