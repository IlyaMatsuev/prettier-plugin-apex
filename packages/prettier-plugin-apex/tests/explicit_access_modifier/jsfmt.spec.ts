import { fileURLToPath } from "url";

runSpec(fileURLToPath(new URL(".", import.meta.url)), ["apex"], {
  apexExplicitAccessModifier: true,
  apexSortModifiers: true,
  astCompareDisabled: true,
});
