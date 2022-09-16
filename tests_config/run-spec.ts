import fs from "fs";
import { extname } from "path";
import prettier, { Options } from "prettier";
import { wrap } from "jest-snapshot-serializer-raw";

const { AST_COMPARE } = process.env;

function read(filename: string): string {
  return fs.readFileSync(filename, "utf8");
}

function prettyPrint(src: string, filename: string, options: Options): string {
  return prettier.format(src, {
    filepath: filename,
    apexStandaloneParser: "built-in",
    apexStandalonePort: 2117,
    apexStandaloneHost: "localhost",
    ...options,
  });
}

function parse(string: string, opts: Options): any {
  // eslint-disable-next-line no-underscore-dangle
  return prettier.__debug.parse(
    string,
    {
      apexStandaloneParser: "built-in",
      apexStandalonePort: 2117,
      apexStandaloneHost: "localhost",
      ...opts,
    },
    /* massage */ true,
  ).ast;
}

function runSpec(
  dirname: string,
  parsers: string[],
  specOptions?: Options & { astCompareDisabled?: boolean },
): void {
  /* instabul ignore if */
  if (!parsers || !parsers.length) {
    throw new Error(`No parsers were specified for ${dirname}`);
  }

  fs.readdirSync(dirname).forEach((filename: string) => {
    const path = `${dirname}/${filename}`;
    if (
      extname(filename) !== ".snap" &&
      fs.lstatSync(path).isFile() &&
      filename[0] !== "." &&
      filename !== "jsfmt.spec.ts"
    ) {
      const source = read(path).replace(/\r\n/g, "\n");

      let options: Options[] = [];
      if (specOptions !== undefined) {
        if (!Array.isArray(specOptions)) {
          options = [specOptions];
        } else {
          options = specOptions;
        }
      } else {
        options.push({});
      }
      const mergedOptions = options.map((opts: Options) => ({
        plugins: ["."],
        ...opts,
        parser: parsers[0],
      }));

      mergedOptions.forEach((mergedOpts) => {
        const output = prettyPrint(source, path, mergedOpts);
        test(`Format ${mergedOpts.parser}: ${filename}`, () => {
          expect(wrap(`${source}${"~".repeat(80)}\n${output}`)).toMatchSnapshot(
            filename,
          );
        });

        // Some of the tests can not pass the AST Compare just because they may fix keywords casing or another valid reason
        if (AST_COMPARE && !specOptions?.astCompareDisabled) {
          const ast = parse(source, mergedOpts);
          const ppast = parse(output, mergedOpts);
          const secondOutput = prettyPrint(output, path, mergedOpts);

          test(`Verify AST: ${filename}`, () => {
            expect(ppast).toBeDefined();
            expect(ast).toEqual(ppast);
          });

          test(`Stable format: ${filename}`, () => {
            expect(secondOutput).toEqual(output);
          });
        }
      });
    }
  });
}
global.runSpec = runSpec;
