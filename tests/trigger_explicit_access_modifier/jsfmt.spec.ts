import { fileURLToPath } from "url";

runSpec(fileURLToPath(new URL(".", import.meta.url)), ["apex"], {
  apexExplicitAccessModifier: true,
  astCompareDisabled: true,
});
