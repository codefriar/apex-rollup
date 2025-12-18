# code-analyzer:rules

**List the rules that are available to analyze your code.**

## Description

You can also view details about the rules, such as the engine it's associated with, tags, and description.

Use this command to determine the exact set of rules to analyze your code. The `code-analyzer run` command has similar flags as this command, so once you've determined the flag values for this command that list the rules you want to run, you specify the same values to the `code-analyzer run` command.

We're continually improving Salesforce Code Analyzer. Tell us what you think! Give feedback at https://sfdc.co/CodeAnalyzerFeedback.

## Usage

```bash
sf code-analyzer:rules [flags]
```

## Flags

### Command Flags

### `-c, --config-file`

Path to the configuration file used to customize the engines and rules.

- **Type**: option

### `-f, --output-file`

Name of the file where the selected rules are written. The file format depends on the extension you specify; the currently supported extensions are .json and .csv

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-r, --rule-selector`

Selection of rules, based on engine name, severity level, rule name, tag, or a combination of criteria separated by colons.

- **Type**: option
- **Multiple**: Can be specified multiple times
- **Default**: `['Recommended']`

### `-t, --target`

Subset of files within your workspace that you want to target for analysis.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-v, --view`

Format to display the rules in the terminal.

- **Type**: option

### `-w, --workspace`

Set of files that make up your workspace.

- **Type**: option
- **Multiple**: Can be specified multiple times

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

List rules using the default behavior: include rules from all engines that have a "Recommended" tag; display the rules using concise table format; and automatically apply rule or engine overrides if a `code-analyzer.yml` or `code-analyzer.yaml` file exists in the current folder:
sf code-analyzer:rules

The previous example is equivalent to this example:
sf code-analyzer:rules --rule-selector Recommended --view table --config-file ./code-analyzer.yml

List the recommended rules for the "eslint" engine:
sf code-analyzer:rules --rule-selector eslint:Recommended

List all the rules for the "eslint" engine:
sf code-analyzer:rules --rule-selector eslint

The previous example is equivalent to this example:
sf code-analyzer:rules --rule-selector eslint:all

List the details about all rules for all engines; also write the rules in JSON format to a file called "rules.json" in the "out" folder, which must already exist:
sf code-analyzer:rules --rule-selector all --output-file ./out/rules.json --view detail

Get a more accurate list of the rules that apply specifically to your workspace (all the files in the current folder):
sf code-analyzer:rules --rule-selector all --workspace .

List the recommended rules associated with a workspace that targets all the files in the folder "./other-source" and only the Apex class files (extension .cls) under the folder "./force-app":
sf code-analyzer:rules --rule-selector Recommended --workspace . --target ./other-source --target ./force-app/\*_/_.cls

List all the "eslint" engine rules that have a moderate severity (3) and the recommended "retire-js" engine rules with any severity:
sf code-analyzer:rules --rule-selector eslint:3 --rule-selector retire-js:Recommended

List all the "pmd" engine rules that have a severity of moderate (3) or high (2) and the "Performance" tag.
sf code-analyzer:rules --rule-selector "pmd:(2,3):Performance"

Similar to the previous example, but apply the rule overrides and engine settings from the configuration file called `code-analyzer2.yml` in the current folder. If, for example, you changed the severity of an "eslint" rule from moderate (3) to high (2) in the configuration file, then that rule isn't listed:
sf code-analyzer:rules --rule-selector eslint:3 --rule-selector retire-js:Recommended --config-file ./code-analyzer2.yml

List the details of the "getter-return" rule of the "eslint" engine and the rules named "no-inner-declarations" in any engine:
sf code-analyzer:rules --rule-selector eslint:getter-return --rule-selector no-inner-declarations --view detail

List the details of the recommended "eslint" engine rules that have the tag "problem" and high severity level (2) that apply when targeting the files within the folder "./force-app":
sf code-analyzer:rules --rule-selector eslint:Recommended:problem:2 --view detail --target ./force-app

## Alternative Syntaxes

- `sf rules:code-analyzer`

## Plugin

**@salesforce/plugin-code-analyzer** (user)
