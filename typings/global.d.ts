// eslint-disable-next-line @typescript-eslint/no-unused-vars
import prettier from "prettier";

declare module "prettier" {
  interface RequiredOptions {
    apexStandaloneParser: "none" | "built-in";
    apexStandalonePort: number;
    apexStandaloneHost: string;
    apexInsertFinalNewline: boolean;
    apexFormatAnnotations: boolean;
    apexFormatStandardTypes: boolean;
    apexFormatInlineComments: "none" | "spaced" | "trimed" | "strict";
    apexAnnotationsArgsSpacing: boolean;
    apexEmptyBlockBracketLine: boolean;
    apexExpandOneLineProperties: boolean;
    apexExplicitAccessModifier: boolean;
    apexSortModifiers: boolean;
  }
  namespace __debug {
    // eslint-disable-next-line import/prefer-default-export
    export function parse(
      originalText: string,
      originalOptions: Partial<RequiredOptions>,
      massage: boolean,
    ): AST;
  }
}
