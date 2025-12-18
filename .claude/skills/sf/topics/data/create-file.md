# data:create:file

**Upload a local file to an org.**

## Description

This command always creates a new file in the org; you can't update an existing file. After a successful upload, the command displays the ID of the new ContentDocument record which represents the uploaded file.

By default, the uploaded file isn't attached to a record; in the Salesforce UI the file shows up in the Files tab. You can optionally attach the file to an existing record, such as an account, as long as you know its record ID.

You can also give the file a new name after it's been uploaded; by default its name in the org is the same as the local file name.

## Usage

```bash
sf data:create:file [flags]
```

## Flags

### Command Flags

### `--api-version`

Override the api version used for api requests made by this command

- **Type**: option

### `-f, --file`

Path of file to upload.

- **Type**: option
- **Required**: Yes

### `-i, --parent-id`

ID of the record to attach the file to.

- **Type**: option

### `-o, --target-org`

Username or alias of the target org. Not required if the `target-org` configuration variable is already set.

- **Type**: option
- **Required**: Yes

### `-t, --title`

New title given to the file (ContentDocument) after it's uploaded.

- **Type**: option

### Global Flags

### `--flags-dir`

Import flag values from a directory.

- **Type**: option

### `--json`

Format output as json.

- **Type**: boolean

## Examples

Upload the local file "resources/astro.png" to your default org:
sf data:create:file --file resources/astro.png

Give the file a different filename after it's uploaded to the org with alias "my-scratch":
sf data:create:file --file resources/astro.png --title AstroOnABoat.png --target-org my-scratch

Attach the file to a record in the org:
sf data:create:file --file path/to/astro.png --parent-id a03fakeLoJWPIA3

## Alternative Syntaxes

- `sf create:data:file`
- `sf create:file:data`
- `sf data:file:create`
- `sf file:data:create`
- `sf file:create:data`

## Plugin

**@salesforce/plugin-data** (core)
