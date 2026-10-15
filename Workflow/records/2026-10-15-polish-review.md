# L08 polishing review

## Scope

- Date: 2026-10-15.
- Artifacts: `Learning_materials/skripta.qmd`, `Presentation/presentation.qmd`, `Exercises/cviceni.R` at `main` `949ca81` (released L08-v1.2.1 plus later maintenance).
- Basis: canonical `.ai/` guidance and a bidirectional comparison with the polished L06 and L07 (L06 for the exercise format).
- Method: complete source read of all three artifacts; committed `presentation.pdf` (47 slides) and `skripta.pdf` (23 pages) inspected page by page at overview resolution; untracked probe recomputed every exercise expected result and the main values quoted in prose and slides (all reproduce); `data/krabi.csv` equals `MASS::crabs` value by value.
- Not yet done: full-size inspection of every slide and fragment state, HTML inspection, clean-session run of `cviceni.R`, independent reviewer subagents. These belong to the implementation stage.
- Branch: `polish/l08-before-teaching` from `main` `949ca81` (created 2026-10-15 with explicit authorization).

## Key data facts used by the maps

- Blue form: 100 crabs (50 females, 50 males), no missing values. Female length range 14,7–40,9 mm, male 16,1–47,1 mm.
- Additive model: common slope 0,3316 mm/mm; male − female −1,7172 mm.
- Interaction model: intercept 0,7077; female slope 0,4067; `pohlavisamec` +1,9731 (at 0 mm); interaction −0,1245 mm/mm (95% CI −0,1506 to −0,0983). At 30 mm: female 12,910, male 11,150, difference −1,761 mm. Lines cross at 15,85 mm, just outside the common range.
- Residual check: a quadratic term per sex does not improve the fit (p = 0,14); residual SD by fitted tercile 0,41 / 0,36 / 0,48 mm; the interaction persists on the log–log scale.
- Both forms: group means 28,10 / 32,01 (blue F/M), 34,62 / 33,69 (orange F/M); interaction −4,842 mm (95% CI −8,59 to −1,10). Group sizes are fixed at 50 by the study design.
- Final values come from the rendered objects; these probes only guide the narrative.

## Biological source for decision D1

Campbell, N. A. & Mahon, R. J. (1974), *Australian Journal of Zoology* 22: 417–425, doi:10.1071/ZO9740417. The abstract reports that, within each species, the sexes separate along a contrast of rear width and carapace length, with males having a greater relative carapace length than females. The authors treat the blue and orange forms as two distinct species. The rear of the carapace lies over the abdomen, which in brachyuran females carries the egg mass and often grows allometrically after maturity; the lesson presents this only as a biological expectation, not as a finding of these data.

## Findings

### A — cross-artifact

| ID | Finding | Proposed resolution |
|---|---|---|
| A1 | No biological reason for the sex × length interaction in any artifact; example 2 has no question of its own, and its group means of carapace length depend on which crabs were collected (50 per group by design). | Sourced expectation in the opening (D1); example 2 reframed as size dimorphism that may differ between the forms, with a visible sampling caveat. |
| A2 | Three sex palettes: magenta/teal (written materials, deck) and purple/orange (exercise), all overlapping brand semantic colours. | One mapping everywhere; implemented as green `#009E73` / reddish purple `#CC79A7` after the revised D2. |
| A3 | Written materials and deck load `MASS::crabs`; the exercise reads `data/krabi.csv`. | CSV link, save-to-`data/` instruction and visible `read.csv(file = "data/krabi.csv")` with `root.dir`, as in L07. |
| A4 | Learning outcomes differ between artifacts; intro wording differs from the course formula. | One shared list of five (below). |
| A5 | The 30 mm comparison length is a literal in many places; object names encode it (`odhad_samice_30`, `rozdil_30`, `data_30_mm`); names differ across artifacts. | One named input `delka_porovnani_mm`; neutral names (`data_porovnani`, `rozdil_porovnani`); same names in all artifacts. |
| A6 | Written materials print decimal points; deck math shows „0, 407“ spacing. | `format_value_cz()` from L07, including `math = TRUE`. |

### B — learning materials

| ID | Finding | Proposed resolution |
|---|---|---|
| B1 | No brand theme or named colours, no `fig-alt`, key figures tiny in PDF. | `theme_biostat()`, categorical palette, `fig-alt` on every figure, larger figure sizes, explicit base-R text sizes. |
| B2 | „Co si odnést“ sits under an unrelated heading; no spine answer, bridge or closing question. | L07 ending: spine answer, „Co bude následovat dál“, „Shrnutí“, „Závěrečná otázka“, glossary. |
| B3 | Residual check is not interpreted for this model. | State what the plot shows (no curvature, similar spread) and what it cannot show. |
| B4 | Glossary setup without remote/local fallback; `Sys.setlocale` workaround in setup. | L07 setup pattern. |
| B5 | Missed first glossary uses (*sklon* ×2, *prediktor*, *interakce*, *nejistota*, *reziduální směrodatná odchylka*, *porovnání modelů*); two TODO slugs still missing. | Wrap; keep the two TODOs unless the slugs are added to `slovnik`. |
| B6 | Visible assignments on one line; sequencing words in prose. | Course formatting; content-led transitions. |

### C — presentation

| ID | Finding | Proposed resolution |
|---|---|---|
| C1 | No title-slide image (release exception granted 2026-10-08). | Reserved `.course-title-illustrated` slot and recorded prompt in the existing paper-cut style (D3). |
| C2 | Hand-typed „100 krabů“, „50 samic · 50 samců“. | Inline R. |
| C3 | Illustration record and slides incomplete: non-standard disclosure, no speaker notes, no alt-text/status rows, image on an H1 divider, style differs from the course series. | Standard disclosure, notes, complete `GENERATED_IMAGES.md`, four-crab image moved to the next content slide; style deviation recorded (D3). |
| C4 | Prediction slides: shadowed `eval: false` code, unexplained `interval = "confidence"`, misaligned error bars, ungrammatical heading, plot overflow on slide 19. | Evaluated visible code with output, no prediction intervals on these slides, conclusion heading, figure fitted to the slide. |
| C5 | Code clipped on slide 9. | Shorter lines. |
| C6 | Loess smoother on the residual plot contradicts the footer; interpretation in the footer. | No smoother; interpretation in the slide body. |
| C7 | Red warning panels used without warning meaning; decorative highlight alternation; amethyst only on slide 47. | Panels by meaning; highlights: model results indigo, interaction / current contrast orange. |
| C8 | About ten slides without a student task in the second example; one in-deck MCQ. | New MCQ before the four-coefficient reveal. |
| C9 | Top-heavy slides (7, 18, 20, 23, 25, 31, 35, 41), small figure on slide 33, dense slide 29. | Composition pass after render. |
| C10 | „L09:“ footer, „Čteme nejprve“, rounding 0,407 − 0,124 = 0,282, `f(délky)`. | Fix in place. |
| C11 | English chunk labels; `data_formy` one slide early; brand fonts disabled in figures; Windows-only emoji font. | Czech labels; locality; `use_ragg_brand_fonts()` from L07; emoji circles removed (D2). |
| C12 | Offline PollsLive variant: tiny evidence, orphan colon; L07 evidence shows a decimal point. | Upstream (`_pollslive`, L07 assets); not changed in L08. |

### E — exercise

| ID | Finding |
|---|---|
| E1 | Preamble thinner than L06 (folder tree, panels, Ctrl+Shift+C, task dependencies). |
| E2 | U07 overloaded; `segments()` new, `points()` rare; Nápověda 1 names `tapply()`. |
| E3 | U08 places supplied code inside `Zadání`; four data frames plus four `summary()` calls. |
| E4 | Factor-position colour indexing described as name indexing; `abline(a =, b =)` never named. |
| E5 | Refresher section introduces new syntax; species wording; missing blank line before the final section. |

Timing: core route 68–70 min against the 85–95 min budget.

## Shared learning outcomes (proposed)

„Po prostudování této lekce budete schopni:“ (written materials) / „Po absolvování této přednášky budete schopni:“ (deck) / „Po dokončení cvičení budete schopni:“ (exercise)

1. rozpoznat biologickou otázku, ve které vztah jednoho prediktoru k odezvě závisí na hodnotě nebo úrovni druhého prediktoru;
2. fitovat model s interakcí a zobrazit jeho předpovědi pro číselný i skupinový prediktor;
3. vyložit koeficienty modelu s interakcí jako podmíněné a porovnávat skupiny pomocí předpovědí při zvolené hodnotě druhého prediktoru;
4. vysvětlit interakci dvou skupinových prediktorů jako rozdíl dvou rozdílů;
5. omezit závěr na pozorovaný rozsah dat a na souvislost v pozorovacích datech.

## Decisions

| ID | Question | Recommendation |
|---|---|---|
| D1 | Biological rationale and example 2. | Sourced expectation (above); keep example 2, reframed as differing size dimorphism, with a visible sampling caveat. |
| D2 | Sex colours. | L06 mapping (terracotta / steel blue); forms distinguished by panel and text labels, so the 🔵/🟠 circles are removed. **Superseded 2026-10-15** — see „Revised decision D2“: green `#009E73` / reddish purple `#CC79A7`, 🔵/🟠 for the forms. |
| D3 | Title image and illustration style. | Keep the three paper-cut illustrations, record the style deviation, add a title slot and prompt in the same style. |
| D4 | Exercise polish in this round or later. | This round (decided 2026-10-15). |

## Human decision

- 2026-10-15, Ondřej Mottl: „i agree, go“ — review findings and recommendations D1–D3 accepted; branch `polish/l08-before-teaching` authorized and created from `main` `949ca81`.
- Story maps: drafted 2026-10-15 and approved the same day: „I approve both presentation and learning materials“ (recorded in each map).
- D4: „yes, do the excercise as well“ (2026-10-15) — the exercise is polished in this round from a separate exercise-polish blueprint.

## Revised decision D2 (2026-10-15)

- Ondřej Mottl, after implementation: „I think the fakt we have blue and orange form is really calling for making the sexes a different colours. It may be needed to recreate the ilustrations but it may really help the understaning“.
- Chosen option: sexes bluish green `#009E73` (samice) and reddish purple `#CC79A7` (samec), a colour-blind-safe pair that avoids blue, orange and the brand purple; blue and orange mark the colour forms (🔵/🟠 in figure labels and slide text, not in Typst prose). Shapes ●/▲ remain the second cue.
- Illustrations: „Re-prompt all four“ — new prompts recorded in `Presentation/Materials/GENERATED_IMAGES.md`; current images stay until replaced.
- This supersedes the L06 terracotta/steel-blue mapping for L08 only; L06 is unchanged (lesson-specific, because L08 has blue and orange crab forms).

## Independent review outcomes (2026-10-15)

| Review | Model | Outcome | Resolution |
|---|---|---|---|
| Vision, written materials | Sonnet (capable general-purpose, balanced) | No HIGH; MEDIUM: spine answer overclaimed mechanism and non-random sampling; LOW: rationale wording, stage-1 equation overflow in PDF, sign spacing, „Nejprve“, literal 50, heading wording | All resolved; sign and decimal handling moved into `format_value_cz(math = TRUE)` (`	ext{−0,1245}`); equation re-laid out; heading „Kdy musíme při výkladu jednoho prediktoru uvést hodnotu druhého?“ |
| Glossary coverage | Haiku (economical, bounded check) | 16 missed first occurrences | Applied (sklon, interakce-predikatoru, intercept, promenna, vyber, prumer, bodovy-graf, interval-spolehlivosti); later duplicate wrappers in the same section removed |
| Vision, presentation | Sonnet | HIGH: `vec_interval_formy` locality; MEDIUM: no visible MCQ closure on slide 39, missing sampling caveat before results, `.card-title` in panels, top-heavy slides, crowded slides 29/30/39/49, overlapping slides 47/48, slide 40 heading, deck ahead of skripta (difference CI, violins); LOW items | All MEDIUM/HIGH resolved; LOW items resolved except component-count windows and orange-text contrast (brand class) |
| Exercise | Sonnet | No findings above LOW; five LOW (U05 pre-answered range check, U04 Zadání, unnamed single arguments, `unname()`, hint repetition) | All resolved |

## Re-verification (2026-10-15)

The same reviewers checked their corrections:

- Exercise: all five LOW findings confirmed fixed, nothing new; ready for human review.
- Written materials: all findings resolved, no HIGH/MEDIUM; LOW items (pale samec points, stale palette text in records) fixed; glossary re-check found two duplicate wrappers and one missed first occurrence, all fixed.
- Presentation (50 slides, final fragment states only): all earlier HIGH/MEDIUM resolved; new MEDIUM items (slide 33 footer collision, slide 39 table/option spacing) and LOW items (pale points, slide 32 heading wrap, slide 45 strip clipping, slide 47 balance, stale record text) fixed and re-rendered.
- Open for the author: orange carries two meanings on slides 36, 37, 40 and 43 (interaction highlight vs. the oranžová form shown by 🟠); whether to register the green/reddish-purple pair in `_brand`; emoji in figures depend on a colour-emoji font at render time (renders are local on Windows).
- Validation gap: initial and intermediate fragment states were not inspected as images; check them in the HTML before teaching.

## Illustrations completed (2026-10-15)

- Title image `krabi_titulni_ilustrace.png` (T2) now exists on slide 1; the C1 release blocker is resolved.
- The three in-deck illustrations were redrawn in the same painted watercolour/gouache style with the new sex colours (badges on slide 32, trails on slide 49). D3 (paper-cut style deviation) is superseded; the series now matches the course illustration style.
- Provenance, prompts and SHA-256 hashes are in `Presentation/Materials/GENERATED_IMAGES.md`; the reference figure is kept in `Presentation/Materials/title_references/`.

## Orange on slides 36, 37, 40 and 43 (2026-10-15)

- Ondřej Mottl: „That is a different orange, so no issue.“ The interaction highlight (brand orange) and the 🟠 form cue stay as they are; no change.
- L09 retrieval assets in the old sex colours are handled separately by another agent, outside this branch.
