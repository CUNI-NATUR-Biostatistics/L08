# L08 Stage 6 release readiness

## Release decision

- Date: 2026-09-27
- Target tag: `L08-v1.0.0-20260926`
- Branch: `release/l08-v1.0.0-20260926`, based on updated `main` after exercise PR #4 merged
- Authorization: Ondřej Mottl authorized the complete release-fix and publication sequence on 2026-09-27
- Release change: replace template publication metadata, expose stable L08 student links, rename the RStudio Project, and prepare the first stable release

## Git checkpoint

- Presentation PR #3 merged: yes
- Exercise PR #4 merged: yes
- Default branch updated locally before creating the release-fix branch: yes
- Release-fix PR: pending
- Publication tag and GitHub release: pending release-fix PR merge

## Public bundle and routes

The manifest publishes only the approved learning-material HTML, PDF, and source; presentation HTML, PDF, and source; practical R script; and `LICENSE.md`. The exercise loads `MASS::crabs` from the MASS package, so no separate data file is distributed. No answer key, private note, student information, credential, restricted assessment material, or workflow record is included in the release bundle.

Expected stable routes after the release workflow completes:

- `https://cuni-natur-biostatistics.github.io/L08/current/learning/`
- `https://cuni-natur-biostatistics.github.io/L08/current/learning/skripta.pdf`
- `https://cuni-natur-biostatistics.github.io/L08/current/presentation/`
- `https://cuni-natur-biostatistics.github.io/L08/current/presentation/presentation.pdf`
- `https://cuni-natur-biostatistics.github.io/L08/current/code/cviceni.R`
- immutable snapshot under `https://cuni-natur-biostatistics.github.io/L08/releases/L08-v1.0.0-20260926/`

## Validation evidence

- Learning materials, presentation, and exercise have completed their independent and human review gates.
- The presentation HTML matches `docs/index.html` by SHA-256. The approved HTML and PDF artifacts are committed.
- The manifest identifies L08 and academic year 2026–27, lists the intended public files, and includes `LICENSE.md`.
- Every manifest path exists. The bundle contains no standalone dataset because `MASS::crabs` is loaded from the installed MASS package.
- `LICENSE.md` retains the CC BY 4.0 / MIT split and third-party exclusions.
- The generated crab illustrations are visibly disclosed as AI illustrations in the presentation; no third-party image is added to the release allowlist as a separate file.
- The approved exercise passed clean-session, 16-task reference-solution, encoding, visual, first-use, public-content, and independent-review checks.
- The README directs students to stable `/L08/current/` resources and distinguishes them from `main`.
- Source and workflow files pass UTF-8 without BOM or replacement characters.

## Repository and Pages state

At the start of Stage 6, the repository was private, its description was empty, and the Pages endpoint returned 404. After the release-fix PR merges, the authorized publication sequence will:

1. make the repository public;
2. set the description to `Biostatistika L08: interakce prediktorů` and homepage to the course HUB;
3. configure GitHub Pages to use GitHub Actions;
4. restrict the `github-pages` environment to `main` and tags matching `L08-v*`;
5. create and push `L08-v1.0.0-20260926`;
6. wait for the release workflow and verify the GitHub release, immutable snapshot, `/current/` routes, and HUB refresh.

## Known limitations

- `renv::status()` reports packages that are installed and recorded but currently unused; no dependency required by the approved materials is missing.
- The stable routes cannot be verified until the release workflow has run.
- The target tag retains the explicitly authorized `20260926` suffix although operational publication continues on 2026-09-27.

## Decision

Release content is ready for a release-fix pull request. Final release readiness depends on merging that PR and completing the authorized repository, Pages, tag, workflow, and route checks.
