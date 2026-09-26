# Stages 4-5 - Slide Storyboard, Build, and Human Review

## Metadata

- Week: L08
- Date: 2026-09-22
- Author: AI assistant
- Reviewer: Ondřej Mottl (story map, ledger, and PollsLive approved 2026-09-22; generated-image revision requested 2026-09-23)

## Git checkpoint

- Stage group: Stages 4-5 presentation
- Branch: `lesson/l08-presentation`
- Base branch and commit: `main` at `679619b` (merged Stages 2-3 PR #2)
- Stages 2-3 PR merged: [x]
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x] (clean)
- Presentation PR: not created

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: Modern Statistics with R for a model-based data story; PH525x for interactions and contrasts; CUNY Biostatistics for beginning with a biological question.
- Visual pattern: students first see a changing contrast in data, then name the interaction, fit the model, and return to predictions in biological units.
- Adaptation: the approved crab examples remain the only data stories; short prompts alternate with evidence reveals and interpretation.
- Not reused: matrix algebra, automated term selection, causal language, and model-comparison criteria reserved for L09.

## Presentation vision

The deck makes one idea visible twice: the comparison associated with one predictor changes with the other predictor. Students first see nonparallel lines for carapace length and sex, then unequal sex contrasts across blue and orange forms. The 30 mm male-minus-female prediction contrast anchors the first half. The difference of differences anchors the second half.

The deck retains the approved written-material flow in shorter visual beats. It does not introduce a centred model. `summary(object = mod_interakce)` follows the fitted lines and 30 mm predictions. Optional `emmeans` material becomes one concise prediction workflow rather than a package tutorial.


## Generated illustration revision

On 2026-09-23, the human author identified that the approved deck had omitted the course's funny generated-image pass and explicitly requested the missing images plus a broader instruction audit. This substantive revision reopens Stage 5 for independent and human review.

- `Presentation/Materials/krabi_mereni.png`: a playful crab measurement station that grounds carapace length and rear carapace width before the raw-data plot.
- `Presentation/Materials/krabi_modely.png`: two crab-observed trail pairs that frame the closing choice between constant and changing group separation.
- `Presentation/Materials/krabi_ctyri_skupiny.png`: a balanced four-crab group that introduces the crossing of two color forms and two sexes before the categorical interaction example.
- All three illustrations use the same original paper-cut visual language, contain no generated prose, carry Czech alt text and visible AI disclosure, and serve a stated teaching role rather than decoration.
- Exact prompts, rejected variants, SHA-256 hashes, and provenance are recorded in `Presentation/Materials/GENERATED_IMAGES.md`.
- No statistical claim is supported by generated artwork; observed data and model-derived displays remain the evidence.

## Mandatory story map

- Artifact: Presentation (`Presentation/presentation.qmd`)
- Granularity: one row per slide, including section dividers and PollsLive slides
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-22
- Approval decision and requested revisions: approved; implement the exact three-question PollsLive block and retain the approved two-example interaction flow.

| Order | Internal role | Student-facing heading | Speaker note |
| --- | --- | --- | --- |
| 1 | Question-first title | Liší se vztah délky a zadní šířky krunýře mezi samicemi a samci? | Minimal question-first title; ask for intuition without showing a fit. |
| 2 | Measurement-context illustration | Co vlastně na krabovi měříme? | Funny generated crab-measurement scene grounds the two carapace dimensions; visible AI disclosure and no analytical claim. |
| 3 | PollsLive introduction | Co si pamatujete z minulé lekce? | Introduce three independent L07 retrieval questions before the L08 outcomes. |
| 4 | Retrieval question 1 | Co znamená záporný koeficient roční teploty v modelu s roční i maximální teplotou? | Read the conditional coefficient from familiar L07 evidence; reveal the answer and explanation after a vote. |
| 5 | Retrieval question 2 | Kterému odhadu z modelu se dvěma teplotami bychom měli více důvěřovat? | Choose the scenario inside the observed predictor cloud; reveal why joint support matters. |
| 6 | Retrieval question 3 | Prohodíme pořadí dvou korelovaných teplot ve formuli. Co se může změnit? | Distinguish unchanged coefficients and predictions from order-sensitive sequential tests. Bridge to additivity. |
| 7 | Learning outcomes | Výsledky učení | Recognize an interaction question, fit and visualize it, interpret predictions and conditional coefficients. |
| 8 | Section divider | Když rovnoběžné přímky nestačí | Sparse divider for the first data story. |
| 9 | Data orientation | Jeden bod představuje jednoho kraba | Source, blue form, one crab per row, length, rear width, sex. |
| 10 | Noticing prompt | Co naznačují naměření krabi? | Show blue-form raw points after data orientation; students describe direction, overlap, and whether the slopes look alike before modelling. |
| 11 | Familiar baseline | Aditivní model kreslí rovnoběžné přímky | Overlay additive fit; recall common slope and constant vertical difference. |
| 12 | Pair prediction | Zůstává rozdíl mezi pohlavími při každé délce stejný? | Think-pair-share comparing shorter and longer ends of the range. |
| 13 | Evidence reveal | Data naznačují různé sklony | Replace parallel lines with exploratory group-specific lines on the same axes. |
| 14 | Concept naming | Když se rozdíl mění, mluvíme o interakci | Name continuous-by-categorical interaction after the visual comparison. |
| 15 | Formalisation | Jak zapsat model s interakcí? | Start with `delka + pohlavi`, add the colon term, then reveal `x * y = x + y + x:y`. |
| 16 | Model fit and visual | Model s interakcí dovoluje dvěma pohlavím různé sklony | Visible `lm()` call; fitted lines over observations only across represented lengths. |
| 17 | Prediction prompt | Co model odhaduje pro dva kraby dlouhé 30 mm? | Mark 30 mm, which lies within both groups' ranges; ask which line is higher and by how much. |
| 18 | Evidence reveal | Dva odhady při délce 30 mm | Reveal two model predictions and confidence intervals. |
| 19 | Main result | Samec - zadní šířka - při 30 mm | Highlight male minus female in units and distinguish predictions from individual observations. |
| 20 | Spine return | Co už můžeme říci o stejně dlouhých krabech? | Return to slide 1: fitted relation and predicted difference depend on length; state observational scope. |
| 21 | Section divider | Koeficienty interakčního modelu | Move from predictions to model summary. |
| 22 | Output orientation | Jaké jsou koeficienty v `summary()`? | Map rows to intercept, reference slope, sex contrast, slope difference. Avoid a p-value hunt. |
| 23 | Coefficient interpretation | První dva koeficienty popisují referenční samice | Intercept at 0 mm is a mathematical reference; length coefficient is female slope in mm/mm. |
| 24 | Conditional main effect | Koeficient pohlaví porovnává skupiny při délce 0 mm | Explain why `pohlavisamec` is not the sex difference at every length. |
| 25 | Interaction coefficient | Interakční koeficient mění sklon samců vůči samicím | Build male slope as female slope plus interaction coefficient; show interval for slope difference. |
| 26 | Worked callback | Rozdíl při 30 mm skládají dva známé příspěvky | Restate the two contributions in words, substitute model-derived values, and only then introduce the compact symbolic formula. |
| 27 | Misconception check | Platí koeficient `pohlavisamec` při každé délce? | Quick vote: yes/no/only at 0 mm; require a one-sentence justification. |
| 28 | Model check | Jak dobře přímky popisují naměřené kraby? | Residuals versus fitted values plus an explicit scope sentence; diagnostics do not prove truth. |
| 29 | Qualified conclusion | U krabů 🔵 modré formy se rozdíl mezi pohlavími mění s délkou | Summarize both slopes, the change in difference, and the 30 mm contrast with 95% confidence intervals; retain the observational-scope caveat. |
| 30 | Section divider | Když jsou oba prediktory skupiny | Begin the second data story with a generated four-crab illustration that makes the 2 color forms × 2 sexes structure visible. |
| 31 | New question | Liší se rozdíl mezi pohlavími u 🔵 modré a 🟠 oranžové formy? | Use both forms and carapace length response; ask about a changing sex contrast. |
| 32 | Raw-data evidence | Jaké délky vidíme ve čtyřech skupinách? | Approved violin plus all points, without means or connectors. |
| 33 | Silent-write prompt | Je rozdíl mezi samci a samicemi u obou forem stejný? | One minute: write the direction of the sex contrast within each form. |
| 34 | Evidence reveal | Průměry ukazují dva různé rozdíly | Reuse slide 33 exactly; add only four means and within-form connecting lines. |
| 35 | Guided calculation | Jak velký je rozdíl samec minus samice v každé formě? | Students calculate or choose both contrasts; reveal in millimetres. |
| 36 | Conceptual payoff | Interakce je rozdíl dvou rozdílů | Subtract blue-form contrast from orange-form contrast with a bracket/arrow visual. |
| 37 | Formalisation | `forma * pohlavi` zapíše všechny čtyři kombinace | Show model and expansion; blue females are the reference combination. |
| 38 | Coefficient mapping | Čtyři koeficienty skládají čtyři skupinové průměry | Map rows to reference mean, form contrast among females, sex contrast in blue crabs, and difference of contrasts. |
| 39 | Predictions | Odhad pro každou ze čtyř skupin | Four predictions with intervals; a compact `emmeans()` call is a familiar route to them. |
| 40 | Model check | Rezidua jsou odchylky jednotlivých krabů od skupinových průměrů | Name the displayed quantities as residuals and use a violin plot with every point to show within-group spread. |
| 41 | Qualified conclusion | Rozdíl mezi pohlavími závisí na barevné formě | Direction and size of difference of differences with uncertainty; associative conclusion. |
| 42 | Section divider | Jedna myšlenka, dva obrazy | Prepare synthesis across both examples. |
| 43 | Comparison | Interakce mění sklon nebo skupinový rozdíl | Nonparallel-line visual beside connected-means visual; identify which contrast changes. |
| 44 | Transfer task | Co musíme doplnit, aby tvrzení o efektu bylo úplné? | Improve “délka má efekt” and “samci jsou větší” by stating the conditioning predictor/value. |
| 45 | Synthesis | Hlavní efekty v interakci jsou podmíněné | Biological dependency question, predictions/contrasts, and reference-relative coefficients. |
| 46 | Synthesis | Co si odnést | Consolidate the key ideas and evidence-supported answer to slide 1. |
| 47 | Closing question and L09 bridge | Který biologicky smysluplný model máme zvolit? | End with additive and interaction candidates side by side; preview R², adjusted R², and AIC without defining them. |

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
| --- | --- | --- | --- | --- |
| 1 — Hook and retrieval (1-7) | Scatterplots, categorical and multiple-regression coefficients, parallel additive lines, diagnostics. | Opening dependency question; conditional coefficients, supported predictions, sequential-test order. | The current crab data pattern, different crab slopes, or an interaction. | Generated measurement context followed directly by three L07 retrieval questions. |
| 2 — Additive to interaction (8-16) | `lm(y ~ x + group)` and parallel lines. | Current dataset orientation, its first data view, changing contrast, interaction, colon term, and star shorthand. | The 30 mm result or coefficient meanings. | Raw points after the outcomes, followed by additive and group-specific lines, pair prompt, and formula expansion. |
| 3 — Predictions (17-20) | Different slopes and 30 mm within both observed ranges. | Two 30 mm predictions and male-minus-female contrast −1.76 mm. | All four raw-scale coefficients. | Marked fitted-line predictions, intervals, spine return. |
| 4 — Coefficients and checks (21-29) | Fitted lines and the 30 mm contrast. | Four summary rows, conditional effects, male slope, repeated −1.76 calculation, limitations. | Model-selection criteria or causal explanations. | Annotated `summary()`, vote, calculation, residuals. |
| 5 — Four groups (30-36) | Interaction means a changing comparison. | Two within-form contrasts and their difference of differences. | Categorical-model coefficients. | Raw plot, exact reused plot with means/connectors, calculation. |
| 6 — Categorical model (37-41) | Observed pattern and difference of differences. | Formula, reference combination, coefficients, predictions, uncertainty, residual spread. | Causal form or sex effects. | Model, output, `emmeans()` predictions, residual violins. |
| 7 — Transfer (42-46) | One interaction of each predictor-type combination. | Every effect statement specifies the other predictor's value or level. | Formal model comparison. | Side-by-side visuals and statement repair. |
| 8 — L09 bridge (47) | Additive and interaction candidates from biological questions. | Need to compare justified candidates for fit and complexity. | Definitions of R², adjusted R², AIC. | Candidate formulas and a forward question. |

## PollsLive retrieval proposal

### Integration map

- Placement: slides 3-6, directly after the measurement-context hook and before learning outcomes.
- Retrieves: approved L07 material on conditional coefficients, supported predictor combinations, correlated predictors, and sequential tests.
- Bridge: an additive model holds one predictor's relationship constant across the other; L08 relaxes that assumption.
- Scheduled lecture: 2026-11-23.

### Exact questions

#### 1. Conditional coefficient

- ID: `conditional-temperature-coefficient`
- Text: `Co znamená záporný koeficient roční teploty v modelu s roční i maximální teplotou?`
- Options:
  1. `Změnu odhadované tloušťky listu při zvýšení roční teploty o 1 °C, když maximální teplotu držíme stejnou.` **Correct**
  2. `Celkovou změnu tloušťky listu při zvýšení obou teplot o 1 °C.`
  3. `Rozdíl průměrné roční teploty mezi původními a zavlečenými populacemi.`
  4. `Vztah roční teploty k tloušťce listu bez ohledu na maximální teplotu.`
- Explanation: `V modelu s více prediktory čteme každý sklon při stejné hodnotě ostatních prediktorů. Koeficient proto není totožný s jednoduchým jednoprediktorovým sklonem.`
- Evidence: L07-style card with the two-predictor formula and “při stejné maximální teplotě”.
- Alt: `Schéma modelu se dvěma teplotami zvýrazňuje koeficient roční teploty a podmínku stejné maximální teploty.`
- Provenance: deterministically reconstructed from the approved L07 model and teaching data; source revision and SHA-256 will be pinned during the asset build.

#### 2. Supported prediction

- ID: `supported-temperature-scenario`
- Text: `Kterému odhadu z modelu se dvěma teplotami bychom měli více důvěřovat?`
- Options:
  1. `Odhadu pro kombinaci roční a maximální teploty, která leží uvnitř pozorovaného mraku bodů.` **Correct**
  2. `Odhadu pro libovolnou kombinaci uvnitř rozsahu každé teploty, i když se tato dvojice v datech nevyskytuje.`
  3. `Odhadu pro kombinaci nejnižší roční a nejvyšší maximální teploty, protože využívá oba extrémy.`
  4. `Všem odhadům stejně, protože lineární model umí spočítat každou číselnou kombinaci.`
- Explanation: `Model výpočet provede i mimo společně pozorované kombinace, ale takový odhad je extrapolace. Opora je silnější uvnitř mraku skutečných kombinací prediktorů.`
- Evidence: approved L07 predictor-cloud plot with one scenario inside and one outside.
- Alt: `Bodový graf roční a maximální teploty ukazuje jednu kombinaci uvnitř pozorovaného mraku a druhou mimo něj.`
- Provenance: deterministic reuse of approved L07 scenario-plot logic; source revision and SHA-256 will be pinned.

#### 3. Formula order and sequential test

- ID: `sequential-anova-order`
- Text: `Prohodíme pořadí dvou korelovaných teplot ve formuli. Co se může změnit?`
- Options:
  1. `Koeficienty modelu i jeho předpovědi.`
  2. `Koeficienty se nezmění, ale sekvenční tabulka z anova() může přidělit sdílenou informaci jinak.` **Correct**
  3. `Pouze počet pozorování v modelu.`
  4. `Nic; koeficienty, předpovědi i každý řádek sekvenční anova() musí zůstat stejné.`
- Explanation: `Pořadí prediktorů nemění fit ani koeficienty stejného modelu. Sekvenční anova() však testuje členy v pořadí ve formuli, takže u korelovaných prediktorů se její řádky mohou změnit.`
- Evidence: paired L07 output cards for both formula orders, with equal coefficients but different sequential sums of squares.
- Alt: `Dvě pořadí stejných prediktorů mají shodné koeficienty, zatímco zvýrazněné řádky sekvenční tabulky anova se liší.`
- Provenance: deterministically rendered from approved L07 two-temperature models; source revision and SHA-256 will be pinned.

### Retrieval-block knowledge state

| Step | May assume before | Retrieved here | Must not assume yet | Evidence |
| --- | --- | --- | --- | --- |
| Q1 | One- and two-predictor models; coefficient units. | Multiple-model slope holds the other predictor fixed. | Interactions. | Formula and coefficient card. |
| Q2 | Scatterplot reading and prediction. | Joint support depends on observed predictor combinations. | Formal extrapolation metric. | Predictor-cloud scenarios. |
| Q3 | Correlated predictors share information; `summary()` and `anova()` differ. | Order leaves fit unchanged but may change sequential tests. | Interaction syntax. | Paired outputs. |
| Bridge | Additive terms are conditional on other predictors. | Additivity also assumes one relationship does not change across the other. | Whether crabs support interaction. | Spoken bridge to crab plot. |

## Story-map audits before human approval

- Heading strip: title/question → measurement-context hook → L07 retrieval → learning outcomes → first data section → familiar additive lines → visually earned interaction → predictions → coefficients → checks → second interaction → synthesis.
- First use: *interaction* follows visual comparison; `*` follows explicit colon term; coefficients follow 30 mm predictions; difference of differences follows two visible contrasts.
- Information leakage: no result precedes raw points and a prompt. The second example shows observations before means or model output.
- Scope: no causal claim, no extrapolation, no L09 metric, no centred 30 mm model.
- Formula consistency: male minus female throughout. Slide 26 deliberately repeats the highlighted −1.76 mm result.
- Visual continuity: slides 32 and 34 use the exact same seeded raw-data layer; slide 34 adds only means and connectors. First-example comparison plots share axes.
- PollsLive: map, exact options, answers, explanations, evidence, alt text, and provenance require explicit approval before implementation.

## Active-learning cadence

| Minute | Slide | Activity | Evidence of learning |
| --- | --- | --- | --- |
| 5 | 3-6 | PollsLive retrieval | Retrieve conditional coefficients, support, sequential order. |
| 14 | 10 | Notice raw points | Separate overall association from possible group-specific pattern after dataset orientation. |
| 22 | 12 | Think-pair-share | Connect parallel lines to a constant contrast. |
| 29 | 17 | Predict before reveal | Read two fitted lines at a common length. |
| 43 | 27 | Misconception vote | State that `pohlavisamec` is conditional on 0 mm. |
| 58 | 33 | Silent write | Separate two within-form contrasts. |
| 66 | 35-36 | Guided calculation | Construct the difference of differences. |
| 80 | 44 | Repair statements | Name the conditioning predictor and value/level. |

## Visual workflow checks

- Story map approved before full slide copy: [x]
- Text-light slides checked at presentation scale: [x]
- Staged reveals checked for slides 15, 18-19, 22-27, 35-38, and 45: [x]
- Figures generated locally near slide blocks: [x]
- Immediate interpretation after key visuals: [x]
- Interaction cadence present: [x]

## Slide-role rhythm

- Interaction: observation or prediction prompt using a stable visual.
- Evidence reveal: the same axes or raw-data layer gains only the needed model feature.
- Interpretation: one biological-unit claim paired with its conditioning value or group.
- Bridges: slide 20 returns to the opening question; 29 and 41 close examples; slide 47 opens the L09 bridge.

## Risks and fixes

- Visual rhythm risk: repeated scatterplots and coefficient slides may feel uniform.
- Pacing risk: 47 short slides may rush if arithmetic gets too much live time.
- Fix: stable figures with purposeful overlays, one algebra line per reveal, concise `emmeans` use, sparse section dividers, and activity checkpoints.

## Stage 5 - Human review gate

- Finished headings compared with story map: [x]
- Heading-strip, visible-copy, first-use audits: [x]
- Lesson-vision review: [x]
- Human review: [ ] (the 2026-09-22 approval predates the requested image revision)
- Credible findings resolved: [x]
- Presentation rendered and checked: [x] (47-slide HTML/PDF; full-scale inspection of the corrected opening sequence and all-slide PDF geometry screen)
- Reviewer decision: independent flow review found no remaining presentation-source issue after its workflow-documentation findings were resolved; human review of the revised deck is pending.

### 2026-09-23 revision validation

- Canonical offline render completed: 48-slide `Presentation/presentation.html`, synchronized `docs/index.html`, and 48-page `Presentation/presentation.pdf`.
- Full-scale visual inspection passed for the two generated-image slides (2 and 48) and the revised coefficient sequence (23-29); slide 48 was checked with the final question revealed, while its initial state removes only that fragment.
- Automated PDF screen found zero text blocks outside slide bounds across all 48 pages.
- All 48 rendered headings match the 48-row story map.
- PollsLive validation passed and `Presentation/presentation.html` matches `docs/index.html` by SHA-256.
- Independent final vision review found no remaining source or lesson-vision issue. Its browser/image tools were unavailable because of the environment ACL failure; the authoring agent completed the visual inspection through rendered PDF images.
- `renv::status()` still reports template packages that are installed and recorded but unused; no dependency needed by this deck is missing, and no broad lockfile pruning was performed.

### 2026-09-24 author revision validation

- Reworked slide 27 to reveal the verbal interpretation, substituted coefficient values, and general formula in that order; the displayed arithmetic now uses an approximate two-decimal result consistent with its rounded inputs.
- Added the roughnotation circle to the correct response on slide 28 and verified it in the live RevealJS state.
- Added 95% confidence intervals to both slopes, the change in slope difference, and the 30 mm sex contrast on slide 30.
- Added blue and orange emoji cues to student-visible form labels, including plot facets rendered with a color-emoji device/font path.
- Renamed and explained slide 41 explicitly in terms of residuals.
- Regenerated PollsLive material from the corrected canonical local client; validation passed and the generated wording matches the canonical source.
- Final checks passed: 48 rendered headings match the story map, HTML and `docs/index.html` hashes match, the PDF has 48 pages with zero out-of-bounds text blocks, and UTF-8 checks passed.
- Independent presentation re-review found no remaining actionable issue. Human approval of this revised deck remains pending.

### 2026-09-26 four-group illustration validation

- Added `krabi_ctyri_skupiny.png` to the then-current slide 31 (now slide 30) so the section divider visibly introduces the four combinations formed by two color forms and two sexes without adding another slide.
- Full-scale inspection of the then-current slide 31 (now slide 30) passed: the four groups have equal visual status and comparable scale, the sex badges are unambiguous, and the image does not imply a statistical result or preferred group.
- The image uses the established paper-cut beach style and muted palette; the following slide (then 32, now 31) immediately converts the visual setup into the response-and-predictor question.
- The generated asset, exact prompt, SHA-256 hash, Czech alt text, and visible AI disclosure are recorded in the source and provenance ledger.
- Canonical offline render and PollsLive validation passed. The deck remains 48 slides; all rendered headings match the story map, HTML and `docs/index.html` hashes match, and the PDF has zero detected out-of-bounds text blocks.
- Independent vision review found no source or content issue after the workflow documentation was updated to include the third generated illustration.

### 2026-09-26 opening-order correction

- The human author called back the canonical opening rule: title → biological question or visual hook → previous-lesson retrieval → learning outcomes → first data moment.
- Removed the premature raw-data slide that appeared before retrieval. The opening now moves directly from the title and measurement-context illustration to the L07 retrieval block and then to learning outcomes.
- Renamed the later first-data slide to `Co naznačují naměření krabi?` and moved the hidden plot construction beside that slide, after dataset orientation.
- The deck now contains 47 slides. Story-map rows, knowledge-state ranges, activity references, visual-continuity references, and current-state slide references were renumbered accordingly.
- Canonical offline render completed with 47 slides. Full-scale inspection of slides 1-3, 7, and 9-10 confirmed the required opening sequence and a clean handoff into the first data moment.
- Automated validation passed: 47 rendered headings match the 47-row story map, HTML and `docs/index.html` hashes match, the PDF has 47 pages with zero detected out-of-bounds text blocks, PollsLive validation passed, and UTF-8 checks passed.
- Independent flow review confirmed the canonical opening order, no information leakage, and no broken `graf_body` dependency; its workflow-reference findings were corrected.

## Decision

- [x] Revised slides ready for human review
- [x] Story-map status is `complete`
- [x] Human story-map approval is `approved` and recorded
- [x] Diff contains only Stages 4-5 files
- [ ] Presentation PR ready to merge
- Notes: the deck returned to 47 slides on 2026-09-26 after the premature opening data slide was removed to restore the canonical opening order. Rendering, visual inspection, automated validation, and independent review passed; renewed human approval and separate Git publication authorization remain pending.
