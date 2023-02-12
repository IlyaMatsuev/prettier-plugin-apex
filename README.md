# Prettier Apex [Not Opinionated]

[![Build Status](https://github.com/IlyaMatsuev/prettier-plugin-apex/actions/workflows/tests-deployments.yml/badge.svg?branch=master)](https://github.com/IlyaMatsuev/prettier-plugin-apex/actions/workflows/tests-deployments.yml)
[![npm](https://img.shields.io/npm/v/@ilyamatsuev/prettier-plugin-apex.svg)](https://www.npmjs.com/package/@ilyamatsuev/prettier-plugin-apex)
![license](https://img.shields.io/npm/l/prettier-plugin-apex.svg)
[![codecov](https://codecov.io/gh/IlyaMatsuev/prettier-plugin-apex/branch/master/graph/badge.svg?token=AAD15HSIB9)](https://codecov.io/gh/IlyaMatsuev/prettier-plugin-apex)

![Prettier Banner](https://raw.githubusercontent.com/prettier/prettier-logo/master/images/prettier-banner-light.png)

This is a code formatter for the Apex Programming Language, used on the Salesforce development platform.

It uses the excellent [Prettier](https://prettier.io/) engine for formatting, and the jorje compiler from Salesforce for parsing.

> :warning: **NOTE:** The original project follows the [Prettier Option Philosophy](https://prettier.io/docs/en/option-philosophy.html). This fork DOES NOT follow this strategy and contains several additional configuration options that can be listed below in [the table](#configuration) or in [the changelog](/CHANGELOG.md).

The purpose of this fork is to improve the original package. Although, the Prettier developers [don't want to add additional options](https://prettier.io/docs/en/option-philosophy.html) saying that this is very _opinionated_ formatter, from my _personal_ experience every company may have their own Apex coding style guidelines and some of these companies will not change their mind and prefer the style that is proposed in the original Apex prettier plugin. For exactly this case this fork has been created. Another reason is that I like an opportunity to configure how my code looks!

## Check out the new formatting options and changes in [the changelog](/CHANGELOG.md) or take a look at [the examples](/CHANGELOG.examples.md)!

## Usage

### Requirements

- Node >= 14.0.0
- Java Runtime Engine >= 11

### How to use

First, install the library:

```bash
# Install locally
npm install --save-dev prettier @ilyamatsuev/prettier-plugin-apex

# Or install globally
npm install --global prettier @ilyamatsuev/prettier-plugin-apex
```

If you install globally, run:

```bash
prettier --write "/path/to/project/**/*.{trigger,cls}"
```

If you install locally, you can add prettier as a script in `package.json`:

```json
{
  "scripts": {
    "prettier": "prettier"
  }
}
```

Then in order to run it:

```bash
npm run prettier -- --write "/path/to/project/**/*.{trigger,cls}"
```

### Tip

#### Initial run

If you are formatting a big code base for the first time,
please make sure that you have some form of version control in place,
so that you can revert any change if necessary.
You should also run Prettier with the `--debug-check` [argument](https://prettier.io/docs/en/cli.html#debug-check).
For example:

```bash
prettier --debug-check "/path/to/project/**/*.{trigger,cls}"
```

This will guarantee that the behavior of your code will not change because of
the format.

If there are no errors, you can run `prettier` with `--write` next.
If there are errors, please file a bug report so that they can be fixed.

#### Anonymous Apex

You can also format anonymous Apex with this program by using the
`apex-anonymous` parser.

For example:

```bash
prettier --write "/path/to/project/anonymous/**/*.cls" --parser apex-anonymous
```

Note that Prettier will treat any Apex file that it finds using the glob above
as anonymous code blocks,
so it is recommended that you collect all of your anonymous Apex files into
one directory and limit the use of `--apex-anonymous` only in that directory.

#### Ignoring lines

If there are lines in your Apex code that you do not want formatted by Prettier
(either because you don't agree with the formatting choice,
or there is a bug), you can instruct Prettier to ignore it by including the comment
`// prettier-ignore` or `/* prettier-ignore */` on the line before. For example:

```
// prettier-ignore
matrix(
  1, 0, 0,
  0, 1, 0,
  0, 0, 1
)
```

### Configuration

This library follows the same configuration format as Prettier, which is documented [here](https://prettier.io/docs/en/configuration.html).

Check out the examples of how to use the new options [here](/CHANGELOG.examples.md).

This is Not Opinionated formatter, so the there are multiple configurations available. The list can extend in future:

| Name                          | Default     | Description                                                                                                                                                                                                                                                                                                                                      |
| ----------------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `printWidth`                  | `80`        | Same as in Prettier ([see prettier docs](https://prettier.io/docs/en/options.html#print-width))                                                                                                                                                                                                                                                  |
| `tabWidth`                    | `2`         | Same as in Prettier ([see prettier docs](https://prettier.io/docs/en/options.html#tab-width))                                                                                                                                                                                                                                                    |
| `useTabs`                     | `false`     | Same as in Prettier ([see prettier docs](https://prettier.io/docs/en/options.html#tabs))                                                                                                                                                                                                                                                         |
| `requirePragma`               | `false`     | Same as in Prettier ([see prettier docs](https://prettier.io/docs/en/options.html#require-pragma))                                                                                                                                                                                                                                               |
| `insertPragma`                | `false`     | Same as in Prettier ([see prettier docs](https://prettier.io/docs/en/options.html#insert-pragma))                                                                                                                                                                                                                                                |
| `apexStandaloneParser`        | `none`      | If set to `built-in`, Prettier uses the built in standalone parser for better performance. See [Performance Tip](#performance-tips3rd-party-integration).<br>If set to `none`, Prettier invokes the CLI parser for every file.                                                                                                                   |
| `apexStandalonePort`          | `2117`      | The port that the standalone Apex parser listens on.<br>Only applicable if `apexStandaloneParser` is `built-in`.                                                                                                                                                                                                                                 |
| `apexStandaloneHost`          | `localhost` | The host that the standalone Apex parser listens on.<br>Only applicable if `apexStandaloneParser` is `built-in`.                                                                                                                                                                                                                                 |
| `apexInsertFinalNewline`      | `true`      | Whether a newline is added as the last thing in the output                                                                                                                                                                                                                                                                                       |
| `apexFormatAnnotations`       | `false`     | Format Apex annotations to the upper camel case. Also converts `testmethod` modifier to `@IsTest` case.                                                                                                                                                                                                                                          |
| `apexFormatStandardTypes`     | `false`     | Format the most popular Apex standard types. For example: `System`, `Map`, `DateTime`, `SObject` etc.                                                                                                                                                                                                                                            |
| `apexFormatInlineComments`    | `none`      | If set to `spaced`, adds a whitespace after the "//" in the inline comment.<br>If set to `trimed`, works as `spaced` but also removes all whitespaces before and after the comment.<br>If set to `strict`, works as `trimed` but also makes the first comment letter uppercase.<br>If set to `none`, does not change inline comments formatting. |
| `apexAnnotationsArgsSpacing`  | `false`     | Add spaces between an annotation argument and value. For example: `@Future(callout = true)`.                                                                                                                                                                                                                                                     |
| `apexEmptyBlockBracketLine`   | `false`     | Keep the open and closing brackets on the same line for the empty blocks.                                                                                                                                                                                                                                                                        |
| `apexExpandOneLineProperties` | `true`      | Expand properties even if there is only one statement in getter or setter. If the option is `false` the properties will be inline if there is only one statement or if the `printWidth` option is not exceeded.                                                                                                                                  |
| `apexExplicitAccessModifier`  | `false`     | Explicitly put the `private` keyword to class members if the access modifier was not provided.                                                                                                                                                                                                                                                   |
| `apexSortModifiers`           | `false`     | Sort class member modifiers in the certain order. For fields: `<access> static final transient`, for methods: `<access> static/override virtual/abstract`.                                                                                                                                                                                       |

## Editor integration

### VScode

Follow [this tutorial](https://developer.salesforce.com/tools/vscode/en/user-guide/prettier) from Salesforce in order to use this plugin in VSCode.

## Performance Tips/3rd party integration

By default,
this library invokes a CLI application to get the AST of the Apex code.
However, since this CLI application is written in Java,
there is a heavy start up cost associated with it.
In order to alleviate this issue,
we also have an optional HTTP server
that makes sure the start up is invoked exactly once.
This is especially useful if this library is integrated in a 3rd party application.

In order to use this server,
you have to evoke it out of band before running Prettier,
as well as specifying a special flag when running Prettier:

```bash
# Start the server (if installed globally)
start-apex-server
# Or if installed locally
node /path/to/library/dist/bin/start-apex-server.js

# In a separate console
prettier --apex-standalone-parser built-in --write "/path/to/project/**/*.{trigger,cls}"

# After you are done, stop the server (if installed globally)
stop-apex-server
# Or if installed locally
node /path/to/library/dist/bin/stop-apex-server.js
```

By default, the server listens on `http://localhost:2117`.
This can be customized by specifying the `--host` and `--port` arguments:

```bash
start-apex-server --host 127.0.0.1 --port 2118
```

## Continuous Integration

Prettier Apex can be used to automatically check correct formatting for Apex code
in the context of CI/CD, for example:

```bash
# Start the language server for improved parsing performance,
# and put it in the background (*nix only) so that next commands can be run.
nohup start-apex-server >/dev/null 2>&1 &
# Wait until the server is up before sending requests
npx wait-on http://localhost:2117/api/ast/
# Check that Apex files are formatted according to Prettier Apex style
prettier --check 'project/**/*.{trigger,cls}' --apex-standalone-parser built-in
# Clean up the language server
stop-apex-server
```
