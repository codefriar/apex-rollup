# code-analyzer:run

**Analyze your code with a selection of rules to ensure good coding practices.**

## Description

You can scan your codebase with the recommended rules. Or use flags to filter the rules based on engines (such as "retire-js" or "eslint"), rule names, tags, and more.

If you want to preview the list of rules before you actually run them, use the `code-analyzer rules` command, which also has the `--config-file`, `--rule-selector`, `--target`, and `--workspace` flags that together define the list of rules to be run.

We're continually improving Salesforce Code Analyzer. Tell us what you think! Give feedback at https://sfdc.co/CodeAnalyzerFeedback.

## Usage

```bash
sf code-analyzer:run [flags]
```

## Flags

### Command Flags

### `-c, --config-file`

Path to the configuration file used to customize the engines and rules.

- **Type**: option

### `-f, --output-file`

Name of the file where the analysis results are written. The file format depends on the extension you specify, such as .csv, .html, .xml, and so on.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-r, --rule-selector`

Selection of rules, based on engine name, severity level, rule name, tag, or a combination of criteria separated by colons.

- **Type**: option
- **Multiple**: Can be specified multiple times
- **Default**: `['Recommended']`

### `-s, --severity-threshold`

Severity level of a found violation that must be met or exceeded to cause this command to fail with a non-zero exit code.

- **Type**: option

### `-t, --target`

Subset of files within your workspace to be targeted for analysis.

- **Type**: option
- **Multiple**: Can be specified multiple times

### `-v, --view`

Format to display the command results in the terminal.

- **Type**: option

### `-w, --workspace`

Set of files that make up your workspace.

- **Type**: option
- **Multiple**: Can be specified multiple times
- **Default**: `['.']`

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

Analyze code using the default behavior: analyze all the files in the current folder (default workspace) using the Recommended rules; display the output in the terminal with the concise table view; and automatically apply rule or engine overrides if a `code-analyzer.yml` or `code-analyzer.yaml` file exists in the current folder:
sf code-analyzer:run

The previous example is equivalent to this example:
sf code-analyzer:run --rule-selector Recommended --workspace . --target . --view table --config-file ./code-analyzer.yml

Analyze the files using the recommended "eslint" rules and show details of the violations:
sf code-analyzer:run --rule-selector eslint:Recommended --view detail

Analyze the files using all the "eslint" rules:
sf code-analyzer:run --rule-selector eslint

The previous example is equivalent to this example:
sf code-analyzer:run --rule-selector eslint:all

Analyze the files using all rules for all engines:
sf code-analyzer:run --rule-selector all

Analyze the files using only rules in the "pmd" engine with a severity of high (2) or moderate (3), and the "Performance" tag.
sf code-analyzer:run --rule-selector "pmd:(2,3):Performance"

Analyze files using the recommended "retire-js" rules; target all the files in the folder "./other-source" and only the Apex class files (extension .cls) in the folder "./force-app":
sf code-analyzer:run --rule-selector retire-js:Recommended --target ./other-source --target ./force-app/\*_/_.cls

Specify a custom configuration file and output the results to the "results.csv" file in CSV format; the commands fails if it finds a violation that exceeds the moderate severity level (3):
sf code-analyzer:run --config-file ./code-analyzer2.yml --output-file results.csv --severity-threshold 3

Analyze the files using all the "eslint" engine rules that have a moderate severity (3) and the recommended "retire-js" engine rules with any severity:
sf code-analyzer:run --rule-selector eslint:3 --rule-selector retire-js:Recommended

Analyze the files using only the "getter-return" rule of the "eslint" engine and any rule named "no-inner-declarations" from any engine:
sf code-analyzer:run --rule-selector eslint:getter-return --rule-selector no-inner-declarations

## Alternative Syntaxes

- `sf run:code-analyzer`

## Plugin

**@salesforce/plugin-code-analyzer** (user)
