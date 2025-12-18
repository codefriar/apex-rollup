# org:list:sobject:record-counts

**Display record counts for the specified standard or custom objects.**

## Description

Use this command to get an approximate count of the records in standard or custom objects in your org. These record counts are the same as the counts listed in the Storage Usage page in the Setup UI. The record counts are approximate because they're calculated asynchronously and your org's storage usage isn't updated immediately. To display all available record counts, run the command without the --sobject flag.

## Usage

```bash
sf org:list:sobject:record-counts [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `--loglevel`

- **Type**: option

### `-s, --sobject`

API name of the standard or custom object for which to display record counts.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

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

Display all available record counts in your default org:
sf org:list:sobject:record-counts

Display record counts for the Account, Contact, Lead, and Opportunity objects in your default org:
sf org:list:sobject:record-counts --sobject Account --sobject Contact --sobject Lead --sobject Opportunity

Display record counts for the Account and Lead objects for the org with alias "my-scratch-org":
sf org:list:sobject:record-counts --sobject Account --sobject Lead --target-org my-scratch-org

## Aliases

- `force:limits:recordcounts:display`
- `limits:recordcounts:display`

## Alternative Syntaxes

- `sf list:org:sobject:record-counts`
- `sf list:sobject:org:record-counts`
- `sf list:sobject:record-counts:org`
- `sf org:sobject:list:record-counts`
- `sf sobject:org:list:record-counts`
- `sf sobject:list:org:record-counts`
- `sf sobject:list:record-counts:org`
- `sf org:sobject:record-counts:list`
- `sf sobject:org:record-counts:list`
- `sf sobject:record-counts:org:list`
- `sf sobject:record-counts:list:org`
- `sf org:list:record-counts:sobject`
- `sf list:org:record-counts:sobject`
- `sf list:record-counts:org:sobject`
- `sf list:record-counts:sobject:org`
- `sf org:record-counts:list:sobject`
- `sf record-counts:org:list:sobject`
- `sf record-counts:list:org:sobject`
- `sf record-counts:list:sobject:org`
- `sf org:record-counts:sobject:list`
- `sf record-counts:org:sobject:list`
- `sf record-counts:sobject:org:list`
- `sf record-counts:sobject:list:org`

## Plugin

**@salesforce/plugin-limits** (core)
