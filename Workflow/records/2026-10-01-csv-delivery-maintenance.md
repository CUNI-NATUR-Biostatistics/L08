# L08 CSV delivery maintenance

## Scope

- Date: 2026-10-01
- Branch: `data/l08-csv-delivery`
- Purpose: replace the student runtime dependency on `MASS::crabs` with a stable, downloadable CSV while preserving the approved practical tasks, values, and timing.

## Data and rights contract

- `data/krabi.csv` contains all 200 rows and eight original columns from `MASS::crabs` 7.3-66.
- `R/prepare_crab_data.R` reproduces and validates the CSV from the version pinned in `renv.lock`.
- `data/README.md` carries the Campbell and Mahon (1974) citation, identifies MASS as the immediate source, and records the package's GPL-2 or GPL-3 terms, satisfying the separate-rights-notice requirement in the approved dataset record.
- The student script downloads the file from the stable lesson route, stores it under `data/`, checks its presence, and imports it with `read.csv()` in L08-U01.
- `website-release.yml` publishes the CSV and its rights/provenance note.

## Pedagogical effect

L08-U01 gains the familiar `read.csv()` step. Its selection, Czech naming, factor-order, inspection, and interpretation work remains unchanged, so the core timing allocation remains six minutes.

## Validation required

- regenerate the CSV from MASS 7.3-66 and compare every value with the package source;
- parse and run the unfilled script from a clean R session;
- solve L08-U01 from the documented starting state and confirm all stated counts;
- rehearse the documented script-and-data folder route;
- independently review the complete updated exercise against `Workflow/records/2026-09-26-exercise-blueprint.md`.

## Validation outcome

- The preparation script regenerated the CSV from MASS 7.3-66.
- A value-by-value comparison matched all 200 source rows and eight columns after the expected factor-to-character CSV serialization.
- A reference solution of the changed L08-U01 route confirmed 200 rows, five selected columns, no missing values, and four groups of 50 crabs.
- The complete exercise parsed and ran from a clean temporary student-style project containing only the distributed script and CSV.
- Manifest paths, UTF-8 without BOM, and `git diff --check` passed.
- Independent read-only exercise review completed on 2026-10-01 with no findings. Estimated direct-work timing is 68–70 minutes including the added import step. Human review remains required before release.
