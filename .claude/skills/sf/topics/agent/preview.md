# agent:preview

**Interact with an active agent to preview how the agent responds to your statements, questions, and commands (utterances).**

## Description

Use this command to have a natural language conversation with an active agent in your org, as if you were an actual user. The interface is simple: in the "Start typing..." prompt, enter a statement, question, or command; when you're done, enter Return. Your utterance is posted on the right along with a timestamp. The agent then responds on the left. To exit the conversation, hit ESC or Control+C.

This command is useful to test if the agent responds to your utterances as you expect. For example, you can test that the agent uses a particular topic when asked a question, and then whether it invokes the correct action associated with that topic. This command is the CLI-equivalent of the Conversation Preview panel in your org's Agent Builder UI.

When the session concludes, the command asks if you want to save the API responses and chat transcripts. By default, the files are saved to the "./temp/agent-preview" directory. Specify a new default directory by setting the environment variable "SF_AGENT_PREVIEW_OUTPUT_DIR" to the directory. Or you can pass the directory to the --output-dir flag.

Find the agent's API name in its Agent Details page of your org's Agentforce Studio UI in Setup. If your agent is currently deactivated, use the "agent activate" CLI command to activate it.

IMPORTANT: Before you use this command, you must complete a number of configuration steps in your org and your DX project. The examples in this help assume you've completed the steps. See "Preview an Agent" in the "Agentforce Developer Guide" for complete documentation: https://developer.salesforce.com/docs/einstein/genai/guide/agent-dx-preview.html.

## Usage

```bash
sf agent:preview [flags]
```

## Flags

### Command Flags

### `-x, --apex-debug`

Enable Apex debug logging during the agent preview conversation.

- **Type**: boolean

### `-n, --api-name`

API name of the agent you want to interact with.

- **Type**: option

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-c, --client-app`

Name of the linked client app to use for the agent connection. You must have previously created this link with "org login web --client-app". Run "org display" to see the available linked client apps.

- **Type**: option
- **Required**: Yes

### `-d, --output-dir`

Directory where conversation transcripts are saved.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

## Examples

Interact with an agent with API name Resort_Manager in the org with alias "my-org" and the linked "agent-app" connected app:
sf agent:preview --api-name Resort_Manager --target-org my-org --client-app agent-app

Same as the preceding example, but this time save the conversation transcripts to the "./transcripts/my-preview" directory rather than the default "./temp/agent-preview":
sf agent:preview --api-name Resort_Manager --target-org my-org --client-app agent-app --output-dir transcripts/my-preview

## Alternative Syntaxes

- `sf preview:agent`

## Plugin

**@salesforce/plugin-agent** (core)
