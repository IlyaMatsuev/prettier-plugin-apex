import type { SupportOptions } from "prettier";

import * as jorje from "../vendor/apex-ast-serializer/typings/jorje.d.js";
import {
  canAttachComment,
  handleEndOfLineComment,
  handleOwnLineComment,
  handleRemainingComment,
  hasPrettierIgnore,
  isBlockComment,
  printComment,
  willPrintOwnComments,
} from "./comments.js";
import parse from "./parser.js";
import { hasPragma, insertPragma } from "./pragma.js";
import printFn from "./printer.js";
import { massageAstNode } from "./util.js";

export const languages = [
  {
    name: "Apex",
    parsers: ["apex"],
    extensions: [".cls", ".trigger"],
    linguistLanguageId: 17,
    vscodeLanguageIds: ["apex"],
  },
  {
    name: "Apex Anonymous",
    parsers: ["apex-anonymous"],
    extensions: [".apex"],
    linguistLanguageId: 17,
    vscodeLanguageIds: ["apex-anon"],
  },
];

interface WithLocation {
  location: jorje.Location;
}
type Locatable = jorje.Locatable & WithLocation;

function locStart(node: Locatable): number {
  const location = node.loc ? node.loc : node.location;
  return location.startIndex;
}

function locEnd(node: Locatable): number {
  const location = node.loc ? node.loc : node.location;
  return location.endIndex;
}

export const parsers = {
  apex: {
    astFormat: "apex",
    parse,
    locStart,
    locEnd,
    hasPragma,
    preprocess: (text: string): string => text.trim(),
  },
  "apex-anonymous": {
    astFormat: "apex",
    parse,
    locStart,
    locEnd,
    hasPragma,
    preprocess: (text: string): string => text.trim(),
  },
};

export const printers = {
  apex: {
    print: printFn,
    massageAstNode,
    hasPrettierIgnore,
    insertPragma,
    isBlockComment,
    canAttachComment,
    printComment,
    willPrintOwnComments,
    handleComments: {
      ownLine: handleOwnLineComment,
      endOfLine: handleEndOfLineComment,
      remaining: handleRemainingComment,
    },
  },
};

const CATEGORY_APEX = "apex";

export const options: SupportOptions = {
  apexStandaloneParser: {
    type: "choice",
    category: CATEGORY_APEX,
    default: "native",
    choices: [
      {
        value: "none",
        description: "Do not use a standalone parser",
      },
      {
        value: "built-in",
        description: "Use the built in HTTP standalone parser",
      },
      {
        value: "native",
        description:
          "Use native executable parser, with fallback to Java binaries",
      },
    ],
    description: "Use different methods to speed up parsing. Default to none.",
  },
  apexStandaloneHost: {
    type: "string",
    category: CATEGORY_APEX,
    default: "localhost",
    description:
      "The standalone server host to connect to. Only applicable if apexStandaloneParser is built-in. Default to localhost.",
  },
  apexStandalonePort: {
    type: "int",
    category: CATEGORY_APEX,
    default: 2117,
    description:
      "The standalone server port to connect to. Only applicable if apexStandaloneParser is built-in. Default to 2117.",
  },
  apexStandaloneProtocol: {
    type: "string",
    category: CATEGORY_APEX,
    default: "http",
    description:
      "The protocol for the standalone server. Only applicable if apexStandaloneParser is built-in. Default to http.",
  },
  apexInsertFinalNewline: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: true,
    description:
      "Whether to insert one newline as the last thing in the output. Default to true.",
  },
  apexFormatAnnotations: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: false,
    description:
      "Format Apex annotations to the upper camel case; format annotation arguments to lower camel case; add spaces between annotation arguments; convert `testmethod` modifier to `@IsTest` annotation",
  },
  apexFormatStandardTypes: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: false,
    description:
      "Format the most popular Apex standard types for definitions (does not work for chained method calls). For example: `System`, `Map`, `DateTime`, `SObject` etc.",
  },
  apexFormatInlineComments: {
    type: "choice",
    category: CATEGORY_APEX,
    default: "none",
    choices: [
      {
        value: "none",
        description: "Do not apply any formatting to the inline comments.",
      },
      {
        value: "spaced",
        description: "Add a whitespace after the '//' in inline comment.",
      },
      {
        value: "trimed",
        description:
          "Same as `spaced` but also remove all trailing whitespaces before and after the comment. Be aware that this will not work great with the commented-out code snippets.",
      },
      {
        value: "strict",
        description:
          "Same as `trimed` but also make the first comment letter uppercase. Be aware that this will not work great with the commented-out code snippets.",
      },
    ],
    description: "Formats the inline comments to be more readable.",
  },
  apexEmptyBlockBracketLine: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: false,
    description:
      "Keep the open and closing brackets on the same line for the empty blocks.",
  },
  apexExpandOneLineProperties: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: true,
    description:
      "Expand properties even if there is only one statement in getter or setter. If the option is `false` the properties will be inline if there is only one statement or if the `printWidth` option is not exceeded.",
  },
  apexExplicitAccessModifier: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: false,
    description:
      "Explicitly put the `private` keyword to class members if the access modifier was not provided.",
  },
  apexSortModifiers: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: false,
    description:
      "Sort class member modifiers in the certain order. For fields: `<access> static final transient`, for methods: `<access> static/override virtual/abstract`.",
  },
  apexForceCurly: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: false,
    description: "Force curly brackets around if/else/for/while statements.",
  },
};

export const defaultOptions = {};
