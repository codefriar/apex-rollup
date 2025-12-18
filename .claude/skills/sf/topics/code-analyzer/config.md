# code-analyzer:config

**Output the current state of configuration for Code Analyzer.**

## Description

Code Analyzer gives you the ability to configure settings that modify Code Analyzer's behavior, to override the tags and severity levels of rules, and to configure the engine specific settings. Use this command to see the current state of this configuration. You can also save this state to a YAML-formatted file that you can modify for your needs.

To apply a custom configuration with Code Analyzer, either keep your custom configuration settings in a `code-analyzer.yml` file located in the current folder from which you are executing commands, or specify the location of your custom configuration file to the Code Analyzer commands with the --config-file flag.

We're continually improving Salesforce Code Analyzer. Tell us what you think! Give feedback at https://sfdc.co/CodeAnalyzerFeedback.

## Usage

```bash
sf code-analyzer:config [flags]
```

## Flags

### Command Flags

### `-c, --config-file`

Path to the existing configuration file used to customize the engines and rules.

- **Type**: option

### `--include-unmodified-rules`

Include unmodified rules in the rule override settings.

- **Type**: boolean

### `-f, --output-file`

Output file to write the configuration state to. The file is written in YAML format.

- **Type**: option

### `-r, --rule-selector`

Selection of rules, based on engine name, severity level, rule name, tag, or a combination of criteria separated by colons and commas, and grouped by parentheses.

- **Type**: option
- **Multiple**: Can be specified multiple times
- **Default**: `['all']`

### `-t, --target`

Subset of files within your workspace that you want to target for analysis.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-w, --workspace`

Set of files that make up your workspace.

- **Type**: option
- **Multiple**: Can be specified multiple times

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

Display the current state of the Code Analyzer configuration using the default behavior: display top level configuration, display the engine and rule override settings associated with all the rules; and automatically apply any existing custom configuration settings found in a `code-analyzer.yml` or `code-analyzer.yaml` file in the current folder:
sf code-analyzer:config

This example is identical to the previous one, assuming that `./code-analyzer.yml` exists in your current folder.
sf code-analyzer:config --config-file ./code-analyzer.yml --rule-selector all

Write the current state of configuration to the file `code-analyzer.yml`, including any configuration from an existing `code-analyzer.yml` file. The command preserves all values from the original config, but overwrites any comments:
sf code-analyzer:config --config-file ./code-analyzer.yml --output-file code-analyzer.yml

Display the configuration state for just the recommended rules, instead of all the rules:
sf code-analyzer:config --rule-selector Recommended

Display all the default rule values for the recommended rules, instead of only the rule values you've explicitly overriden in your `code-analyzer.yml` file. By default, only overriden rule values are displayed unless you specify the `--include-unmodified-rules` flag:
sf code-analyzer:config --rule-selector Recommended --include-unmodified-rules

Display the configuration state associated with all the rules that are applicable to the files targeted within the folder `./src`:
sf code-analyzer:config --target ./src

Display any relevant configuration settings associated with the rule name 'no-undef' from the 'eslint' engine:
sf code-analyzer:config --rule-selector eslint:no-undef

Display any relevant configuration settings associated with PMD rules whose severity is 2 or 3:
sf code-analyzer:config --rule-selector "pmd:(2,3)"

Load an existing configuration file called `existing-config.yml`, and then write the configuration to a new file called `new-config.yml`, the configuration state that is applicable to all rules that are relevant to the workspace located in the current folder:
sf code-analyzer:config --config-file ./existing-config.yml --workspace . --output-file ./subfolder-config.yml

## Alternative Syntaxes

- `sf config:code-analyzer`

## Plugin

**@salesforce/plugin-code-analyzer** (user)
