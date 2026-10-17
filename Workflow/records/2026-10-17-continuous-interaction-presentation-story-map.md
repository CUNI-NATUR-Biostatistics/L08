# L08 presentation story map: interaction of two numeric predictors

## Scope and approval record

- Artifact: complete `Presentation/presentation.qmd`, including the PollsLive retrieval block (unchanged).
- Date: 2026-10-17.
- Branch: `lesson/l08-continuous-interaction`; base: `main` at `f5f1d54`.
- Requested work: at least one slide with 3–5 conditional panels (each panel fixes one value of a numeric predictor and shows the other predictor against the response), derived from the approved [learning-material map](2026-10-17-continuous-interaction-learning-material-story-map.md) and [scope amendment](2026-10-17-continuous-interaction-scope.md).
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-17.
- Decision and requested revisions: explicit user decision „I approve“ (2026-10-17) on the presented map, including the MCQ slide 49, the additive-panel slide 46 and a single three-line plot as synthesis panel C; no revisions.
- This map is separate from the learning-material map and needs its own approval.

## Complete physical story map

Each row is one physical slide. Rows 1–43 are the approved 2026-10-15 deck and stay unchanged, except row 7. New rows are 44–50. Rows 51–57 are the old rows 44–50, with changes marked. The deck grows from 50 to 57 slides.

| Order | Internal role | Level | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 1–6 | Title, hook, PollsLive retrieval | H2 | Retain | Title slide keeps the crab spine question as its heading and „Interakce prediktorů“ as the formal title. Retrieval unchanged. |
| 7 | Learning contract | H2 | Výsledky učení | **Change two items to the shared list:** „…zobrazit jeho předpovědi pro kombinace číselných i skupinových prediktorů“; „…porovnávat skupiny nebo různé hodnoty prediktoru pomocí předpovědí“. |
| 8–43 | Crab examples | H1/H2 | Retain | Unchanged. |
| 44 | Section divider | H1 | Když jsou oba prediktory čísla | Minimal, parallel to „Když jsou oba prediktory skupiny“. |
| 45 | New question with context and pair prediction | H2 | Přibude vysokému stromu s každým centimetrem průměru víc dřeva? | Short context panel: střemcha pozdní, invasive in Czech forests; foresters estimate wood volume from trunk diameter and tree height; `data/stromy.csv`, one point = one felled tree, n computed inline, units cm, m, m³. `panel-question` (pair, 1 min): two equally thick trunks gain 1 cm, one tree is low and one tall: which gains more wood? Fragment answer: the extra ring runs along the whole trunk, so the taller one. Footer: Meyer (1953) via R `datasets::trees`. |
| 46 | Familiar additive model in conditional panels; pair prompt | H2 | Vystihne společný sklon nízké i vysoké stromy? | One line of visible code: `lm(objem_m3 ~ prumer_cm + vyska_m)`. Full-width figure: **four panels in one row**, one per height quartile (7–9 trees each), each with the band's trees (grey) and the additive line (purple) at the band's median height, drawn only over the band's diameters. Strip labels give the height range. Fragment prompt (pairs): „Kde leží body nad přímkou a kde pod ní?“ Speaker note: height bands are only for drawing; the model uses height as a number. |
| 47 | Evidence reveal: key conditional-panel slide | H2 | Čím vyšší strom, tím strmější přímka | Same four panels with the **interaction-model** lines (purple) and the lowest band's line as a grey dashed reference in every panel, clipped to that band's diameters. Fragment takeaway: „Sklon průměru [roste s výškou]{.text-hgl-orange}.“ `fig-alt` describes all four panels. Speaker note: run a finger along the purple lines from left to right; compare with the grey line. |
| 48 | Formula and slope at chosen heights | H2 | `prumer_cm * vyska_m`: sklon průměru závisí na výšce | Visible code `mod_stromy <- lm(formula = objem_m3 ~ prumer_cm * vyska_m, data = data_stromy)` and `coef()` output. Rule line: sklon průměru = koeficient `prumer_cm` + koeficient `prumer_cm:vyska_m` × výška. Three computed slopes at 21, 23 and 25 m as a short list or mini-table, highlighted purple. |
| 49 | MCQ on the conditional main coefficient | H2 | Pro který strom platí koeficient `prumer_cm`? | Coefficient value computed inline. Options: A „Pro každý změřený strom.“ B „Jen pro nejnižší stromy v datech.“ C „Pro žádný: tlustší kmen má méně dřeva.“ D „Pro strom vysoký 0 m, tedy pro žádný změřený strom.“ Correct D, circled after a pair-argue round. Speaker note mirrors the crab MCQ (row 28). |
| 50 | Result with limits | H2 | Co víme o stromech? | Left `panel-result`: the same 8 cm step (28 → 36 cm) adds about 0,31 m³ at 21 m and 0,46 m³ at 25 m; 95% interval of the interaction computed inline. Right `panel-question`: 31 stromů bez popsaného výběru; rezidua a vliv jednotlivých stromů jsme nekontrolovali; zakřivení? Speaker note: on a log scale the interaction disappears (scale box in the written materials). |
| 51 | Section divider (old 44) | H1 | Jedna myšlenka, tři obrazy | Renamed from „…dva obrazy“. |
| 52 | Comparison (old 45) | H2 | Interakce mění sklon nebo skupinový rozdíl | **Third panel C** „číselný × číselný“: tree points with three interaction lines at 21, 23 and 25 m over the common observed diameter range, lighter to darker purple, labelled with height. Third column of „Co se mění?“: „Sklon průměru s výškou.“ Panels A and B unchanged. |
| 53 | Repair task (old 46) | H2 | Co musíme doplnit, aby tvrzení o efektu bylo úplné? | **Add** „Průměr kmene má efekt.“ to the incomplete claims and „Při jaké výšce?“ to the repair list. |
| 54 | Rule (old 47) | H2 | Jak číst model s interakcí? | Retain; the four panels are already general. |
| 55 | Summary (old 48) | H2 | Co si odnést | **Add one bullet:** „U dvou číselných prediktorů se [sklon jednoho plynule mění]{.text-hgl-orange} s hodnotou druhého.“ |
| 56 | Candidate models (old 49) | H2 | Který biologicky smysluplný model máme zvolit? | Retain. |
| 57 | Closing question (old 50) | H2 | Kde byste čekali interakci vy? | **Broaden** the prompt to the shared closing question: „…vztah dvou znaků závisí na skupině nebo na hodnotě jiného znaku“. Speaker note adds the numeric-moderator example. |

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Rows 1–43 | Unchanged | Unchanged | Unchanged | Unchanged |
| Tree question / 44–45 | Interaction named (row 15); L07 additive model with two numeric predictors | Second dataset; geometric expectation | Any tree model result | Context panel, pair prediction with fragment answer |
| Conditional panels / 46–47 | Rows 12–14 (parallel lines as an assumption, changing gap) | Height bands as a display device; common slope fails; slope grows with height | Coefficient arithmetic for trees | Two four-panel figures, pair prompt, fragment takeaway |
| Model and coefficients / 48–49 | Rows 16, 22–28 (`*` expansion, conditional coefficients, crab MCQ) | Slope = β₁ + β₃ × výška; main coefficient at 0 m | Centring; model comparison | Code, `coef()` output, three slopes, MCQ |
| Tree result / 50 | Rows 30 and 43 (result-with-limits pattern) | Supported statement in observed range; limits | Log-scale modelling (notes only) | Two-panel result slide |
| Ending / 51–57 | Whole lesson | Three pictures of one idea; „při jaké výšce?“; recap; transfer | R², AIC | Three-panel comparison, repair task, rule, summary, closing question |

## Implementation and review contract

- Reuse `R/Functions/build_tree_bands.R` and `R/Functions/plot_tree_panels.R` for rows 46 and 47 so the slides show the same figure as the written materials; larger `base_size` for slides. Colours: tree points graphite, model lines indigo velvet, reference line grey dashed; text highlights match (model → indigo velvet, changing slope → orange).
- Numbers from `data/stromy.csv` via inline R and `format_value_cz()`; named teaching inputs `prumery_porovnani_cm` and `vysky_porovnani_m` as in the written materials; no hand-typed computed values.
- Visible code in base R; figures may use `ggplot2`; `fig-alt` on every figure; facilitation in `{.notes}`; no `<style>` or inline `style=`.
- Visual rhythm: rows 46, 47 and 52 are full-width figures; at most 3 of any 5 consecutive slides use a named panel or box as the main element.
- In-deck MCQ answer positions: B, C (crab rows 28, 39), D (row 49).
- Timing: the new block adds about 8–10 minutes. Interaction every few slides: pair prediction (45), pair reading (46), MCQ (49).
- Order: implement, clean-session run of visible chunks, canonical render (HTML and PDF), visual check of every new slide and fragment state, separate read-only vision review of the complete deck, then human review.

## Implementation notes (2026-10-17)

- Rows 44–57 implemented as approved; deck renders to 57 slides.
- Row 52 deviation: panel C shows two lines, at exactly 21 and 25 m (the comparison heights of row 50), each over the diameters observed in the height band that contains that height, with large end labels. Three lines at 21/23/25 m over the common diameter range were very short, and three or four labelled lines collided in the narrow panel.
- Row 47 heading changed after review from „Čím vyšší strom, tím strmější přímka“ to the question „Mění se sklon přímky s výškou stromu?“; the claim moved to the orange fragment, so the slide no longer gives its answer away before students look.
- Row 45 and 46: plain bold instead of graphite highlights, which rendered as heavy black boxes.
- Data loading for the tree slides is a hidden chunk on row 45; the visible model code on rows 46 and 48 matches the written materials.
- Validation: offline canonical render (`POLLSLIVE_RENDER_MODE=offline`, because the sync mode needs a pushed upstream branch) passed with 57 slides; no `NA` in rendered text from slide 44 on; new slides 44–57 inspected as PDF images. Sass „variable used before declaration“ warnings refer to brand colour variables in the generated theme SCSS, not to slide content.

## Independent review (2026-10-17)

- Reviewer: read-only vision review of the complete deck with `.ai/agents/vision-corrector.md` (Sonnet, balanced effort: complete-deck pedagogical review), including slide images 7 and 44–57 and a diff of slides 8–43 against `main` (unchanged apart from slide 7).
- Resolved: panel display explained on slide 46 (footer and targeted pair prompt); `build_tree_bands()` moved to slide 46 where it is first used; panel C lines at exactly 21 and 25 m with legible labels; slide 45 no longer implies Czech trees or a documented location („z amerických jednotek převedeno“); slide 48 coefficients rounded to 5 digits so the slope table recomputes by hand; slide 49 option D shortened to remove the length cue; slide 50 units and „podle modelu“; slide 47 heading turned into a question; slide 45 answer wording; footers on 46–47 shortened; slide 46 figure smaller.
- Not changed: panel A keeps group colours for its model lines (documented sex-palette exception); missing tree diagnostics are flagged on slide 50 as a known limit.
- Verification: the same reviewer confirmed all items resolved; the final two points (location wording, cramped prompt) were fixed and re-rendered.

## Human review

- Presentation approved by Ondřej Mottl on 2026-10-17 („I am happy with the presentation“).
- After the author pushed the branch, the canonical sync render (`R/render_presentation.R`, PollsLive sync mode) passed with 57 slides; `presentation.html` and `docs/index.html` again contain the live PollsLive join and results embeds that the earlier offline render had replaced.

## Author audit

- Heading strip 44–50 reads as question → evidence → reveal → model → check → result; every heading is a content question or claim.
- The geometric expectation (45) precedes any tree figure; bands are explained (46) before the key reveal (47).
- The term *interakce* is already earned in row 15; the new block reuses it without re-introducing it.
- The crab rows and the PollsLive block are untouched.
