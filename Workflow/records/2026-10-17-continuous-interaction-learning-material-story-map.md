# L08 learning-material story map: interaction of two numeric predictors

## Scope and approval record

- Artifact: complete `Learning_materials/skripta.qmd`.
- Date: 2026-10-17.
- Branch: `lesson/l08-continuous-interaction`; base: `main` at `f5f1d54`.
- Requested work: add a compact third example with two numeric predictors, using the approved [scope amendment](2026-10-17-continuous-interaction-scope.md). Both crab examples stay unchanged.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-17.
- Decision and requested revisions: explicit user decision „yes, I approve“ (2026-10-17) on the presented map, including comparison values 21/23/25 m and 28/36 cm, four height-quartile panels and no residual plot for trees; no revisions.
- This map is separate from the presentation map and needs its own approval.

## Complete story map

One row per major section or concept block. Rows 1–18 are the approved 2026-10-15 map and stay unchanged. New rows are 19–22. Rows 23–28 are the old rows 19–24, with the changes marked.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Biological opening and spine question | Liší se vztah délky a zadní šířky krunýře mezi samicemi a samci? | Retain. |
| 2 | Recall of the additive model | Kdy předpovídají dvě přímky stejný sklon? | Retain. |
| 3 | Learning contract | Výsledky učení | **Change one item:** „fitovat lineární model s interakcí a zobrazit jeho předpovědi pro číselný i skupinový prediktor“ → „… pro kombinace číselných i skupinových prediktorů“. Other four items unchanged. The shared list is also used on the presentation outcomes slide. |
| 4–18 | Crab examples (data, additive model, interaction model, 30 mm comparison, coefficients, residuals, first answer; second example with four groups) | Retain all headings | Retain. No change to text, figures or numbers. |
| 19 | Third question and new data | Přibývá objem dřeva s průměrem kmene stejně rychle u nízkých i vysokých stromů? | Short bridge: both previous examples had at least one group predictor; now both predictors are numbers. Hook: střemcha pozdní (*Prunus serotina*), known in Czech forests as an invasive tree; foresters estimate wood volume from diameter and height. Thought experiment in a `box-question` „Co čekáte?“: one extra centimetre of diameter on a 20 m and on a 25 m trunk. Collapsed `box-result`: the extra ring runs along the whole trunk, so a taller tree gains more wood; the effect comes from trunk geometry. Visible base R: `read.csv(file = "data/stromy.csv")`, three commented conversions to `prumer_cm`, `vyska_m`, `objem_m3`, then `str()` and `summary()` of the three new columns. One sentence on units and that `Girth` is in fact a diameter. Collapsed provenance box „Doplňující: odkud pocházejí data o stromech“ (Meyer 1953, R `datasets`, GPL, no documented location or sampling). Caveat: 31 felled trees, not a documented random sample. |
| 20 | Conditional view and the familiar additive model | Je sklon průměru stejný u nízkých i vysokých stromů? | Explain the new kind of figure first: a numeric predictor has no groups, so we split trees into four height bands (quartiles; 7–9 trees each) only to *draw* them. Hidden ggplot: four panels in one row, each with volume vs diameter for that band's trees and the **additive** model line (`objem_m3 ~ prumer_cm + vyska_m`) at the band's median height. Lines are parallel; in the lowest band the points lie below the line's ends, in the highest band above. `box-question` „Co v panelech vidíte?“ with collapsed answer. Visible code: `mod_aditivni` only (the figure code stays hidden, because it is not the lesson's skill). Links to L07: same as two temperatures, but now we ask whether the slope of one depends on the other. |
| 21 | Interaction model and slopes at chosen heights | Model s interakcí nechá sklon průměru měnit se s výškou | Visible `mod_stromy <- lm(formula = objem_m3 ~ prumer_cm * vyska_m, data = data_stromy)`. The same four-panel figure, now with interaction-model lines; the lowest band's line repeats as a grey dashed reference in every panel. Key sentence: slope of diameter = coefficient of `prumer_cm` + coefficient of `prumer_cm:vyska_m` × výška. Inline slopes at 21, 23 and 25 m (about 0,038; 0,048; 0,058 m³ na 1 cm). Visible `expand.grid()` + `predict()` for diameters 28 and 36 cm at heights 21 and 25 m (values inside the data). Result: the same 8 cm step adds about 0,31 m³ at 21 m and about 0,46 m³ at 25 m. Named teaching inputs `prumery_porovnani_cm` and `vysky_porovnani_m`. |
| 22 | Conditional coefficients with two numbers | Co znamená koeficient průměru, když se sklon mění s výškou? | `summary(mod_stromy)` coefficient rows only, read in words. The `prumer_cm` coefficient is the slope at height 0 m (negative, about −0,065), which no tree has; this is why we report slopes or predictions at observed heights. One sentence on symmetry: the interaction equally says that the effect of height depends on diameter (about 0,017 m³ per metre at 28 cm and 0,057 at 36 cm). `confint()` for the interaction row with one interpretation sentence. Brief limits: 31 trees, observed ranges only; a slight curvature hint (quadratic term p ≈ 0,09) is not pursued here. No residual plot (compact example). |
| 23 | Common thread (old 19) | Kdy musíme při výkladu jednoho prediktoru uvést hodnotu druhého? | **Extend** the comparison paragraph from two to three cases: change of slope with a group, change of a group difference with another group, change of slope with a number; add the question „při jaké výšce?“. **Extend** the scale box by one paragraph: on the logarithmic scale the tree interaction almost disappears (volume ≈ průměr² × výška), so the claim „interakce existuje“ again depends on the scale. |
| 24 | Answer to the spine question (old 20) | Co tedy můžeme říct o krabech? | Retain crab answer; **add one sentence** on the third example: in these 31 trees the diameter slope grew with height, and an extra centimetre of diameter added more wood in taller trees. |
| 25 | Bridge (old 21) | Co bude následovat dál | Retain. |
| 26 | Earned recap (old 22) | Shrnutí | **Add one bullet**: u dvou číselných prediktorů interakce znamená, že se sklon jednoho plynule mění s hodnotou druhého; sklon proto uvádíme při zvolených hodnotách uvnitř dat. Other bullets unchanged. |
| 27 | Transfer commitment (old 23) | Závěrečná otázka | **Broaden** the question from „liší mezi skupinami“ to „závisí na skupině nebo na hodnotě jiného znaku“. **Add one possible answer** with a numeric moderator (e.g. growth with temperature depending on soil moisture). |
| 28 | Term reference (old 24) | Slovníček pojmů | Retain. |

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Rows 1–18 | Unchanged from the 2026-10-15 ledger | Unchanged | Unchanged | Unchanged |
| New data / 19 | `read.csv()`, `str()`, `summary()`, column arithmetic (L00–L02); one unit per row | Second dataset in one lesson; unit conversion in code; one tree per row; geometric expectation | Any model result for trees | Runnable code with output; question box with answer |
| Conditional view / 20 | L07 additive model with two numeric predictors and correlated predictors; rows 7–8 (parallel lines as an assumption) | Height bands as a *display* device for a numeric predictor; additive model gives one common diameter slope | That bands are part of the model; interaction coefficients for trees | Four-panel figure with parallel lines; `mod_aditivni` code |
| Interaction model / 21 | Rows 9–11 (`*` = main terms + `:`, prediction at a common value), `predict()`, `expand.grid()` from the four-group predictions in row 17 | Slope of one numeric predictor as a linear function of the other; predictions at chosen values inside the data | Centring; model selection between the two tree models | Model code, four-panel figure with reference line, inline slopes, prediction table |
| Coefficients / 22 | Row 11 (conditional coefficients at the reference group or zero), `confint()` (L04) | Main coefficient at 0 m is outside the data; symmetric reading of the interaction | Causation; log-scale model fitting (only in the optional box) | `summary()` rows, inline slopes for height, `confint()` row |
| Ending / 23–28 | Whole lesson | Three-case rule „při jaké délce / v jaké formě / při jaké výšce?“; scale dependence shown on real data; recap and transfer | R², adjusted R², AIC (L09) | Comparison paragraph, extended scale box, spine answer, recap, closing question |

## Implementation and review contract

- Keep every rule from the 2026-10-15 contract (palette, Czech decimals via `R/format_value_cz.R`, `theme_biostat()`, `fig-alt`, Czech step comments, named arguments, line breaks after `<-`, no hand-typed computed values).
- Trees: new object names `data_stromy`, `mod_aditivni`, `mod_stromy`, `prumery_porovnani_cm`, `vysky_porovnani_m`. Height bands are a hidden figure helper, not a student object. Panel figure uses data grey for points and model purple for lines; the reference line is grey and dashed. Every line spans only the diameters observed in its band. Build the panel figure once as a named object so the presentation can reuse the same construction.
- Visible code reads `data/stromy.csv` only, and must run from a clean session with that file alone.
- Glossary on first occurrence in the new rows: `numericka-promenna` or `spojita-promenna` where predictor type is named, `sklon`, `interakce-predikatoru`, `odhadnuta-hodnota`, `transformace` in the scale box.
- No residual plot, centring or model comparison for trees.
- Order: implement, clean-session run of every visible chunk, canonical HTML and PDF render, visual check of both four-panel figures, glossary-coverage pass, separate read-only vision review, then human review.

## Implementation notes (2026-10-17)

Headings 19–22 and their order are implemented as approved. Deviations and additions:

| Row | Approved | Implemented | Reason |
|---|---|---|---|
| 24 | Co tedy můžeme říct o krabech? | Co tedy můžeme říct o krabech a stromech? | The section now also answers the tree question; the old heading would hide it. |
| Front matter | Subtitle unchanged (not in map) | „Interakce číselného a skupinového znaku, dvou skupinových i dvou číselných znaků“ | The old subtitle listed only the two crab combinations. |
| 23 (scale box) | Add one tree paragraph | Also changed „V této lekci popisujeme odezvu v milimetrech“ to „V příkladech s kraby…“ | The tree response is in m³, so the old sentence became false. |
| 19 | Provenance box | Provenance and the code that recreates `stromy.csv` in one collapsed box | Mirrors the crab box „jak vznikl soubor krabi.csv“; verified to reproduce the CSV exactly. |

- Shared figure helpers `R/Functions/build_tree_bands.R` and `R/Functions/plot_tree_panels.R` draw both four-panel figures; the presentation will source the same helpers.
- Validation: canonical HTML and PDF render passed without warnings (36 pages); new pages 28–35 inspected visually, panel tick labels separated after adding panel spacing; every visible tree chunk ran in a fresh `Rscript --vanilla` session from `data/stromy.csv` alone; the provenance code reproduces `data/stromy.csv` exactly; no `NA` or error text in the rendered pages.

## Independent review (2026-10-17)

- Reviewers: read-only vision review with `.ai/agents/vision-corrector.md` (Sonnet, balanced effort: complete-lesson review) and glossary-coverage review with `.ai/agents/glossary-coverage-reviewer.md` (Haiku: bounded check).
- Vision review: tree statistics verified correct; crab text untouched. Resolved: grey reference line clipped to the lowest band's diameters (no extrapolation); `coef(mod_stromy)` printed right after the fit, followed by the slope formula, a worked substitution at 21 m and the compact form β₁ + β₃v; log-scale claim softened with a bridge sentence; explicit caveat that residuals and influence were not checked for trees and that curvature is a possible alternative; wording, units and conversion comments; conditional inline interval sentence; „na původním měřítku objemu“ in the answer; outcome 3 extended to „skupiny nebo různé hodnoty prediktoru“.
- Heading changes from review: row 20 „Je sklon průměru stejný u nízkých i vysokých stromů?“ → „Vystihne společný sklon nízké i vysoké stromy?“ (avoids two near-identical questions in a row); row 21 „Model s interakcí nechá sklon průměru měnit se s výškou“ → „Model s interakcí dovolí, aby se sklon průměru měnil s výškou“ (natural Czech, parallel to the crab heading).
- Map consistency: row 22 implemented with `coef()` + `confint()` instead of `summary()`; row 20 describes the low band as thin trunks above and thick trunks below the line.
- Not changed, author decision needed: the lesson title „Mění se vztah mezi dvěma znaky podle skupiny?“ is now narrower than the content; changing it affects the website, README and presentation title slide.
- Glossary review: 12 missed first-occurrence-per-section links added (`korelace`, `prediktor` ×4, `median`, `sklon` ×4, `interakce-predikatoru` ×2, `odhad`, `interval-spolehlivosti`); no slug or display errors.

## Human review

- Learning materials approved by Ondřej Mottl on 2026-10-17 („I approve the learning materiasl.“).
- Lesson title changed by author decision on 2026-10-17 („I like Kdy vztah dvou znaků závisí na třetím?“) from „Mění se vztah mezi dvěma znaky podle skupiny?“; updated in `skripta.qmd` and `README.md`. The README subtitle, description, outcomes, download table and data notes now include the tree example.

## Author audit

- Heading strip 19–22 reads as one question → evidence → model → interpretation sequence. Each heading is a content question or claim, without internal labels.
- The geometric expectation (row 19) comes before any tree figure. Height bands are explained as a display device before the first panel figure.
- No new row needs a later concept, and no new R function is introduced: `expand.grid()` and `predict()` are reused from the four-group example (row 17).
- Both crab examples and their numbers are untouched; rows 23–27 only extend the existing text.
