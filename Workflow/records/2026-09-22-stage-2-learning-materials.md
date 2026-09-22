# Stages 2-3 - Learning Materials and Human Review

## Metadata

- Week: L08
- Date: 2026-09-22
- Author: AI assistant
- Reviewer: Ondřej Mottl (story maps and current completed learning materials approved 2026-09-22)

## Git checkpoint

- Stage group: Stages 2-3 written materials
- Branch: `lesson/l08-skripta`
- Base branch and commit: `main` at `7b5be62` (merged Stages 0-1 PR #1)
- Stages 0-1 PR merged: [x]
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x] (clean)
- Written-materials PR: not created

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: Modern Statistics with R for a model-based teaching sequence; PH525x interactions and contrasts for showing how a group difference changes; CUNY Biostatistics for a biological question before model syntax.
- Structural pattern borrowed: biological question → observed data → familiar additive prediction → visually motivated interaction → predictions at shared predictor values → coefficient interpretation → model check and qualified conclusion.
- Adaptation: first, one crab colour form with two sex groups; then both colour forms crossed with sex, using carapace length as a new outcome. Czech anatomical labels and base-R student code remain visible. The first interaction is earned through predicted widths; the second through four observed groups and their within-form contrasts.
- Not reused: PH525x matrix algebra, CUNY's broad ANCOVA/model-selection sequence, automated term deletion, and any source's package-heavy visible code.

## Mandatory story map

- Artifact: Learning materials (`Learning_materials/skripta.qmd`)
- Granularity: one row per major section or concept block
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-22
- Approval decision and requested revisions: original 13-block map approved as written; after human feedback, the separate complete 18-block map and ledger in `2026-09-22-stage-2-categorical-expansion-proposal.md` were explicitly approved on 2026-09-22. The requested revisions were a `summary()` reading guide, all four coefficient meanings, and a second interaction with two categorical predictors.

`Internal role` and `Speaker note` are backstage planning text. `Student-facing heading` contains proposed headings only; no full student-facing prose is drafted here.

| Order | Internal role | Student-facing heading | Speaker note |
| --- | --- | --- | --- |
| 1 | Biological opening question | Liší se vztah délky a zadní šířky krunýře mezi samicemi a samci? | Show two similarly long crabs or a simple measurement sketch. Ask about a relationship, not whether one sex is generally larger. Do not imply a causal sex effect. |
| 2 | Bridge from the previous lesson | Kdy předpovídají dvě přímky stejný sklon? | Recall the additive model's parallel lines from the preceding lesson using a compact schematic. Students need only identify what remains the same across groups; the knotweed data are not the new analysis dataset. |
| 3 | Learning outcomes | Co se v této lekci naučíte | State the three approved outcomes as observable actions: recognize an interaction question, fit and plot a simple interaction model, interpret predictions and conditional coefficients. |
| 4 | Introduce the study and observation unit | Jeden řádek tabulky představuje jednoho kraba | Attribute Campbell and Mahon (1974) and the `MASS::crabs` package; explain the blue-form subset, one crab per row, sex, carapace length and rear width. A sourced anatomy sketch may help, but any third-party image needs item-level reuse review. |
| 5 | Rehearse the ordinary data check | Které délky a šířky jsou v datech zastoupené? | Show a small table and transparent code for columns, types, representative values, missingness, group sizes and plausible ranges. Establish 30 mm as an observed comparison length inside both sex ranges, not as a discovered result. |
| 6 | First data visual and noticing task | Jak souvisí délka a zadní šířka krunýře? | Scatterplot individual crabs, then distinguish sex with stable colours. Ask what changes with length and whether the two clouds seem to have the same slope; describe observation before naming an interaction. |
| 7 | Familiar additive baseline | Rovnoběžné přímky předpokládají společný sklon | Fit and plot the familiar additive model on the same data. Ask what its parallel-line assumption means for the female–male width difference at different lengths. This is a conceptual comparison, not L09 model ranking. |
| 8 | Motivate and name the new relation | Mění se rozdíl mezi samicemi a samci s délkou krunýře? | Place the additive prediction beside the observed pattern and a proposed pair of nonparallel lines. Only after the plain-language comparison name an interaction of length and sex. |
| 9 | Fit and visualise the interaction | Model s interakcí dovoluje samicím a samcům různé sklony | Create a Czech-named length offset from 30 mm, fit a single `lm(odezva ~ delka_od_30_mm * pohlavi)` model, and plot each group's predictions only across its observed length range. Explain that zero on this offset means a 30 mm crab; show syntax after the visual idea. |
| 10 | Interpret shared-length predictions | Jakou zadní šířku model odhaduje při délce 30 mm? | Compute both predictions from the fitted model, show them in one two-row table and mark them on the graph. Then use a second within-range length to show that the female–male predicted difference changes. Keep all data-derived numbers computed from the model. |
| 11 | Interpret conditional coefficients and misconception | Co znamenají koeficienty při referenční délce 30 mm? | Use the model output and predictions to explain the female reference width at 30 mm, the male–female contrast at 30 mm, the female slope and the slope difference. Show the confidence interval for the slope difference as uncertainty, without making a p-value the main result. Misconception checkpoint: the `pohlavi` coefficient is not a sex difference at every length. Avoid leading with an abstract four-term equation. |
| 12 | Model check and limits | Jak dobře přímky popisují naměřené kraby? | Use an observed-versus-fitted view or residual plot and a proportionate influence check. Recall existing diagnostic ideas; note that a good-looking fit does not establish a random sample, causality, or validity outside observed lengths. |
| 13 | Qualified biological conclusion and next question | Co lze vyvodit o tvaru krunýře samic a samců? | Summarise the direction and size of the group-specific relationship, its uncertainty and observational limits in biological units. Close with the question of how to choose among biologically justified models; reserve R², adjusted R² and AIC for the next lesson. |

## Knowledge-state ledger

Read each row as the state **before and after** its matching story-map block. A question may foreshadow an idea; an answer may use only evidence already shown or supplied in that block.

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
| --- | --- | --- | --- | --- |
| 1 — Biological question | Students know that a numerical trait can vary among individuals and groups. | A specific question about whether a length–width relationship differs between female and male crabs. | Any measured difference, model result, or causal mechanism. | Concrete crab measurements or a labelled anatomical sketch. |
| 2 — Prior-lesson bridge | Students have seen a two-predictor additive model and parallel prediction lines in the previous lesson. | Parallel lines mean a common slope; the group difference remains constant as the numeric predictor changes. | That the same pattern holds for crabs, or the name and coefficients of an interaction. | A compact recreation of the familiar parallel-line schematic and a retrieval question. |
| 3 — Outcomes | The question and familiar common-slope idea are available. | The learning actions and their scope. | A solution, a significant interaction, or the full formula. | Plain-language outcome list linked to the opening question. |
| 4 — Data source and unit | Students know rows, variables, sex groups and measurements in broad terms. | One row is one blue-form crab; rear width and carapace length are in millimetres; sex is a group label; source and sampling limits. | Independence beyond the one-crab-per-row structure, representative sampling, or data patterns. | Package citation, source note, measurement sketch and a few labelled rows. |
| 5 — Data inspection | The unit and variables have been named. | Types, missingness, group counts and observed lengths; 30 mm is a valid shared-length comparison. | A slope difference or biological conclusion. | `str()`, a small row preview, missingness and group/range summaries in visible code. |
| 6 — Observed relation | Students can read a scatterplot and know the two measured quantities. | What the plotted individual crabs suggest about length, rear width and sex groups. | That a model confirms different slopes, that the pattern is causal, or that every length is equally supported. | Points coloured by sex, with readable axes and a noticing prompt. |
| 7 — Additive prediction | Students know `lm(y ~ x + skupina)` and common-slope lines from the previous lesson. | The model-imposed constant group difference and parallel lines on the crab data. | Formal model selection or proof that the additive model is wrong. | Fitted additive lines over the observed points and a same-length comparison prompt. |
| 8 — Interaction idea | Students have compared observed points with the additive line shape. | A changing between-sex difference across length; the term *interakce prediktorů* names this question. | Product-term algebra or individual coefficient interpretation. | Side-by-side/common-axis visual comparison and a prediction question. |
| 9 — Interaction fit | Students know the visual meaning of different slopes and how to fit a simple `lm()`. | Offset length makes 0 correspond to 30 mm; `*` allows group-specific slopes; predictions remain tied to observed ranges. | That a single coefficient describes a sex difference everywhere, or that fit implies causal explanation. | Visible Czech-named code, model output and two model prediction lines. |
| 10 — Predictions | Students know the interaction model and the shared reference length. | Predicted female and male widths at the same length, plus a changing difference at another observed length. | That predicted values are observations or that a 30 mm difference applies at all lengths. | Model-derived two-row table and labelled points on the prediction graph. |
| 11 — Coefficients | Students have interpreted concrete predictions and know reference groups from earlier lessons. | Conditional meaning of intercept, sex contrast at 30 mm, reference-group slope, slope-difference term, and uncertainty in that difference. | Mechanical reading of each coefficient as an independent global effect. | Match each output row to the already seen prediction table and lines; misconception checkpoint. |
| 12 — Checks | Students know residuals and simple diagnostic plots from earlier lessons. | A fit check, influence awareness, observed-range boundary, and sampling limits for this particular model. | That diagnostics prove model truth or establish a causal sex effect. | Residual or observed-versus-fitted plot, influential-point check and source description. |
| 13 — Conclusion | Students have the observed pattern, predictions, conditional estimates, uncertainty and limits. | A qualified biological statement and the reason to compare a small set of justified models next time. | R², adjusted R², AIC, nonlinear alternatives or extrapolated claims. | A compact evidence card in original units and a model-choice question without new metrics. |

## Story-map audits before human approval

- Heading strip: read rows 1–13 without backstage notes. The opening asks a biological question; the prior-lesson callback precedes outcomes; headings move through data, observed pattern, familiar model, new relation, prediction, interpretation, checks and conclusion. No heading exposes a workflow-stage label or assumes a concept earned only later.
- First-use sequence: *interakce* is named in block 8 after the visual contrast; `*` syntax appears in block 9; conditional coefficients follow concrete same-length predictions in blocks 10–11; model-choice metrics are deferred to the next lesson.
- Scope audit: no claim that sex causes the shape difference; the source does not establish a probability sample. The analysis stays with one continuous predictor and one binary group within the blue colour form.
- Human review point: please assess the 30 mm centring step and the number of concept blocks before full prose is drafted.

## Stage 2A - Structural draft

- Story map completed and explicitly human-approved before full prose: [x]
- Section order complete: [x] (the QMD follows the approved revised 18-section order; the first 12 sections preserve the original arc)
- First visual/table included: [x]
- First interpretation prompt included: [x]
- Misconception checkpoint included: [x]
- Bridge to next concept included: [x]

### Structural draft notes

- Opening biological question: Does the rear-width relationship with carapace length differ between female and male blue-form rock crabs?
- First data moment: inspect the observational unit, three teaching variables, missingness, group sizes and shared length range before plotting.
- Where the model-based framing first appears: recall additive parallel lines in block 7, after the observed scatterplot.
- First complete draft: `Learning_materials/skripta.qmd` with student-visible base R, observed crab points, additive and interaction predictions, a two-row shared-length comparison, a worked coefficient calculation, and a residual check.

## Stage 2B - Development pass

- Major concept blocks have visual anchors: [x]
- Interpretation prompts expanded: [x]
- Explanatory payoff text improved: [x]
- Transitions revised for self-study readability: [x]
- Glossary markup checked where relevant: [x]

### Development pass notes

- Which concept block improved most: the shift from parallel lines to group-specific slopes now has a separate visual before the interaction is named.
- Which visual or comparison became the main anchor: the reference-length comparison combines a two-row prediction table with marked points on both fitted lines.
- Where the lesson still feels thin: the observational source supports only a qualified association; it does not supply a sampling design for population-level claims.

## Quality check notes

- What improved most: the biological question now leads through observed points, a familiar additive fit, an exploratory nonparallel visual, a single interaction model, shared-length predictions, and a conditional coefficient interpretation.
- What remains weak: source sampling details are limited, so generalisation remains cautious.
- Independent read-only vision review found five substantive issues: equation stages, visual motivation, marked predictions, Cook threshold explanation, and hidden `lapply()`. All five were corrected and confirmed resolved in a read-only follow-up.
- A direct glossary first-use audit was completed against the local `slovnik/pojmy.yaml`; known terms were wrapped at section first use.
- HTML and PDF rendered through `Rscript R/render_skripta.R`; the PDF was inspected visually and its text screened for page overflow. The original approved-scope PDF had 13 pages, the coefficient-expansion PDF 14 pages, and the two-example PDF 21 pages before the optional `emmeans` additions. The optional Extra is collapsed by default in HTML.
- The isolated `renv` library was restored and the lockfile updated for MASS, glossary, font packages, and their required dependencies. A fresh `renv::status()` reports no issues.
- Human review requested an additional useful Extra after seeing the first draft. A foldable, optional comparison of centred and uncentred crab models was added within approved concept block 11; it shows the same predictions with different reference-coefficient meanings.
- The complete revised QMD received a fresh independent read-only vision review with no findings. The author confirmed the Extra renders in both formats and `all.equal()` returns `TRUE`.
- Human feedback on 2026-09-22 requested `summary()` in the interaction model, explicit interpretation of all four coefficients, and a second interaction with two categorical predictors. The first two requests were implemented within approved block 11; HTML and PDF rendered successfully. The complete revised story map and knowledge-state ledger for the structural expansion are in `2026-09-22-stage-2-categorical-expansion-proposal.md`; they were separately approved before new student-facing prose.
- Ondřej Mottl explicitly approved the complete revised 18-block story map and knowledge-state ledger on 2026-09-22, including both colour forms and the categorical-by-categorical interaction. Full student-facing drafting of blocks 13-18 began only after that approval. He requested English for conversation; the student-facing lesson remains Czech.
- The completed second example uses the full `MASS::crabs` data (four cells of 50), a raw-data and mean comparison, a difference-of-differences derivation, `lm(delka_krunyre_mm ~ forma * pohlavi)`, all four conditional coefficient interpretations, four model predictions, a model-based interval and within-group residuals. The final synthesis reports both examples in millimetres.
- A new independent read-only vision review found three credible issues: hidden `tapply()`, a qualitative-only final synthesis, and three missed glossary first uses. Grouped `dplyr` code, dynamic numerical evidence and the glossary markup resolved all three; the same reviewer confirmed no remaining findings in a focused follow-up.
- Rendering revealed blank HTML glossary definitions for overlapping slugs (`linearni-model` and `odhad`). The canonical `_brand/R/Functions/render_glossary_term.R` was changed to use exact YAML keys, then regenerated into L08. The final HTML contains nonempty tooltips and glossary-table entries; PDF retains plain text. This is a separate `_brand` repository change with L08 as its integration check.
- Human review requested two foldable `emmeans` Extras: one computes female and male predicted widths plus their contrast at two observed lengths from `mod_interakce_30mm`; one computes all four predicted lengths and within-form sex contrasts from `mod_formy`. They reuse the L06/L07 teaching pattern and stay inside approved concept blocks 11 and 16. `emmeans` and its dependencies were installed in the isolated L08 library and captured in `renv.lock`. A targeted check found both sets of EMMs identical to `predict()` and confirmed contrast directions and values. The complete QMD received a fresh independent read-only vision review; its two low-severity glossary first-use findings were corrected and confirmed resolved in a focused follow-up.
- Human review requested that the residual boxplot show the observations. It was replaced by sex-coloured violins with seeded jittered points for every crab, and the text now explains the width and points. A focused independent source review found no figure or explanation issue; its missing-glossary-slug finding was addressed with the required TODO. The 24-page PDF and HTML rendered successfully, and page 24 was visually checked for point legibility.
- Human feedback on 2026-09-22 requested explicit female and male data frames with `summary()` for each, and a new teaching order: inspect and plot observations, fit the interaction, then choose reference lengths and interpret centred coefficients. The explicit data-frame change is in the QMD; HTML and the 23-page PDF rendered successfully, and the two `summary()` outputs on PDF page 4 were checked. Ondřej Mottl explicitly approved the complete revised story map and knowledge-state ledger in `2026-09-22-stage-2-reference-order-proposal.md` before the sequence rewrite. Blocks 5 and 9-11 now show the observations and scatterplot, fit the interaction on original length, choose 30 and 35 mm, then centre at 30 mm and explain `summary()` and the four coefficients. The original and centred fits have identical fitted values, residuals and predictions at both chosen lengths in a targeted numerical check.
- Human feedback requested an explicit expansion of the `*` operator in a model formula. Block 9 now shows the crab-variable expansion before the general `x * y` = `x + y + x:y` rule. A focused independent read-only review found no issues; HTML and the 23-page PDF rendered, and PDF page 7 was visually checked.
- Human feedback requested `summary()` of the original-length interaction model before centring, with `mod_interakce` for the original fit and `mod_interakce_30mm` for the centred fit. Block 11 now compares the original 0-mm coefficients with the 30-mm interpretation before the existing diagnostics section. The complete QMD received an independent read-only review; its intercept wording and stale workflow model-name findings were corrected. HTML and the 24-page PDF rendered successfully. The raw `summary()` and its explanation were inspected on PDF pages 9-10; an intentional page break keeps the centred `summary()` and all coefficient rows together on page 11. A fresh R check confirmed that the original and centred fits have identical fitted values, residuals, and predictions at 30 and 35 mm, while the sex coefficient changes from +1.97 mm at 0 mm to -1.76 mm at 30 mm. The independent reviewer confirmed both wording and record corrections.
- Latest human feedback: the 30 mm shift made the lesson confusing. The current draft keeps only `mod_interakce` fitted to the measured length in millimetres. The 30 and 35 mm values are selected after the observed data and model, solely for comparing predictions; block 11 explains `summary(object = mod_interakce)` and all four original-scale coefficients, then computes the 30 mm contrast without fitting a second model. The centred model, its Extra, and all dependent object references were removed. The complete 18-block story map and ledger in `2026-09-22-stage-2-reference-order-proposal.md` were updated before prose changes; this is an author-directed simplification within the approved block order. An independent read-only complete-artifact review identified an incomplete equation progression; the collapsed arithmetic and symbolic final stage were added, and the reviewer confirmed the four-stage sequence from the supplied excerpt. The reviewer could not re-open the file because the read-only helper failed at startup. A rounding note was added after the follow-up.
- Latest human flow review: Ondřej questioned why the first example predicted at two lengths when its marked figure used only 30 mm. A complete student-order audit found redundant 35-mm calculations, alternating female-minus-male and male-minus-female signs, lingering references to abandoned centring, a prominent comparison with 0-mm extrapolation, and a synthesis heading placed before the second model diagnostic. The author-directed correction keeps one worked 30-mm comparison, uses male minus female throughout, explains changing contrast through the slope difference, asks how the second model captures the observed contrast, and moves cross-example synthesis after its diagnostic. The matching 18-block story map and ledger were revised before student-facing prose. An independent read-only complete-artifact rereview found no credible issues; a focused follow-up confirmed the simplified prediction code and conditional `emmeans` Extra. HTML and the 21-page PDF rendered successfully; the 30-mm figure on page 8 and complete `summary()` on page 9 were visually checked, with no text outside page bounds.
- Latest human review requested three connected refinements: highlight the 30-mm contrast as the main result; begin coefficient interpretation by expanding the familiar additive formula with `delka_krunyre_mm:pohlavi` before introducing `*`; and reuse the exact four-group raw-data figure with only means and within-form connectors added. The story map and ledger were updated before prose. The 30-mm result now has a dedicated result box, the coefficient arithmetic explicitly recalls that same value, and the categorical figure stores and reuses one seeded raw-point plot. A fresh independent complete-source review found no issues. HTML and the 22-page PDF rendered successfully; the result box and formula callback on pages 8-9 and the paired categorical figures on pages 15-16 were visually inspected, with no text outside page bounds.
- Remaining human review focus: pacing of the two examples and the final biological synthesis.

## Stage 3 - Human review gate

- Finished headings and transitions compared with the story map: [x]
- Heading-strip, visible-copy, and first-use audits completed: [x]
- Lesson-vision review completed: [x]
- Glossary-coverage review completed: [x]
- Human review completed: [x] (Ondřej Mottl explicitly approved the current learning-materials version on 2026-09-22)
- Credible findings resolved: [x] (the independent complete-artifact flow review and focused follow-up found no remaining issues)
- HTML/PDF rendered and checked: [x] (the final source rendered to HTML and a 22-page PDF; the highlighted 30-mm result and formula callback on pages 8-9 and the paired categorical figures on pages 15-16 were visually checked, with no text outside page bounds)
- Reviewer decision: earlier flow and equation findings were resolved. After the latest result-emphasis, formula-callback, and figure-reuse edits, a fresh independent complete-source review found no issues in headings, first use, signs, equations, object dependencies, or the reused plot. The reviewer did not run R or inspect the PDF; the author rendered both formats and visually inspected the affected pages.

## Decision

- [x] Written materials are review-ready for human review
- [x] Story-map status is `complete`
- [x] Human story-map approval is `approved` and recorded
- [x] Current written materials approved by Ondřej Mottl on 2026-09-22
- [x] Diff contains only Stages 2-3 sources, their locked dependencies, records, and corresponding outputs
- [ ] Written-materials PR ready to merge
- Notes: Ondřej Mottl approved the original 13-block map, the expanded 18-block map, and the reference-order map with their ledgers on 2026-09-22. His feedback removed the 30 mm shift and then narrowed the illustration to one 30-mm comparison: the current draft follows data → one original-scale model → one same-length prediction pair and retains both optional `emmeans` examples. Final HTML/PDF render passed; targeted R checks confirmed that `predict()`, the coefficient expression, and conditional `emmeans` give the same 30-mm male-minus-female contrast. The latest independent complete-source review found no remaining issues after the highlighted result, formula callback, and reused-figure revisions. Human review is complete: Ondřej Mottl explicitly approved the current learning-materials version on 2026-09-22. The shared glossary fix is an uncommitted change in `_brand` as well as its generated L08 copy.
