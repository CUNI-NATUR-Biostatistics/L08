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
