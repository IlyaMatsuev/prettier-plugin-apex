import prettier from "prettier";

declare module "prettier" {
  interface RequiredOptions {
    apexStandaloneParser: string;
    apexStandalonePort: number;
    apexStandaloneHost: string;
    apexInsertFinalNewline: boolean;
    apexFormatAnnotations: boolean;
    apexFormatStandardTypes: boolean;
    apexFormatInlineComments: boolean;
    apexAnnotationsArgsSpacing: boolean;
    apexEmptyBlockBracketLine: boolean;
    apexExpandOneLineProperties: boolean;
    apexExplicitAccessModifier: boolean;
    apexSortModifiers: boolean;
  }
  namespace __debug {
    export function parse(
      originalText: string,
      originalOptions: Partial<RequiredOptions>,
      massage: boolean,
    ): AST;
  }
}
