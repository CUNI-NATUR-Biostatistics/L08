# L08 learning-material polishing story map

## Scope and approval record

- Artifact: complete `Learning_materials/skripta.qmd`, including retained optional material.
- Date: 2026-10-15.
- Branch: `polish/l08-before-teaching`; base: `949ca81`.
- Requested work: resolve findings A1–A6 and B1–B6 in [the review](2026-10-15-polish-review.md), with decisions D1–D3 recorded there.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-15.
- Decision and requested revisions: explicit user decision „I approve both presentation and learning materials“ (2026-10-15), recorded separately for each map; no revisions to rows or ledger.
- Preserve the blue-form crab data story, the additive → interaction sequence, the 30 mm worked comparison with its four-stage equations, the second (form × sex) example with its rozdíl-dvou-rozdílů equations, and all optional boxes (hierarchický princip, `summary()` reading, both `emmeans` boxes, podpora dat, měřítko odezvy). This is a polishing pass, not a new stage sequence.

## Complete story map

One row per major section or concept block. Headings are planned student-facing headings, not full prose. Unchanged headings are marked „retain“.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Biological opening and spine question | Liší se vztah délky a zadní šířky krunýře mezi samicemi a samci? | Retain the two-crab thought experiment. New paragraph (D1): Campbell a Mahon (1974) zjistili, že se pohlaví liší zadní šířkou krunýře vzhledem k jeho délce; zadní část krunýře leží nad zadečkem, pod kterým samice nosí vajíčka. Biological expectation stated as a possibility only: if females need relatively more room as they grow, the sex difference could change with size. Spine question in `box-question`. Observational caveat retained. |
| 2 | Recall of the additive model | Kdy předpovídají dvě přímky stejný sklon? | Retain the recall box and its answer. Remove „Teď“. |
| 3 | Learning contract | Výsledky učení | Shared five-item list from the review; „Po prostudování této lekce budete schopni:“. Replaces „Co se v této lekci naučíte“. |
| 4 | Data entry | Jeden řádek tabulky představuje jednoho kraba | CSV link (stable lesson route), save-to-`data/` instruction, visible `read.csv(file = "data/krabi.csv")` with `root.dir`, selection of the blue form and renaming with Czech step comments. Species wording: dvě barevné formy, které autoři studie považují za samostatné druhy. Provenance box keeps the citation and adds the MASS/GPL note. |
| 5 | Data inspection | Které délky a šířky jsou v datech zastoupené? | Retain `str()`, missing values, per-sex `summary()`. Ranges and counts inline with Czech decimals. |
| 6 | Whole-data reading | Jak souvisí délka a zadní šířka krunýře? | Base-R scatter with the categorical palette (samice terracotta, samec steel blue), explicit text sizes, `fig-alt`. Noticing prompt retained; *sklon* glossed. |
| 7 | Familiar additive model | Rovnoběžné přímky předpokládají společný sklon | Retain; brand theme, `fig-alt`. |
| 8 | Visual case for different slopes | Mění se rozdíl mezi samicemi a samci s délkou krunýře? | Retain; prediction box and its answer; *interakce prediktorů* named after the prediction. Remove „Nyní“. |
| 9 | Interaction model | Model s interakcí dovoluje samicím a samcům různé sklony | Retain; *sklon* glossed; figure with brand theme and `fig-alt`. |
| 10 | Worked comparison at one length | Co model předpovídá pro stejně dlouhou samici a samce? | Named `delka_porovnani_mm` used in prose, box title, figure and code; neutral object names (`data_porovnani`, `rozdil_porovnani`). Larger figure with `fig-alt`. Czech decimals. |
| 11 | Coefficients | Co znamenají koeficienty modelu s interakcí? | Retain order: formula expansion → `summary()` → four-row reading → four-stage equations → general symbols → slope CI. Math via `format_value_cz(math = TRUE)`. Retain the three optional boxes; glossary for *nejistota*, *reziduální směrodatná odchylka*, *porovnání modelů*. |
| 12 | Model check | Jak dobře přímky popisují naměřené kraby? | Retain transparent `fitted()`/residual plot with explicit text sizes and `fig-alt`; „residuum/residua“ throughout. New sentence stating what this plot shows: no systematic curvature and similar spread along the fitted values. Retain podpora-dat box. |
| 13 | First answer to the spine question | Co ukázal první příklad (box) | Retain box; add one sentence linking the result to the expectation from row 1 (female rear width grows faster with length), with the observational limit. |
| 14 | Second question | Liší se rozdíl v délce krunýře mezi pohlavími u obou barevných forem? | Reframe (D1): u mnoha živočichů se velikost samců a samic liší a tento rozdíl nemusí být u příbuzných skupin stejný. Visible caveat: autoři vybrali 50 krabů do každé skupiny, takže průměrné délky závisejí na tom, které kraby sesbírali; example teaches reading the model. Data from the same CSV object. |
| 15 | Raw four-group view | Jaké délky krunýře vidíme ve čtyřech skupinách? | Retain; categorical palette, `fig-alt`. |
| 16 | Difference of differences | Jak model zachytí změnu rozdílu mezi pohlavími podle formy? | Retain figure and the three-stage equation; Czech decimals in math. |
| 17 | Four coefficients | Co znamenají čtyři koeficienty modelu se dvěma skupinovými znaky? | Retain; Czech decimals; retain `emmeans` box. |
| 18 | Group check | Co o jednotlivých krabech čtyři průměry neříkají? | Retain violin plot with `fig-alt` and palette; „rezidua“. |
| 19 | Common thread | Kdy potřebujeme při výkladu modelu uvést další prediktor? | Retain comparison paragraph; *prediktor* glossed; retain the scale box. „Co si odnést“ moves to row 22. |
| 20 | Answer to the spine question | Co tedy můžeme říct o krabech? | New. Opening question verbatim; computed slopes, difference at the comparison length, change per 1 mm with CI; second example in one sentence with the sampling limit; association, not causation. |
| 21 | Bridge | Co bude následovat dál | Additive and interaction models are two candidate descriptions; the next lesson asks how to choose between biologically justified candidates. |
| 22 | Earned recap | Shrnutí | Five bullets mirroring the outcomes. Replaces „Co si odnést“. |
| 23 | Transfer commitment | Závěrečná otázka (H3 under Shrnutí) | Same as the deck: „Uveďte biologickou otázku, u které byste čekali, že se vztah dvou znaků liší mezi skupinami. Jak by vypadal graf?“ Collapsed possible answers. |
| 24 | Term reference | Slovníček pojmů | HTML glossary table and PDF online fallback (unchanged mechanism). |

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Opening / 1–3 | L03–L05 one-predictor `lm()`, slope, CI; L06 categorical predictor, reference level; L07 additive model with parallel lines, conditional coefficients | Spine question; sourced biological expectation that the sexes differ in rear width relative to length | Interaction term, that the difference actually changes in these data | Thought experiment, citation, recall box |
| Data / 4–5 | `read.csv()`, `factor()`, `str()`, `summary()`, `is.na()` | One crab per row; common length range of both sexes | Any model result | Runnable code with output, ranges inline |
| Additive vs. different slopes / 6–8 | Scatterplots, additive model | Parallel lines are a model assumption; a changing gap is a candidate pattern; *interakce prediktorů* named after the prediction | Interaction coefficients | Scatter, additive lines, separate lines, prediction box |
| Interaction model / 9–11 | Rows 6–8; `predict()`; CI meaning | `*` = main terms + `:`; predictions at one common length; coefficients as conditional quantities; general notation | Model comparison metrics | Model code, figures, prediction table, four-stage equations, `confint()` |
| Check and first answer / 12–13 | L03–L05 residual plots | What the residual plot does and does not show here; first answer to the spine question | Causation, generalisation beyond the sample | Residual plot, result box |
| Second example / 14–18 | Rows 9–13; L06 group coefficients and `emmeans()` | Two categorical predictors; difference of differences; reference combination; group check; sampling limit | Model selection, ratio-scale interactions (only in the optional scale box) | Four-group plot, means table, equations, `summary()`, `predict()`, violin residuals |
| Ending / 19–24 | Whole lesson | Shared rule „při jaké délce / v jaké formě?“; supported answer with limits; bridge; recap; transfer | R², adjusted R², AIC results | Comparison paragraph, spine answer, summary, closing question, glossary |

## Implementation and review contract

- Shared rules with the presentation map: sex palette `samice` `#009E73`, `samec` `#CC79A7` with 🔵/🟠 form labels in figures (revised D2, 2026-10-15; originally `#C2613A` / `#2E6CA4` without circles); data grey, model purple, interpretation orange; Czech decimals via `R/format_value_cz.R` (ported from L07); model names `mod_rovnobezne`, `mod_interakce`, `mod_formy`; named teaching input `delka_porovnani_mm`; data from `data/krabi.csv`; no hand-typed computed values.
- Source hygiene: L07 glossary setup with fallbacks; `theme_biostat()` and `biostat_cols`; `fig-alt` on every figure; Czech step comments, named arguments and line breaks after `<-` in visible code; objects created next to first use; unwrapped prose.
- Do not add model-comparison metrics, three-way interactions or new datasets.
- Order: implement, clean-session run of every visible chunk from `data/krabi.csv` alone, canonical HTML/PDF render, glossary-coverage pass, separate read-only vision review, full PDF inspection, then human review.
- Author audit: heading strip reads as a content narrative; the biological expectation precedes any data; *interakce prediktorů* first named in row 8 after the prediction; the sampling caveat precedes the second-example results; no row needs a later concept.

## Review-driven and author-requested amendments (2026-10-15)

Headings and order are unchanged except:

| Order | Approved heading | Implemented heading | Reason |
|---|---|---|---|
| 12 | Jak dobře přímky popisují naměřené kraby? | Jak dobře přímky popisují změřené kraby? | Natural Czech (presentation review). |
| 19 | Kdy potřebujeme při výkladu modelu uvést další prediktor? | Kdy musíme při výkladu jednoho prediktoru uvést hodnotu druhého? | Natural Czech (vision review). |

Other changes: sex colours bluish green / reddish purple and 🔵/🟠 form labels in figures (revised D2); softened rationale („zhruba nad zadečkem“, „poměrem zadní šířky a délky“); spine answer no longer states the mechanism or non-random sampling as fact; design counts computed inline; stage-1 equation split over four lines; glossary first occurrences completed. Author audit correction: *interakce* also appears in the title, subtitle and learning outcomes as a learning contract; its explanation is first earned in row 8.

## Author-requested amendment: boxes and data provenance (2026-10-15)

- Ondřej Mottl: „The learning outcomes should have the code to produce "data/krabi.csv" in Extra. Doplnující box has strange colors - check all boxes (compare to other lectures). I also think the Answers to Quaestions should be foldable and different color.“
- Row 4 gains a collapsed `box-data` „Doplňující: jak vznikl soubor krabi.csv“ with visible base-R code (`as.data.frame(x = MASS::crabs)`, checks, `write.csv()`), not evaluated during rendering; verified to give a table identical to `data/krabi.csv` after `read.csv()`.
- All six optional boxes switch from the lesson-specific `box-extra` (amethyst) to the course convention used in L05–L07: collapsed `box-data` titled „Doplňující: …“.
- Answers follow the L05–L07 convention: orange `box-question`, then collapsed `box-result` „Možná odpověď“. Converted: the recall box (row 2), the scatter prompt (row 6, new question box „Co vidíte v grafu?“), the additive-model prompt (row 7, „Co předpovídá aditivní model?“), the shape prediction (row 8, the term *interakce prediktorů* is still named after the answer) and the four-group means prompt (row 15, „Porovnejte obě formy“). Headings and order are unchanged.
