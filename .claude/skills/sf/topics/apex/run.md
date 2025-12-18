# apex:run

**Execute anonymous Apex code entered on the command line or from a local file.**

## Description

If you don’t run this command from within a Salesforce DX project, you must specify the —-target-org flag.

To execute your code interactively, run this command with no flags. At the prompt, enter all your Apex code; press CTRL-D when you're finished. Your code is then executed in a single execute anonymous request.
For more information, see "Anonymous Blocks" in the Apex Developer Guide.

## Usage

```bash
sf apex:run [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-f, --file`

Path to a local file that contains Apex code.

- **Type**: option

### `--loglevel`

- **Type**: option

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

Execute the Apex code that's in the ~/test.apex file in the org with the specified username:
sf apex:run --target-org testusername@salesforce.org --file ~/test.apex

Similar to previous example, but execute the code in your default org:
sf apex:run --file ~/test.apex

Run the command with no flags to start interactive mode; the code will execute in your default org when you exit. At the prompt, start type Apex code and press the Enter key after each line. Press CTRL+D when finished.
sf apex:run

## Aliases

- `force:apex:execute`

## Alternative Syntaxes

- `sf run:apex`

## Plugin

**@salesforce/plugin-apex** (core)
