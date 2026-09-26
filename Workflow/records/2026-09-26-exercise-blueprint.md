# L08 exercise blueprint

## Status and scope

- **Lesson:** L08 — interaction models
- **Artifact:** `Exercises/cviceni.R`
- **Branch:** `lesson/l08-exercises`, based on `main` after the Stage 4–5 presentation merge
- **Core route:** 68 minutes of direct student work within a 90-minute practical
- **Dataset:** `MASS::crabs`; one row is one measured crab
- **Core interface:** base R with explicit `MASS::crabs`; no data file is distributed
- **Optional dependency:** `emmeans`, used only in `L08-N01`
- **Human approval:** approved by Ondřej Mottl on 2026-09-26 after independent exercise review

The exercise follows the approved lesson sequence: observe the data, compare an additive model with an interaction model, make a biologically meaningful prediction inside the observed range, diagnose the model, and transfer the same interaction idea to two categorical predictors.

## Approved outcomes and task mapping

| Approved L08 outcome | Core tasks | Evidence produced by students |
|---|---|---|
| Recognize when the relationship between one predictor and the response depends on another predictor. | `L08-U02`, `L08-U03`, `L08-U06`, `L08-U07` | Raw-data plots, comparison of parallel and nonparallel fitted lines, and two sex contrasts conditioned on form. |
| Fit and visualize a model with an interaction. | `L08-U04`, `L08-U06`, `L08-U07` | Equivalent `*` and expanded formulas, prediction lines for both sexes, and a four-group means plot. |
| Interpret predictions and conditional coefficients. | `L08-U04`, `L08-U05`, `L08-U08` | Interpretations of all four continuous-by-group coefficients, predictions at 30 mm, confidence intervals, and conditional group means. |
| Explain interactions for a continuous and a categorical predictor and for two categorical predictors. | `L08-U05`, `L08-U07`, `L08-U08` | A length-specific sex contrast, a difference of differences, and a biological conclusion that names the conditioning variable. |

## Prerequisites and refreshers

Students may use skills introduced before L08:

- create and inspect data frames;
- select rows and columns;
- work with factors and reference levels;
- draw scatterplots and add fitted lines in base R;
- fit an additive linear model with `lm()`;
- use `summary()`, `coef()`, `predict()`, `fitted()`, and `residuals()`;
- interpret a confidence interval and a residual-versus-fitted plot;
- distinguish an association in observational data from a causal effect.

The preparation section permanently retains short reminders about running one expression, commented answer spaces, RStudio Projects, and restarting R. Groups already comfortable with these actions may skip the refresher after the technical preflight. The script reintroduces `interaction()`, `jitter()`, `set.seed()`, and the formula operator `:` immediately before first required use. Before the first supplied scaffold, it names RStudio's Code > Comment/Uncomment Lines command and explains that the command removes the leading comment markers from the selected copied lines.

## Core route and timing

| Segment | Purpose and exact starting state | Direct work |
|---|---|---:|
| Preparation | Create the `L08_praktikum` project folder, obtain and open the script, restart R, and confirm that `MASS` is available. | 6 min |
| `L08-U01` | From `MASS::crabs`, create a five-column Czech-named data frame, set factor order, and inspect dimensions, missingness, group counts, and observational unit. | 6 min |
| `L08-U02` | Starting from `data_krabi`, select blue crabs and make a raw scatterplot with sex shown by both colour and symbol. | 6 min |
| `L08-U03` | Starting from `data_modri`, fit the additive model and add two parallel fitted lines to the supplied repeated-plot scaffold. | 6 min |
| `L08-U04` | Starting from `data_modri`, fit the interaction model in compact and expanded forms, verify equivalence, and interpret all four coefficients. | 9 min |
| `L08-U05` | Starting from `data_modri` and `mod_interakce`, verify that 30 mm is observed for both sexes, predict both sexes with confidence intervals, and calculate the male-minus-female contrast two ways. | 8 min |
| `L08-U06` | Starting from `data_modri` and `mod_interakce`, complete two supplied prediction grids, add both model lines to a supplied plot scaffold, inspect residuals, and state the observational limitation. | 7 min |
| `L08-U07` | Starting from all 200 crabs, show visible jittered observations and group means, fit `forma * pohlavi`, and calculate two sex contrasts and their difference. | 10 min |
| `L08-U08` | Starting from `mod_formy` and supplied four-group data-frame scaffolds, predict all group means with intervals, inspect within-group residual variation, and write a biological conclusion. | 10 min |
| **Total** |  | **68 min** |

The remaining 22 minutes cover opening explanation, joint checks after the continuous interaction, discussion of the difference of differences, and slower-group recovery. `L08-U08` is the integrated closing task. After independent review, a conservative step-by-step rehearsal was repeated with time allotted for reading, copying the supplied mechanics, writing the model-specific code and interpretations, and correcting one error per major section. The scaffolded route remained 68 minutes; the repeated plotting and four residual subsets are supplied rather than rebuilt from scratch.

## Dependencies and object flow

1. The preflight checks `requireNamespace("MASS", quietly = TRUE)` and never installs packages.
2. `L08-U01` creates `data_krabi` with `forma`, `pohlavi`, `delka_krunyre_mm`, `zadni_sirka_mm`, and `hloubka_tela_mm`.
3. `L08-U02` creates `data_modri` and reusable colour and symbol vectors.
4. `L08-U03` creates `mod_aditivni`.
5. `L08-U04` creates `mod_interakce` and `mod_interakce_rozepsany`.
6. `L08-U05` creates the 30 mm prediction grid and predictions.
7. `L08-U06` completes the two supplied prediction grids and creates diagnostic objects.
8. `L08-U07` uses an explicitly ordered `interaction(..., lex.order = TRUE)` scaffold, adds group means, and creates `mod_formy`.
9. `L08-U08` uses supplied, explicitly ordered prediction and residual-subset scaffolds to create `mat_predikce_ctyri` and residual summaries; `L08-N07` reuses its `"fit"` column.

Every core task explicitly names its input objects. The distributed script remains sourceable with empty answer spaces because solution-dependent commands are comments.

## Reference values

These values are for validation and teaching preparation; the public script exposes only the checks students need to recognize correct progress.

### Continuous predictor × sex, blue form only

- blue observations: 100; 50 females and 50 males;
- observed carapace-length ranges: females 14.7–40.9 mm, males 16.1–47.1 mm;
- additive coefficients: intercept 2.8197, length 0.3316, male −1.7172;
- interaction coefficients: intercept 0.7077, female slope 0.4067, male-at-zero contrast 1.9731, slope contrast −0.1245;
- male slope: 0.2823 mm/mm;
- predictions at 30 mm: female 12.9100 mm, male 11.1495 mm;
- male-minus-female contrast at 30 mm: −1.7605 mm;
- 95% confidence intervals at 30 mm: female 12.7849–13.0351 mm, male 11.0259–11.2731 mm.

### Form × sex, all crabs

- 200 observations; 50 in every form-by-sex group;
- group means: blue female 28.102 mm, blue male 32.014 mm, orange female 34.618 mm, orange male 33.688 mm;
- blue male-minus-female contrast: +3.912 mm;
- orange male-minus-female contrast: −0.930 mm;
- orange-minus-blue difference of sex differences: −4.842 mm;
- 95% confidence interval for the interaction coefficient: −8.5887 to −1.0953 mm.

### Additional optional-task checks

- orange-form continuous interaction coefficients: 1.2244, 0.3932, 1.4225, and −0.1078;
- orange-form slopes: female 0.3932 mm/mm and male 0.2854 mm/mm;
- orange-form male-minus-female contrast at 30 mm: −1.8108 mm;
- blue-form fitted-line crossing: 15.8541 mm, just below the shared observed range 16.1–40.9 mm.

## Optional practice

Optional tasks are clearly separated and are not part of the 68-minute route. The eight-task bank provides approximately 60–75 minutes of later practice; students choose tasks by purpose rather than completing the whole bank in one practical.

- `L08-N01` uses `emmeans` to reproduce slopes, predictions, and contrasts; it includes its own availability check and does not install the package.
- `L08-N02` changes reference levels and verifies that fitted values do not change, reinforcing conditional coefficients.
- `L08-N03` transfers the continuous interaction workflow from rear width to body depth without introducing a new dataset.
- `L08-N04` asks students to correct common claims about main effects, interaction, extrapolation, and causality.
- `L08-N05` transfers the continuous interaction to orange-form crabs and compares the conditional slopes and 30 mm contrast.
- `L08-N06` calculates the fitted-line crossing and checks it against the shared observed range.
- `L08-N07` reconstructs all four categorical group means from the model coefficients.
- `L08-N08` visualizes every categorical-model residual by group, retaining visible observations.

## Plot and accessibility plan

- Sex is encoded by both colour and point symbol in continuous plots.
- The four-group plot shows every observation with deterministic horizontal jitter and overlays group means and connecting segments.
- No boxplot appears without observations; no boxplot is required.
- Colours are stored in named vectors and reused. Labels remain understandable without relying only on colour.
- Each core figure is separate; the script does not use `par()` or persistent graphical-state changes.

## Out of scope

- model selection and automated selection;
- R², adjusted R², and AIC, which are introduced in L09;
- centering as a coefficient-reparameterization technique;
- causal claims from the observational crab data;
- biological claims based on unsupported extrapolation beyond observed carapace lengths; checking whether a model-derived value falls inside the shared observed range remains in scope;
- new data-import or file-management syntax beyond obtaining the distributed script.

## Distribution and validation record

- The student route begins from the public L08 website, downloading `cviceni.R` into a local RStudio Project folder. The stable website URL can be verified only during Stage 6 release validation after the exercise pull request merges.
- Required before human review: parse and UTF-8 checks, a clean-session source run, an untracked solved reference harness covering all 16 tasks, expected-value checks, visual inspection of four core figures and the two new optional plots, first-use and prohibited-pattern audits, privacy/licensing review, and distribution rehearsal.
- Required independent review: the complete script and this blueprint must be reviewed read-only with `_internal/.ai/agents/exercise-reviewer.md`; credible findings must be resolved and affected checks rerun.
- **Independent review outcome, 2026-09-26:** the initial review identified excessive mechanical workload, implicit four-group ordering, an incomplete coefficient-interpretation check, a noncanonical random seed, and an undefined coefficient-vector name. The worksheet was scaffolded and corrected; the follow-up reviewer returned no findings and judged the 68-minute route ready for human review.
- **Expanded optional-bank review, 2026-09-26:** after adding L08-N05–L08-N08, review identified one unnamed prediction dependency and two record mismatches. The dependency was made explicit as `mat_predikce_ctyri`, the 16-task harness and scope record were corrected, both new plots were inspected, and the final follow-up returned no findings.
- **Human approval outcome, 2026-09-26:** Ondřej Mottl approved the complete exercise, including the expanded eight-task optional bank.
