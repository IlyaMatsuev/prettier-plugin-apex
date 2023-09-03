import { fileURLToPath } from "url";

runSpec(fileURLToPath(new URL(".", import.meta.url)), ["apex-anonymous"], {
  apexExplicitAccessModifier: true,
  apexSortModifiers: true,
  astCompareDisabled: true,
});
