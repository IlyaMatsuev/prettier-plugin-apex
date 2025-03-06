import "prettier";

declare module "prettier" {
  interface RequiredOptions {
    apexStandaloneParser: string;
    apexStandalonePort: number;
    apexStandaloneHost: string;
    apexStandaloneProtocol: string;
    apexInsertFinalNewline: boolean;
    apexFormatAnnotations: boolean;
    apexFormatStandardTypes: boolean;
    apexFormatInlineComments: "none" | "spaced" | "trimed" | "strict";
    apexEmptyBlockBracketLine: boolean;
    apexExpandOneLineProperties: boolean;
    apexExplicitAccessModifier: boolean;
    apexSortModifiers: boolean;
    apexForceCurly: boolean;
  }
  namespace __debug {
    export function parse(
      originalText: string,
      originalOptions: Partial<RequiredOptions>,
      massage: boolean,
    ): AST;
  }
}
