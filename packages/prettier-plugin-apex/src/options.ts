import type { ParserOptions } from "prettier";

/**
 * Prettier's parser options plus the plugin's own options (declared in
 * `index.ts`'s `options` export). Prettier hands handlers a plain
 * `ParserOptions`, so the custom fields are otherwise untyped — this is the type
 * the printer reads them through.
 */
export interface ApexParserOptions extends ParserOptions {
  apexStandaloneParser: "none" | "built-in" | "native";
  apexStandaloneHost: string;
  apexStandalonePort: number;
  apexStandaloneProtocol: string;
  apexInsertFinalNewline: boolean;
  apexFormatAnnotations: boolean;
  apexFormatStandardTypes: boolean;
  apexFormatInlineComments: InlineCommentsFormat;
  apexEmptyBlockBracketLine: boolean;
  apexExpandOneLineProperties: boolean;
  apexExplicitAccessModifier: boolean;
  apexSortModifiers: boolean;
  apexForceCurly: boolean;
}

/** Allowed values of the `apexFormatInlineComments` option. */
export type InlineCommentsFormat = "none" | "spaced" | "trimed" | "strict";
