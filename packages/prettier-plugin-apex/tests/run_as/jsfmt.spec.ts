import { fileURLToPath } from "url";

runSpec(fileURLToPath(new URL(".", import.meta.url)), ["apex"], { astCompareDisabled: true });
