# Prettier Apex  [![Build Status](https://travis-ci.org/dangmai/prettier-plugin-apex.svg)](https://travis-ci.org/dangmai/prettier-plugin-apex)

![Prettier Banner](https://raw.githubusercontent.com/prettier/prettier-logo/master/images/prettier-banner-light.png)

This is a code formatter for the Apex Programming Language,
used on the Salesforce development platform.

It uses the excellent [Prettier](https://prettier.io/) engine for formatting,
and the jorje compiler from Salesforce for parsing.

## Status

`prettier-apex` is actively being worked on,
and definitely not ready to be run on production code.

* Priority right now is to support all AST elements from compiler.
A lot is already supported.
* Currently not working: SOSL, comments.
* Formatting needs a lot of work.
* Some defaults will be changed in the future, e.g. default number of spaces,
continuation indent, etc.

## How to run

```bash
git clone https://github.com/dangmai/prettier-apex.git
cd prettier-apex
npm i
npm run execute -- prettify /path/to/apex/dir
```

### License

MIT
