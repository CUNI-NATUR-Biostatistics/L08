# L08 pre-teaching review (2026-11-18)

## Scope and decisions

- Trigger: Ondřej Mottl asked for an independent review of all L08 parts (learning materials, presentation, R exercise, Moodle questions) against the current instructions before teaching on 2026-11-23, and for a separate agent to suggest further, mostly visual, improvements from the online inspiration sources.
- Basis: rules changed after the L08 approval of 2026-10-15/17: title-image format (2026-10-19), interaction guidelines (2026-10-20), no glossary calls in headings (2026-10-21), a/b to L05 and β̂ from L06 (2026-10-28), standing practices (2026-11-02), bold for newly introduced terms (2026-11-05/06), link funkce (2026-11-16), Moodle builder rules (2026-11-14).
- Reviews: independent read-only subagents with the canonical prompts: `vision-corrector.md` for the skripta and for the deck, `exercise-reviewer.md` for the exercise, `question-reviewer.md` for the Moodle bank (84 of 84 blind answers matched the keys), each with Sonnet at medium effort because they are complete-artifact reviews; `glossary-coverage-reviewer.md` with Haiku at low effort because it is a bounded check; `inspiration-bringer.md` with Sonnet at medium effort for visual ideas. The coordinator checked the main findings against source, figures and the rendered deck.
- Decisions by Ondřej Mottl (2026-11-18):
  - D1: add the missing standing practices (residual histogram, Q–Q plot, Cook's distance, confidence band) to all three parts.
  - D2: exercise timing: accept the longer core route; record the new budget in the exercise blueprint.
  - D3: fix all review findings.
  - D4: take all visual suggestions forward. Suggestions that add or replace slides or skripta content need the story-map amendment below to be approved first.
  - D5: authorized the fix branch, the PollsLive retest and a new release. Branch `fix/l08-pre-teaching-review` created from `main` (`9c2a7aa`); Moodle edits stay uncommitted on `_internal` `main`, as for L07.

## Starting knowledge and prior-practice check

Derived from `_internal/moodle/knowledge/L00`–`L07.yaml` and the L07 review record: $a$/$b$ through L05; $\hat\beta_j$ numbered in R row order with $y_i = \hat\beta_0 + \hat\beta_1 x_{1i} + \dots + e_i$ from L06/L07; `lm()` with numeric and categorical predictors, `confint()`, `predict()`, `anova()`, `emmeans()`; conditional interpretation of coefficients, correlated predictors, sequential versus type-II tests (L07); standing practices from L00–L07 as listed in `_internal/R/Functions/Prior_knowledge/standing_practices.csv`.

`Rscript R/check_prior_practices.R L08` (2026-11-18, before the changes): 40 applied, 20 missing, 6 not triggered. Dispositions of the `missing` rows are recorded in the section "Prior-practice dispositions" after the fixes.

## Release state at review time

- Latest release `L08-v1.5.0-20261018` predates four commits on `main` (terminology alignment of skripta, deck and exercise; harder retrieval quiz; DeckTape switch). Students currently get the older materials.
- `_internal/moodle/R/check_knowledge_file.R L08` fails only on the `built_from` stamp (sources changed since the release).
- Uncommitted on `main` at review time and carried to the fix branch: the `_brand` sync of `theme/presentation_components.scss` (smaller quiz-question headings, also in L07) and `theme/brand_manifest.json`, plus re-rendered `Presentation/presentation.html`, `presentation.pdf` and `docs/index.html`.

## Story-map amendments

Status: proposed 2026-11-18 before drafting. Approved separately by Ondřej Mottl on 2026-11-18: the presentation amendment („Approve“) and the learning-materials amendment („Approve“), no revisions requested. In the same answer he decided to fix the wording of the activated PollsLive retrieval quiz (Q2 „statisticky nevýznamný“, Q1 „maximální teplota“), which needs a re-sync and a new activation approval.

### Presentation amendment

Physical slide numbers refer to the 2026-10-26 render (57 slides). The deck grows to 60 slides (three new rows); the poll moves without adding a slide.

| Current slide | Change | Source |
|---|---|---|
| 15 „Když se rozdíl mění, mluvíme o interakci“ | Text cards become two small panels with identical axes: aditivní model (stejný rozdíl) and model s interakcí (měnící se rozdíl), each with vertical gap arrows at 20 and 40 mm; card text moves to panel subtitles. A small recurring icon (two parallel or two diverging lines) marks „aditivní“ and „interakce“ here and on slides 52 and 55. | ideas 6, 10 |
| 16 „Jak zapsat model s interakcí?“ | Larger formula text; fills the empty lower area. | quick fix |
| 17 „Model s interakcí dovoluje dvěma pohlavím různé sklony“ | 95% confidence band around each line (`predict(interval = "confidence")`), callback to L04. | D1 |
| 18, 19 | Headings use „predikce“: „Jakou zadní šířku model predikuje pro dva stejně dlouhé kraby?“, „Dvě predikce při stejné délce krunýře“; output rows marked with the sex colours and symbols. | terminology, quick fix |
| new after 21 | „Rozdíl mezi pohlavími se s délkou mění“: interaction lines with gap arrows at 20, 30 and 40 mm revealed one by one as fragments (static replacement for the proposed animation; works in the PDF), with the predicted difference at each; small orange line of the difference against length. Pair prompt: „Kde je rozdíl největší a proč?“ | ideas 3, 13 |
| 23 „Jaké jsou koeficienty v `summary()`?“ | Replace „stačí sloupec Estimate“ with Estimate for interpretation and Std. Error as the basis of the interval. | standing practice `report_standard_error` |
| 24–26 | Rebuilt as one anchor graph revisited with the same title style: lines extended to 0 mm (grey dashed outside the data). 24: intercept point and slope triangle on the female line (`(Intercept)`, `delka_krunyre_mm`). 25: vertical gap at 0 mm (`pohlavisamec`), definition only. 26: changed male slope (`delka_krunyre_mm:pohlavisamec`) with interval and SE. Each coefficient name has the colour of its annotation. | idea 1 |
| 28 → after 25 | The poll „Platí koeficient `pohlavisamec` při každé délce?“ moves directly after the definition on 25; the „Není to:“ list moves into the post-vote reveal. | review M2 |
| 27 „Rozdíl při 30 mm skládají dva známé příspěvky“ | Colour-coded equation panel beside a small plot: female line $\hat y = \hat\beta_0 + \hat\beta_1 x$, male line $\hat y = (\hat\beta_0 + \hat\beta_2) + (\hat\beta_1 + \hat\beta_3) x$, difference $\hat\beta_2 + \hat\beta_3 x$; hats restored. | idea 2, notation |
| 29 „Jak dobře přímky popisují změřené kraby?“ | Name the patterns: „bez oblouku (nelinearity)“, „s konstantním rozptylem residuí“. | terminology |
| new after 29 | „Sedí model s interakcí k datům i v dalších grafech?“: residual histogram, Q–Q plot and Cook's distance with the 4/n line, three panels, callback „stejně jako v minulých lekcích“; takeaway on the flagged crabs (not removed automatically). | D1 |
| 30 „Co víme o rozdílu mezi samicemi a samci modré formy?“ | Add SE next to the interval; add „Každý krab je v datech jednou; nezávislost plyne ze způsobu sběru, ne z grafu.“ | standing practices |
| 36, 39 | Brackets for the female–male difference in each form on the means graph (36); slide 39 shows the two brackets side by side with a minus sign. | idea 8 |
| 41 „Co znamená každý ze čtyř koeficientů?“ | 2×2 coefficient map (rows forma, columns pohlaví): each cell shows which coefficients add up to its mean, revealed cell by cell. | idea 9 |
| 42 „Odhad pro každou ze čtyř skupin“ | Heading „Odhadnuté průměry čtyř skupin“. | terminology |
| 34, 38, 41, 48 | Lighter panel strips (34); larger console output (38, 41, 48). | quick fixes |
| 45–47 | 45: computed count of missing values, „jeden bod = jeden strom“, reduced top margin. 46: correlation of průměr and výška computed inline. 47: larger panels, direct label on the dashed reference line. | standing practices, quick fixes |
| 48 + new after 48 | 48 keeps code and output only. New „Sklon průměru roste s výškou stromu“: the slope of průměr against výška as an orange line through the slopes at 21, 23 and 25 m (replaces the cramped slope table). | idea 4 |
| 50 „Co víme o stromech?“ | True reason for omitting the influence check (one tree exceeds 4/n; read the lines with caution); content vertically centred. | review M4 (skripta) |
| 52 „Interakce mění sklon nebo skupinový rozdíl“ | Readable triptych: short panel titles, larger text, one legend, one orange mark per panel for „what changes“; captions move into panel subtitles. | review M4, idea 7 |
| 56 „Který biologicky smysluplný model máme zvolit?“ | „Model bez interakce (aditivní)“ and „Model s interakcí“ instead of „kandidát“. | terminology |

Not in the deck: the prediction contour plot for two numeric predictors (idea 5) goes to the skripta only, because contours are hard to read at lecture pace. Idea 11 was withdrawn by the inspiration agent.

### Learning-materials amendment

| Section | Change | Source |
|---|---|---|
| „Model s interakcí dovoluje samicím a samcům různé sklony“ | 95% confidence band around both lines. | D1 |
| „Co model predikuje pro stejně dlouhou samici a samce?“ | Figure with gap arrows at 20, 30 and 40 mm and the difference-against-length line. | idea 3 |
| „Co znamenají koeficienty modelu s interakcí?“ | Anatomy figure: lines extended to 0 mm with numbered callouts 1–4 (intercept, slope, gap at 0 mm, slope change) and a small table matching each callout to its R row and reading; colour-coded line equations with $\hat\beta$. | ideas 1, 2, 12 |
| „Jak dobře přímky popisují změřené kraby?“ | Residual histogram and Q–Q plot in the main text; Cook's distance in a collapsed `Doplňující` box; pattern names (nelinearita, konstantní rozptyl). | D1 |
| „Jak model zachytí změnu rozdílu…“ and „Co znamenají čtyři koeficienty…“ | Brackets for the female–male difference in each form; 2×2 coefficient map. | ideas 8, 9 |
| „Model s interakcí dovolí, aby se sklon průměru měnil s výškou“ | Plot of the slope of průměr against výška. | idea 4 |
| new collapsed box in the tree part | „Doplňující: predikce objemu jako mapa“: predicted volume on a průměr × výška grid limited to the observed region, additive versus interaction model side by side. | idea 5 |
| „Co znamená koeficient průměru…“ (line 1397) | Remove the false „jako jsme to udělali u krabů“; give the true reason for omitting the tree influence check. | review M4 |

## Changes

### Learning-materials changes (`Learning_materials/skripta.qmd`)

Implemented every row of the approved learning-materials amendment; no other structural changes. Rendered HTML and Typst PDF from the L08 root with R 4.5.1 (success; 44 PDF pages, was 36); every page with a new or changed figure inspected as PNG.

- Findings: M1 hats and the callback „stejně jako v minulé lekci“ (crab formulas, four-group formulas, tree slope formula); M2 bold at first introduction (interakce prediktorů, interakční člen, rozdíl dvou rozdílů, hierarchický princip modelu, hlavní efekt) and „bodovém grafu (anglicky scatter plot)“ unbolded; M3 standing practices; M4 false „jako jsme to udělali u krabů“ replaced; L3 the logarithmic-scale conclusion is now an `if/else` on both intervals; L4 the two height literals are tied by a hidden `stopifnot` (the visible chunk keeps its own literal so students see every input); L5 tree panels now 2 x 2, base R figures and anatomy figure resized so the large blank areas on the old pp. 12 and 31 disappear.
- New figures: confidence band on the interaction lines; three-length gap figure with the difference-against-length panel; anatomy figure with callouts 1-4 and a table (callout, R row, reading, estimate with SE); brackets for the female-male difference on the four-group means graph; 2 x 2 coefficient map (table, checked against the group means); slope of the diameter against height; collapsed prediction map (convex hull of the measured trees, additive vs interaction).
- Visual key: sexes green circle / pink triangle; data grey in the anatomy figure; main-effect annotations indigo; interaction and "what changes" marks orange; extensions to 0 mm grey dashed. Colour-coded line equations are not possible in the Typst PDF (pandoc cannot convert `\color` in math), so colour lives in the figure and the callout table links numbers to the equations.
- Terminology: nelinearita, heteroskedasticita, homoskedasticita (konstantní rozptyl residuí) named in the diagnostics text; predikce vs odhad aligned where a scenario is predicted (text-only equations, bullets, comments); four-group table says „odhadnutý průměr“.
- Glossary calls added: jednotka-pozorovani, extrapolace, pas-spolehlivosti, interakce-predikatoru (interakční člen), vyber (emmeans box), nelinearita, heteroskedasticita, homoskedasticita, rozdeleni, histogram, qq-graf, vlivne-pozorovani, cookova-vzdalenost (crabs, four groups, trees), pakovy-efekt, numericka-promenna (tree section), predikce (tree bullet and scale box), pricinnost. A scripted audit found no unknown slug, no duplicate within a `##` section and no call in a heading.

Re-review follow-up (same day): „Predikce šířky samice…“ in the coefficient section; β̂₃ shown with four digits in the anatomy text; homoskedasticita bolded as a new term (nelinearita, heteroskedasticita, Cook, pákový efekt stay unbolded); bold narrowed or removed around earlier-lesson wrappers (sklon in the additive-model sentence, průměrnou in the emmeans box); the wrapper „Sklon“ for the slope of the connecting line unwrapped; glossary calls added for histogram, qq-graf, rozdeleni, vyber (four-group section), extrapolace (prediction-map box), pricinnost and numericka-promenna (Shrnutí and other sections), standardni-chyba, nejistota, intercept (tree formula) and kandidatni-model; „průměrech“ in the scale box checked (means of the lengths, correct). Layout: figure heights lowered (additive and different-slope figures, residual plot, histogram and Q–Q at 3,5 in, Cook plot, four-group points figure, trees) so the blank areas on the old pp. 8, 19 and 26 are gone; the coefficient table now has a separate unit column and the 2 x 2 map has units in the headers. Anatomy callouts and the table column "#" renumbered 0-3 to match the indices of the coefficients (the shared key 1-4 was a mistake); the sentence „Čísla 0 až 3 v obrázku odpovídají indexům β̂“ replaces the old "shifted by one" remark; the code cell of row 3 no longer overflows (wider column); the β̂₃ sentence names the row `delka_krunyre_mm:pohlavisamec`. Final render: HTML and PDF succeeded, 44 pages.

Prior-practice dispositions for the skripta (the `missing` rows):

- `plot_residual_histogram`, `plot_residual_qq`: applied for `mod_interakce` (main text, base R, as in the previous lesson). Four-group model: omitted with reason (violin plots show the residual distribution per group, a pooled histogram would mix four groups). Tree model: omitted with reason (the example is about reading a numeric interaction; stated in the text).
- `check_influential_observations`: applied for `mod_interakce` in a collapsed `Doplňující` box (4/n = 0,04; 8 crabs above; maximum at row 100, all computed; refit without the flagged crabs; not removed automatically). Four-group model: omitted with reason computed in the text (equal leverage, Cook's distance only rescales the residual; 9 crabs above 4/n, exactly those with the largest residuals). Trees: computed and stated (one tree above 4/n, row 18; refit without it).
- `show_confidence_band`: applied (95% band around both interaction lines, overlap range computed).
- `report_standard_error`: applied (SE in the new coefficient table).
- `check_predictor_correlation` for the crab additive model: not applicable (one numeric and one categorical predictor); the tree example already reports the correlation.
- Not verified: `check_prior_practices.R` itself could not be run to completion in this session (missing `forcats` in the project library), so the dispositions come from reading `standing_practices.csv` against the finished text.

### Presentation changes (`Presentation/presentation.qmd`)

Implemented every row of the approved presentation amendment; no other structural changes. The deck has 60 slides (was 57): new 22 „Rozdíl mezi pohlavími se s délkou mění“, new 31 „Sedí model s interakcí k datům i v dalších grafech?“, new 51 „Sklon průměru roste s výškou stromu“; the MCQ on `pohlavisamec` moved from 28 to 27. Old → new numbering: 1–21 unchanged; 22–27 → 23–26, 28, 29 (MCQ 28 → 27); 29 → 30; 30–48 → 32–50; 49–57 → 52–60. Rendered with `R/render_presentation.R` (R 4.5.1 first on `PATH`, needed because the PollsLive preparation calls `Rscript` itself; offline PollsLive mode): HTML and 60-page PDF; every new or changed slide inspected as PNG and iterated until clean.

- Visual key as agreed with the skripta: sexes green circle / pink triangle; main-effect annotations indigo, interaction and "what changes" marks orange; lines extended to 0 mm grey dashed; coefficient callouts numbered 0–3 to match $\hat\beta_0$–$\hat\beta_3$ (coordinator change of 2026-11-18). Colour-coded equations use MathJax `\color` and `\bbox`.
- Recurring icons: four hand-written SVG files in `Presentation/Materials/` (parallel / diverging lines, sex symbols) on slides 10, 15, 16, 19, 20, 42, 55, 58, 59; recorded in `GENERATED_IMAGES.md` (not AI-generated). The placement table there now gives slides 34 (`krabi_ctyri_skupiny.png`) and 59 (`krabi_modely.png`).
- Findings: bold at first introduction of hlavní efekt and interakční člen (16), interakční koeficient (28), hlavní koeficient (57); „predikce“ headings 18, 19 and visible column `predikce_sirky_mm`; heading 43 „Odhadnuté průměry čtyř skupin“; 30 names nelinearita and konstantní rozptyl residuí; 59 „Model bez interakce (aditivní)“ / „Model s interakcí“; top-heavy 19, 24, 45 rebalanced; larger console output 24, 40, 43, 50; lighter facet strips; larger tree panels with a direct label on the reference line (49); readable triptych with one inline legend and one orange mark per panel (55).
- Hidden guards (`stopifnot`) added where the text asserts a sign or comparison: male narrower at 30 mm, widening gap, flagged-crab refit interval below zero, blue/orange form differences, coefficient sums equal the group means, tree slope grows with height, exactly one tree above 4/n.

Prior-practice dispositions for the deck (the `missing` rows; a Python re-implementation of the CSV regex check now reports all of them `applied`, because `check_prior_practices.R` still fails on the missing `forcats`):

- `check_missing_values`: applied on 10 (crabs) and 47 (trees), counts inline.
- `state_observation_unit`: applied on 10 (heading „Jeden bod představuje jednoho kraba“) and 47 („jeden strom = jeden řádek tabulky = jeden bod v grafu“).
- `check_predictor_correlation`: trees, 48 (r computed inline with hidden `cor()`); crab and four-group models not applicable (no two numeric predictors).
- `check_independence_from_design`: 32 footer.
- `show_confidence_band`: 17 (band carried on 18, 20, 22).
- `report_standard_error`: 24 (Std. Error card), 28, 32, 42, 45, 53.
- `plot_residual_histogram`, `plot_residual_qq`, `check_influential_observations`: `mod_interakce` on 31 (4/n = 0,04, 8 of 100 crabs above, maximum 0,15 at row 100, refit without them: interaction −0,137 mm/mm, interval below zero; not removed automatically). Four-group model: omitted with reason (residual violins on 44 show the distribution per group; same reasoning as the skripta). Trees: Cook's distance computed and stated on 53 (one tree above 4/n; slopes read with caution); histogram and Q–Q omitted with reason (short example on reading a numeric interaction, full residual check shown for the crabs).

Follow-up after the independent re-review (2026-11-18), same scope and render route: callout badges tied to $\hat\beta$ („0 · $\hat\beta_0$“ etc.) with a cue line on 25 and 26 and a full-size index line on 29 (M-1); orange text on 14, 20, 39, 49 replaced by `.text-hgl-orange` (M-2); slide 48 decluttered (short r line, panel explanation moved to the notes) (M-3); slide 53 states that the tree residuals were not drawn (M-4); pair prompt on 22 is a fragment after the gaps, before the difference plot (L-1); sex-colour key under the Cook panel and larger axis text on 31 (L-2); indigo highlight for the interval on 24 (L-3); spacing on 16, 43, 50 and one code size on 40 (L-5); interaction icon on 57 (L-6); slide numbers 34 and 59 in the two `GENERATED_IMAGES.md` headings (L-8). L-4 and L-7 skipped as instructed.

### Exercise changes (`Exercises/cviceni.R`)

All findings of the independent review fixed (M1–M3, L1–L8); details and the standing-practice table are in the addendum „Pre-teaching review 2026-11-18“ of `2026-10-17-continuous-interaction-exercise-blueprint.md`. Main changes: Ctrl + S download tip; independence question in U01; SE and `confint()` of the interaction in U04 and interval overlap in U05; U06 with confidence band, residual plots including histogram and Q–Q plot, unused `data_diagnostika` removed; reference group asked in U07; quick tree plot before the model in U09 and a sentence on the omitted influence check; new optional N10 (Cook's distance, 8 crabs above 4/n, maximum 0,146 at row 100); hints that repeated `Zadání` rewritten; complete dependency list. Timing: core route about 108–125 minutes on the 120-minute basis, accepted by Ondřej Mottl (D2).

### Moodle bank (`_internal`, uncommitted on `main`)

- Independent review findings fixed: two blockers (`graf-prumeru-v4` two true options; „mimo data“ feedback for a value inside the data), one major (`ab-odvozeni` signed comparison), nine minor items and the rule-change items R1 (hlavní efekt), R2 (easy numbers), R4 (batteries of five), R5 (levels).
- Family `sklon-druhe-skupiny` replaced by `druha-skupina-z-koef` (frames slope and intercept of the second group); new variants `chybejici-kombinace-v3`, `oba-smery-v3`; the asked predictor is rotated in the numeric-interaction families; no two families share a data subsample.
- Ablation gate, run 1: `zaver-podmineny` 1,00, `prumery-poradi` 0,67, `panely-graf` 0,62 failed. Rework: options of `zaver-podmineny` no longer quote the interval; `prumery-poradi` uses simulated contexts marked „Modelová (simulovaná) data“; `panely-graf` gets simulated contexts with a negative interaction so the key band is balanced. Run 2: `prumery-poradi` 0,08, `panely-graf` 0,25 pass; `zaver-podmineny` 0,47 (3 of 5, four answers marked as guesses between the two remaining options; chance about 0,33). Per the guide's two-run budget no further round: watch its item statistics.
- Independent key reviews: packet v2 86/86 keys matched; packet v3 (changed families) 53/53 matched, four minor findings, three fixed by the coordinator (panel feedback, „strměji“ in `oba-smery-v3`, labels of all bison age levels), one accepted (modest crossing in `graf-prumeru-v1`).
- Independent re-review 2026-11-19 (`question-reviewer.md`, Sonnet at medium effort, whole bank blind): 86/86 keys matched, no blocker, one major, four minor. Fixed by the coordinator at the owner's request („Fix, leave imbalance“): `hlavni-efekt-vyklad` second correct option no longer stands out by form (direction named, explanatory clause dropped); `oba-smery` v1 and v3 keys shortened so they are not the longest option (the v2 distractor about falling consumption lengthened so the key rank differs across variants, as the pattern check requires); `otazka-interakce-v2` distractor reworded to „celkově více druhů“; `interakce-odvozeni` drops the unused `L08.ci-interakce` and its explanation quotes the interaction p as the rounded output prints it (new builder value `p_int_r_rel`). Left as is by the owner: the level split (U3 has five families). Selection locks of the two changed space families refreshed (`interakce-odvozeni` hash quoted, being all digits). Ablation: the ablated packet changes only in the five edited options, all in concept families, so the data-family scores stand.
- Result: 86 questions, U1 19 / U2 47 / U3 20; build without warnings; `test_pattern_checks.R` passes (23/23); shared builders changed (`categorical_scenarios.R`, `interaction_scenarios.R`, `context_catalogue*.R`), L05–L07 rebuilt byte-identical; `check_knowledge_file.R L08` fails only on the `built_from` stamp until the new release.

### PollsLive retrieval quiz

- `pollslive/quiz.json`: Q1 „při stejné maximální teplotě“, Q2 „statisticky nevýznamný“ (D: fix wording). Deck review round 1 (Ondřej Mottl, slide 5): Q2 was too dependent on remembering L07, so its stem now gives the setup: „Model tloušťky listu křídlatky jen s roční teplotou dal sklon −0,0091 mm/°C. Po přidání původu populace (původní, nebo zavlečená) vyšel sklon +0,0015 mm/°C. Proč se změnilo znaménko?“ (values match the guards in `R/render_pollslive_assets.R`). `node pollslive/validate.mjs` passes. The input checksum changes, so the quiz needs a sync-mode render after the branch is pushed and a new activation approval in `_pollslive`.
- `R/render_pollslive_assets.R`: stale L07 heading in a comment updated to „Vypadá vztah stejně u obou původů?“.
- Retest of the open-poll HTTP 500 of 2026-11-16 (authorized, D5): `test-open` L08, participation page HTTP 200 with the quiz content and no vote submitted, `test-close`, `test-status` with `votingOpen=false`, `publicResults=false`.

### Generated and synced files

Offline renders of the skripta (44 pages) and deck (60 slides) with R 4.5.1. The renders synced `_brand` (`b47eb7b`): `R/render_presentation.R`, `R/render_skripta.R`, `R/Functions/Theme_generation/generate_skripta_typst_theme.R`, `Learning_materials/skripta_theme.typ`, `theme/*`. New hand-drawn SVG icons in `Presentation/Materials/` (not AI-generated).

## Human review of the skripta, round 1 (2026-11-18)

Requests by Ondřej Mottl after reading the skripta; all applied in `Learning_materials/skripta.qmd`. No `##`/`###` heading changed (compared with `HEAD`); the callout title „Co v panelech vidíte?“ became „Co v grafu vidíte?“ because the panels are gone. Render with R 4.5.1: HTML and PDF succeeded, 47 pages.

1. Retrieval box „Vybavte si minulou lekci“: the question now asks students to imagine a biological situation in which two groups would not have parallel lines; the answer names differing reactions to a predictor (two cultivars, two populations).
2. Data description: the codes of `sp` and `sex` are explained as English abbreviations (species; B = blue, O = orange; F = female, M = male).
3. Additive-model figure: 95% confidence bands (`predict(interval = "confidence")`) plus a sentence naming them as pásy spolehlivosti.
4. Four-group model: a visible `levels()` chunk and a sentence name the reference groups (computed inline: modrá, samice) before the model, as a callback to the earlier lesson.
5. Four coefficients: new figure of the four group means with arrows from the reference mean, numbered 0-3 as the indices of the coefficients (0-2 indigo, 3 orange), the additive expectation for the orange males as an open circle, and the sizes of the shifts computed from the model (guards on signs and on the agreement with the group means).
6. Four-group residuals: a visible residual histogram of `mod_formy` with a computed description (extremes, symmetry guard); the omission sentence now concerns only the Q-Q plot.
7. Trees: (a) the helper categorical variable „výškové pásmo“ is explained as created only for illustration while the model keeps height numeric; (b) the 2 x 2 panels were replaced by one panel with colour and shape by band (Okabe-Ito colours, not the sex colours, four shapes) and one line per band, via the new helper `R/Functions/plot_tree_bands.R` (the deck keeps `plot_tree_panels.R`); guards check the residual pattern in the lowest and highest band and that the slopes grow with the band; (c) a new graphic of the predictions at the two chosen heights (lines over the diameters observed near each height, dotted lines at the two diameters, dashed steps of equal size, arrows with the volume increments).
8. „Model s interakcí dovoluje…“: a note „Pozor na hvězdičku“ says that `*` instead of `+` is the only change from the additive model.

Coordinator check of the final render (pages 31, 32, 39, 42): in the four-coefficient figure the label „28,10 mm“ was crossed by the dashed reference line; it now sits just above the line (re-rendered, PDF 47 pages).

Not verified: the HTML was checked only for render errors, not by eye.

## Human review of the deck, round 1 (2026-11-18)

Requests by Ondřej Mottl (slide numbers of the 60-slide render) and their implementation. The deck now has 63 slides; new: 40 „Které skupiny jsou referenční?“, 54 „Stejný krok průměru dává vyššímu stromu víc dřeva“, 55 „Jak vypadají predikce obou modelů na mapě?“. Old → new: 1–39 unchanged; old 40–52 → 41–53; old 53–60 → 56–63. Offline render with R 4.5.1 first on `PATH` succeeded (63 slides); every changed slide inspected as PNG.

His comments:

- Slide 10: public-domain photo of *Leptograpsus variegatus* (Wikimedia Commons, author Pseudopanax, purple rock crab, New Zealand; not a specific blue or orange form) beside the data panel; credit in the footer, provenance and SHA-256 in `Presentation/Materials/GENERATED_IMAGES.md`.
- Slide 16: loose list with more vertical space between the three formulas.
- Slide 22: pair prompt is now „Proč tu model s interakcí popisuje data lépe než aditivní model?“ (fragment after the gaps); notes updated.
- Slide 28: redesigned. Left: anchor graph with dotted gridlines and marked points at 20 and 30 mm on both lines. Right: rises over the same 10-mm step side by side (samice +4,07 mm, samci +2,82 mm) with the orange difference −1,24 mm = 10 × β̂₃ and badge 3; guarded so the difference equals the step times β̂₃.
- Slide 39: jittered crabs with group means and the two orange brackets beside the difference-of-differences figure; Δ in a takeaway strip.
- Slides 48–49 (now 49–50): one figure each with the four height bands in the skripta colours and shapes (`R/Functions/plot_tree_bands.R`); guard that the slope grows from band to band.
- Slide 51 (now 52): second plot of the height slope against diameter (β̂₂ + β̂₃ · průměr) with values at 28 and 36 cm, and „Interakci lze číst oběma směry“.
- Slide 53: two-panel prediction map (additive vs interaction, convex hull of the measured trees) as new slide 55; the interaction map with one orange contour of equal volume replaces the lines in panel C of the triptych (now 58).

Skripta fixes carried over:

- Data codes: visible comments on slide 10 (`sp` B = blue → modrá, O = orange → oranžová; `sex` F = female → samice, M = male → samec).
- 95% confidence bands on the additive-model figure (12, reused on 13).
- Reference levels with `levels()` on new slide 40 (guarded text „samice modré formy“).
- Four-coefficient figure (arrows from the reference mean, badges 0–3, open circle for the orange males without interaction, orange interaction arrow) beside the 2×2 map on 43; the map stays.
- Residual histogram of `mod_formy` beside the violins on 45.
- Tree slide 49 states that the height band is a new categorical variable only for drawing and that the model keeps height numeric.
- Prediction graphic for the trees (21 and 25 m, the same 28 → 36 cm step, rises +0,31 and +0,46 m³) as new slide 54; the predictions moved there from the summary slide.
- „Pozor na hvězdičku“ as a comment in the visible model code on 17.

Not done: the slide-5 quiz comment (coordinator).

Follow-up after the independent review (2026-11-18): 54 increment arrows side by side (36 ∓ 0,5 cm), white legend background and "≈" slopes with three digits; 55 one-line map key, the 1 m³ equal-volume line thick and orange in both panels (definition moved here, reused on 58), finer 200 × 200 grid and more clearance; 52 height slope drawn only over diameters where both trees up to and above the median height occur (computed, 27–41 cm), footer states it; 28 larger annotation text, taller figure, rises with three decimals and "≈ −1,24 mm" for the difference; 10 credit „ilustrativní snímek druhu“; 43 larger key line and card titles without wrapping; 49 middle bands grey, outer bands in colour, more clearance; 50 highlight only on „strmější“; 58 dashed straight reference beside the orange equal-volume line; 40 larger code and lower takeaway. Finding 6 skipped as instructed; no slides cut or merged (63 slides). Offline render with R 4.5.1 succeeded; slides 10, 28, 40, 43, 49, 50, 52, 54, 55 and 58 inspected.

## Human review of the deck, round 2 (2026-11-18)

Ondřej Mottl commented on the 63-slide PDF (phone sheets, render 16:43). Numbers refer to that PDF.

- 13 „Sedí přímky k bodům i na koncích rozsahu?“ gives the answer away: the pair prompt now reads „Model kreslí přímky vždy rovnoběžné. Co o rozdílu mezi pohlavími říkají samotné body?“; the notes tell the teacher not to hint.
- 46 obsolete: removed. Slides 42 and 43 already give both differences and $\hat\beta_3$ with SE and interval; the sampling caveat stays on the form-introduction slide and on the four-group data slide.
- 49–50 colours change between the slides: slide 49 now uses the same four band colours as slide 50 instead of grey middle bands.
- 54 step of 8 cm: now 28 → 38 cm (rises +0,38 and +0,58 m³, slopes 0,038 and 0,058 m³ na 1 cm). The height-slope panel on slide 52 uses the same pair (0,017 and 0,067 m³ na 1 m); both diameters lie inside the computed support of 27–41 cm and on both prediction lines.
- 58 third panel: the highlighted equal-volume line is now 0,7 m³ instead of 1 m³ (thinner trunks, about 30–35 cm). It bends 0,87 cm away from its straight reference, against 0,63 cm at 1 m³, and spans nearly all heights. The volume is shared with the map slide, so slide 55 shows the same line.

Offline render with R 4.5.1 succeeded (62 slides); new slides 13, 48, 51, 53, 54 and 57 inspected. Decisions on the follow-up questions (Ondřej Mottl, 2026-11-18): align everything with the deck; keep the colours of the 21 m and 25 m lines on the step slide (dark blue and orange, not the band colours). The skripta now uses 28 → 38 cm too (text values are computed inline: rises 0,38 and 0,58 m³, height slopes 0,017 and 0,067 m³ na 1 m); its step figure got the deck's side-by-side arrows, because at 38 cm the orange arrow hid the blue one, and rise labels in the colour of their line. Skripta rendered (HTML and 47-page PDF), page 43 inspected. Exercise L08-U09: prepared `data_porovnani_stromy` uses `c(28, 38)`, step 4 says divide by 10, and the expected result now reads predictions 0,503; 0,884; 0,572; 1,151 m³ and rises 0,381 and 0,578 m³; verified with `Rscript --vanilla` (both diameters lie on both plotted lines) and the script parses. Not re-reviewed independently: a constant change with recomputed expected values, not a substantive edit.

## Prior-practice dispositions

`Rscript R/check_prior_practices.R L08` after the changes (2026-11-18): 59 applied, 1 missing, 6 not triggered. The remaining `missing` row, `adjust_pairwise_comparisons` in the exercise, is omitted with reason: N01 is a single pre-planned contrast (recorded in the exercise blueprint). Omissions stated to students: residual histogram and Q–Q plot of the tree model (skripta and deck slide 53, short example); four-group residual distribution shown by violins instead of a histogram.

## Independent verification

- Skripta: re-review by a fresh `vision-corrector.md` subagent (Sonnet, medium): approved with minor follow-ups, all fixed; glossary re-check (Haiku, low): gaps fixed by the author; callout numbering changed to 0–3 to match $\hat\beta_0$–$\hat\beta_3$.
- Deck: full re-review of all 60 slides by a fresh `vision-corrector.md` subagent (Sonnet, medium): review-ready after one pass (β̂ labels on the callout badges, orange-text contrast, crowded slide 48, tree residual omission stated, fragment order on 22, smaller items); all fixed, coordinator inspected slides 22, 25, 28, 31, 40, 48 and 55 of the final render.
- Exercise: re-review by a fresh `exercise-reviewer.md` subagent (Sonnet, medium), with its own solutions of all tasks: no high or medium findings; three low items fixed by the coordinator.
- Not verified: HTML fragment states (PDF only), live PollsLive QR after the sync render, HTML rendering of the coloured MathJax equations on slides 29 and 42, the Moodle import.

## Open items

- Skripta approved by Ondřej Mottl on 2026-11-18 after round 1 („These are very good changes, I approve the Skripta“). Deck and the aligned skripta approved by Ondřej Mottl on 2026-11-18 after deck round 2 („OK I approve skripta and Deck“). Exercise restructured stats-first after the owner's first exercise comment (see the exercise blueprint, section „Stats-first restructure 2026-11-18“; independent review passed). Exercise approved by Ondřej Mottl on 2026-11-18 („I approve the excercise“), as reviewed: core-route timing of about 105–110 minutes for absent beginners and the non-ASCII typography in comments left unchanged. Moodle bank approved by Ondřej Mottl on 2026-11-19 („I approve the Moodle questions“) after the 2026-11-19 re-review fixes, with the U3 level imbalance left as is.
- Each needs separate authorization: commit and push of `fix/l08-pre-teaching-review`; sync-mode deck render after the push (new quiz checksum); pull request and merge; `_pollslive` activation PR for the changed quiz; release; Moodle knowledge restamp after the release; commit of the `_internal` Moodle changes.
- After teaching: watch Moodle item statistics of `zaver-podmineny`.
