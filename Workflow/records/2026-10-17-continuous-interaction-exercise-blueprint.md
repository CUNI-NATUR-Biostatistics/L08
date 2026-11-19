# L08 exercise blueprint: interaction of two numeric predictors

## Scope

- Artifact: `Exercises/cviceni.R`; addendum to [the approved exercise blueprint](2026-09-26-exercise-blueprint.md) and [the 2026-10-15 polish blueprint](2026-10-15-exercise-polish-blueprint.md), which stay valid unless changed below.
- Date: 2026-10-17. Branch: `lesson/l08-continuous-interaction`.
- Basis: approved [scope amendment](2026-10-17-continuous-interaction-scope.md) (author decision: new core task), approved learning materials and approved presentation (both 2026-10-17).
- Stable IDs: `L08-U01`–`L08-U08` and `L08-N01`–`L08-N08` keep their numbers and purpose. New: core task `L08-U09` and optional task `L08-N09`.

## Outcome mapping

| Outcome (shared list) | Task |
|---|---|
| Fit a model with interaction and show its predictions for combinations of numeric and group predictors | `L08-U09` steps 1, 3 and supplied plot |
| Read coefficients as conditional; compare groups or different predictor values through predictions | `L08-U09` steps 2–3 and interpretation |
| Limit conclusions to the observed range and to association | `L08-U09` interpretation |
| (Extension) scale dependence of interaction | `L08-N09` |

## L08-U09 design

- Purpose: practise the numeric × numeric reading „sklon jednoho prediktoru se mění s hodnotou druhého“ on `data/stromy.csv`, mirroring the written section and slides 45–50.
- Prerequisites: `read.csv()`, `lm()`, `coef()`, `predict()`, `expand.grid()` (introduced in the worked block before `L08-U08`), `plot()`, `lines()`, `legend()`; conditional coefficients from `L08-U04`–`L08-U05`.
- Starting state: supplied, commented block before the task loads `data/stromy.csv` (path in `soubor_stromy` from the technical check), converts units into `data_stromy` with `prumer_cm`, `vyska_m`, `objem_m3`, and prepares `data_porovnani_stromy` (diameters 28 and 36 cm × heights 21 and 25 m). A second supplied block draws the trees with model lines at 21 and 25 m, each over diameters observed in trees of similar height.
- Task: fit `mod_stromy` (`objem_m3 ~ prumer_cm * vyska_m`); compute `vec_sklony_prumeru` at 21, 23 and 25 m from the coefficients; predict for `data_porovnani_stromy` and check that (36 cm − 28 cm prediction) / 8 equals the slope at each height; run the plot; interpret.
- Expected values (from the reference harness): 31 trees, 0 missing values; coefficients ≈ 1,9651; −0,06528; −0,12050; 0,004925; slopes ≈ 0,038; 0,048; 0,058 m³ per cm; predictions ≈ 0,503; 0,808; 0,572; 1,035 m³; increments 0,305 and 0,463 m³, divided by 8 = 0,038 and 0,058.
- Timing: about 10 minutes (model 1, slopes 3, predictions and check 3, plot 1, interpretation 2).

## L08-N09 design

- Optional: refit on the log scale, `log(objem_m3) ~ log(prumer_cm) * log(vyska_m)`, and read `confint()` for the interaction row (≈ −1,19 to 1,74, includes zero); interpretation on scale dependence. About 5 minutes.

## Other script changes

- Header title: „L08 — Kdy vztah dvou znaků závisí na třetím?“ (new lesson title).
- Preparation: second data file `stromy.csv` with its download route and place in the folder tree; the technical check also checks `data/stromy.csv` and describes its columns, source (Meyer 1953, R `datasets`, GPL) and units.
- „Jak se skriptem pracovat“: core tasks U01–U09, optional N01–N09; dependency list adds the tree objects.
- Learning outcomes: shared five-item list with the updated items 2 and 3.
- The top-level section holding `L08-U08` is renamed from „Závěrečný biologický výklad“ to „Výklad modelu se dvěma skupinovými znaky“, because it is no longer the last core section; `L08-U09` follows in a new top-level section „Dva číselné prediktory“.
- „Ohlédnutí a vlastní kontrola“ gains one item on the numeric × numeric reading.

## Timing

Core route: the documented 68–70 minutes plus about 10 minutes for `L08-U09` gives about 78–80 minutes of direct work. The 2026-10-15 review judged the route closer to 85–95 minutes for absent beginners; with `L08-U09` that estimate may reach the ceiling. Mitigation: loading, unit conversion, the comparison table and the plot are supplied; if a group runs late, `L08-U09` steps 3–4 can move to self-study without breaking later tasks (no later task depends on `L08-U09`).

## Review outcomes and amendments (2026-10-17)

- Independent exercise review with `.ai/agents/exercise-reviewer.md` (Sonnet, balanced effort): all U09/N09 expected values independently reproduced; prohibited-pattern search clean; consistent with the written materials and slides.
- Resolved: visible self-study fallback in U09 (steps 4–5 may move home; no later core task depends on U09); Nápověda 2 no longer contains runnable solution code; step 1 asks for `range()` and the expected result gives the observed ranges, so the interpretation can cite them; step 4 names the two heights, explains the 8 cm and points to the first and third slope; the scaffold names its two parts and when to run each; U08 and U09 sections demoted to `##` subsections inside „Hlavní úlohy“ (the previous top-level „Závěrečný biologický výklad“ becomes „## Výklad modelu se dvěma skupinovými znaky“); Nápověda 1 no longer pre-answers the interpretation; N09 compares whether each interval includes zero instead of comparing values across scales.
- Reviewer timing estimate: U09 12–14 minutes for absent beginners; core route about 95–105 minutes for beginners and 85–95 for a brisk group. The visible fallback in U09 is the mitigation; the author should confirm this risk at human review.

## Human review

- Exercise approved by Ondřej Mottl on 2026-10-17 („I approve thos echanges“), with `L08-U09` kept in the core route and the visible fallback for steps 4–5.

## Validation required

Parse and UTF-8 checks; clean-session source run from a temporary student-style folder containing `cviceni.R`, `data/krabi.csv` and `data/stromy.csv`; untracked reference harness solving all 18 tasks with every new expected value checked; visual inspection of the supplied tree plot; prohibited-pattern and first-use audits; independent read-only review with `_internal/.ai/agents/exercise-reviewer.md`.

## Pre-teaching review 2026-11-18

- Basis: independent exercise review before teaching on 2026-11-23 and the prior-knowledge check against standing practices of L01-L07 (`_internal/.ai/authoring/prior-knowledge.md`). Branch `fix/l08-pre-teaching-review`.
- Decisions (Ondřej Mottl, 2026-11-18): D1 add the missing standing practices; D2 "Accept longer route"; D3 fix all findings of the review.
- Timing: the core route is about 108-125 minutes of direct work for absent beginners on the 120-minute practical basis (previous estimate 95-105 minutes). The longer route is accepted. Added work: residual histogram and Q-Q plot, confidence band, interval and standard error of the interaction (about 8-10 minutes in total) and a quick tree plot (1 minute). Trimmed: the unused `data_diagnostika` object in `L08-U06`. Mitigation unchanged: `L08-U09` steps 4-5 may move to self-study and no later core task depends on `L08-U09`.
- New optional task `L08-N10` (Cook's distance for `mod_interakce`, 4/n = 0,04, 8 of 100 crabs above it, maximum 0,146 at row 100 of `data_modri`, the longest female; without it the interaction coefficient is -0,1316 instead of -0,1245 mm/mm and its interval -0,158 to -0,105 excludes zero). Stable IDs unchanged otherwise.
- Where each standing practice is applied now:

| Standing practice | Task |
|---|---|
| `plot_residuals_vs_fitted` | `L08-U06` step 3 (supplied commented base) |
| `plot_residual_histogram`, `plot_residual_qq` | `L08-U06` step 4 (read, not tested; residuals -0,92 to +1,23 mm, 98 of 100 within ±1 mm, slightly right-skewed) |
| `show_confidence_band` | `L08-U06` steps 1-2 (`predict()` with `interval = "confidence"`, dashed band) |
| `report_standard_error`, `report_confidence_interval` | `L08-U04` step 4 (SE 0,0132; 95% CI -0,151 to -0,098); `L08-U05` (intervals at 30 mm, overlap asked); `L08-U08` (`confint(mod_formy)`) |
| `check_independence_from_design` | `L08-U01` interpretation |
| `check_influential_observations` | `L08-N10` (optional); tree model omitted, see below |
| `plot_relationship_before_model` | `L08-U02`; `L08-U09` step 1 (quick `plot()` of the tree data) |
| `state_reference_level` | `L08-U01` (factor levels), `L08-U07` step 2 asks for the reference group |
| `stay_within_observed_range`, `report_effect_in_original_units`, `state_association_not_causation`, `interpret_coefficient_conditionally` | unchanged (`L08-U04`-`L08-U06`, `L08-U09`) |
| `check_table_structure`, `check_missing_values`, `state_observation_unit` | `L08-U01` |

Later on 2026-11-18, after the deck review, the `L08-U09` diameter step changed from 28 → 36 cm to 28 → 38 cm to match the deck and the skripta (divide by 10, not 8). Expected predictions are now 0,503; 0,884; 0,572; 1,151 m³ and rises 0,381 and 0,578 m³; the slopes stay 0,038 and 0,058 m³ na 1 cm.

- Omissions with reasons:
  - `adjust_pairwise_comparisons`: acceptable; `L08-N01` computes a single pre-planned contrast (male - female at 30 mm), not a family of pairwise comparisons.
  - `plot_distribution_before_summary`: acceptable; no univariate summary is taken before a model (the raw relationships are plotted in `L08-U02` and `L08-U09`).
  - Residual check and Cook's distance for `mod_stromy` (`L08-U09`) and residuals for `mod_aditivni` (`L08-U03`): omitted for time; `L08-U09` states the omitted influence check to students (the skripta says so too). The residual routine is taught once in `L08-U06`.
- Other fixes: first-use notes (download tip "Ctrl + S" for files shown as text), dependency list and restart advice completed (`vec_barvy_pohlavi`, `vec_symboly_pohlavi`, `skupina`, `vec_prumery_skupin`, `mat_predikce_ctyri`, `residuum_mm`); `L08-U06` step 2 copies the plot base and the base plot gets `ylim` so the band is not clipped; names `odhad_mm`, `dolni_mm`, `horni_mm`, `residuum_mm` unified; ASCII separator in `interaction()`; hints of `L08-U06`, `L08-U07`, `L08-N06`, `L08-N07` and `L08-N08` rewritten to add information instead of repeating the task; terminology ("odhadnuté přímky z modelu", "referenční skupinu").
- Validation (2026-11-18, scratch folder, `Rscript --vanilla`): unfilled script runs without errors; reference harness reproduces every expected value, including the new ones above; new plots inspected as PNG. The independent re-review of the revised script is still required before release.

## Stats-first restructure 2026-11-18

Ondřej Mottl, at human review of the exercise (2026-11-18): "the beginning is focusing on data wrangling and not on statistics. That needs to change, the aim is NOT to teach them coding but mostly stats." Decisions: restructure the whole main route; prepared code runs as is; plot code that needs a student-fitted model stays as a short commented block to copy and uncomment (no helper functions), so the unfilled script still runs from a clean session.

- New `Příprava` subsection `Připravená data`, run as is: reads both CSV files, builds `data_krabi` (Czech names, factors with `modrá`/`samice` first, columns `barva` and `symbol` from the sex colour and symbol vectors), `data_modri`, `data_samice`, `data_samci` and the metric `data_stromy`. The opening of `Jak se skriptem pracovat` states the aim: statistics, not programming.
- `L08-U01`: from selecting, renaming and factor conversion to reading the prepared table: `str()`, missing values, `table()` of the 2 × 2 design, response and predictors, row unit, independence, consequence of 50 crabs per group.
- `L08-U02`: from subsetting and an indexed colour plot to reading a prepared plot: approximate width of both sexes at 20 and 40 mm, difference male − female at both lengths, same slope or not.
- `L08-U03`: fit `mod_aditivni`, compute `intercept_samice`, `intercept_samci`, `sklon_spolecny`; a prepared commented plot draws the two lines from these names.
- `L08-U04`: the second explicit-formula model and the `all.equal()` checks are removed; the text still explains that `*` expands to `+` and `:`. New step: `sklon_samci` from the coefficients.
- `L08-U05`: `data_30` is prepared and runs as is; `data_samice` and `data_samci` come from the prepared data.
- `L08-U06`: the line and band plot is one prepared commented block (predictions included, `matlines()`); students write only the residual checks (residuals against fitted values, histogram, Q–Q plot).
- `L08-U07`: the four-group plot runs as is (it creates `skupina` and `vec_prumery_skupin`); the function-by-function explanation is replaced by one sentence on what the plot shows.
- `L08-U08`: `data_ctyri` runs as is; residuals per group are shown with `boxplot(residuum_mm ~ skupina)` (known from L02 and L06) instead of `tapply(summary)`.
- `L08-U09`: unit conversion and `data_porovnani_stromy` are prepared; the NA and row-count check is dropped from the task; the line plot stays a commented block.
- Optional tasks: `L08-N05` hint uses the `barva` and `symbol` columns; `L08-N08` starts from the prepared four-group plot; `L08-N09` uses the prepared `data_stromy`. Task IDs and the statistical content of every main task are unchanged, so the Moodle knowledge `source` mapping stays valid.
- Prior-practice rows: `check_table_structure`, `check_missing_values`, `state_observation_unit` stay in `L08-U01`; `plot_relationship_before_model` in `L08-U02` (prepared plot read by students) and `L08-U09` step 1.
- Validation (2026-11-18, scratch folder with only the script and `data/`, `Rscript --vanilla`): parses, UTF-8 without BOM, CRLF, no replacement characters, no line over 80 characters, no prohibited patterns; the unfilled script sources without errors; the reference harness solves U01–U09 and N05–N10 and reproduces every stated expected value; prepared plots inspected.
- Independent review (2026-11-18, fresh `exercise-reviewer.md` subagent, Sonnet, own harness): review-ready, no high findings; the main route now puts the effort on statistics and no prepared code hides a learning outcome. Fixed after review: dependency list names `data_30`, `data_ctyri`, `data_porovnani_stromy`, `skupina`, `vec_prumery_skupin`; "podrobně číst jen tam, kde to text výslovně žádá"; answer lines for response and predictors in `L08-U01`; `L08-U05` overlap question is step 4 and Nápověda 1 now names extrapolation; the meaning of the confidence band moved from the `L08-U06` hint to the text before the block, and the block gets a legend; `L08-U07` hint says to copy coefficient names from `coef()` because of diacritics; `L08-U09` step 4 names the four rows in `Zadání` and the hint stores the predictions in a vector instead of a new column. Not changed: non-ASCII typography in comments (minus sign, dashes, `m³`, folder tree), as in all earlier exercises; `L08-N01` unverified by the reviewer because `emmeans` was not installed there.
- Timing (reviewer): core route about 105–110 minutes for an absent beginner, 55–65 for a brisk group, about 80–90 for a typical mixed group; about 95–100 with `L08-U09` steps 4–5 at home. Still above the 85–95 minute rule for absent beginners; the owner accepted a longer route at D2 and must confirm it for the restructured script.
- Revalidation after the fixes: encoding, line widths, prohibited patterns, unfilled script from a clean session, full harness and each of the three commented blocks uncommented and run after fitting.
