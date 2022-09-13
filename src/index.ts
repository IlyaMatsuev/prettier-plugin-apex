import jorje from "../vendor/apex-ast-serializer/typings/jorje";

import {
  canAttachComment,
  handleEndOfLineComment,
  handleOwnLineComment,
  handleRemainingComment,
  hasPrettierIgnore,
  isBlockComment,
  printComment,
  willPrintOwnComments,
} from "./comments";
import parse from "./parser";
import { hasPragma, insertPragma } from "./pragma";
import printFn from "./printer";
import { massageAstNode } from "./util";

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

export const options = {
  apexStandaloneParser: {
    type: "choice",
    category: CATEGORY_APEX,
    default: "none",
    choices: [
      {
        value: "none",
        description: "Do not use a standalone parser",
      },
      {
        value: "built-in",
        description: "Use the built in HTTP standalone parser",
      },
    ],
    description:
      "Use a standalone process to speed up parsing. This process needs to be started and stopped separately from the Prettier process",
  },
  apexStandaloneHost: {
    type: "string",
    category: "Global",
    default: "localhost",
    description:
      "The standalone server host to connect to. Only applicable if apexStandaloneParser is true. Default to localhost.",
  },
  apexStandalonePort: {
    type: "int",
    category: CATEGORY_APEX,
    default: 2117,
    description:
      "The standalone server port to connect to. Only applicable if apexStandaloneParser is true. Default to 2117.",
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
    description: "Format Apex annotations to the upper camel case.",
  },
  apexFormatStandardTypes: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: false,
    description:
      "Format the most popular Apex standard types. For example: `System`, `Map`, `DateTime`, `SObject` etc.",
  },
  apexFormatInlineComments: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: false,
    description:
      "Formats the inline comments to have a space and start from a capital letter.",
  },
  apexAnnotationsArgsSpacing: {
    type: "boolean",
    category: CATEGORY_APEX,
    default: false,
    description:
      "Add spaces between an annotation argument and value. For example: `@Future(callout = true)",
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
};

export const defaultOptions = {};
