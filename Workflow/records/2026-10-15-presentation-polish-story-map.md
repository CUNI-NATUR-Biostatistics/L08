# L08 presentation polishing story map

## Scope and approval record

- Artifact: complete `Presentation/presentation.qmd`, including the PollsLive retrieval block.
- Date: 2026-10-15.
- Branch: `polish/l08-before-teaching`; base: `949ca81`.
- Requested work: resolve findings A1–A6 and C1–C11 in [the review](2026-10-15-polish-review.md), with decisions D1–D3 recorded there. C12 belongs upstream.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-15.
- Decision and requested revisions: explicit user decision „I approve both presentation and learning materials“ (2026-10-15), recorded separately for each map; no revisions to rows or ledger.
- This map is separate from the learning-material map and needs its own approval. It is derived from the revised written backbone. PollsLive quiz content and option order are unchanged.

## Complete physical story map

Each row is one physical slide. H1 rows are minimal section dividers. Fragment states do not count as extra slides. The deck grows from 47 to 49 slides (new rows 9 and 39).

| Order | Internal role | Level | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 1 | Arrival screen | H2 | Liší se vztah délky a zadní šířky krunýře mezi samicemi a samci? | `.course-title-illustrated` with reserved slot `krabi_titulni_ilustrace.png`; L08, formal title, materials link unchanged. |
| 2 | Measurement-context hook | H2 | Co vlastně na krabovi měříme? | Retain illustration; standard disclosure „Ilustrace vytvořená pomocí AI.“; speaker note on the metaphor. |
| 3 | Retrieval title | H2 | Co si pamatujete z minulé lekce? | Unchanged generated include. |
| 4 | Retrieval Q1 | H2 | Co znamená záporný koeficient roční teploty v modelu s roční i maximální teplotou? | Unchanged. |
| 5 | Retrieval Q2 | H2 | Kterému odhadu z modelu se dvěma teplotami bychom měli více důvěřovat? | Unchanged. |
| 6 | Retrieval Q3 | H2 | Prohodíme pořadí dvou korelovaných teplot ve formuli. Co se může změnit? | Unchanged. |
| 7 | Learning contract | H2 | Výsledky učení | Shared five-item list; „Po absolvování této přednášky budete schopni:“; incremental, restrained highlights; balanced vertical placement. |
| 8 | Section divider | H1 | Když rovnoběžné přímky nestačí | Retain. |
| 9 | Biological question (new) | H2 | Proč by se samice a samci mohli lišit tvarem krunýře? | Short context panel: zadní část krunýře leží nad zadečkem; samice pod ním nosí vajíčka; Campbell a Mahon (1974): pohlaví se liší zadní šířkou vzhledem k délce. Open question in `panel-question`: „Bude rozdíl v zadní šířce u malých i velkých krabů stejný?“ Citation in footer. |
| 10 | Data entry | H2 | Jeden bod představuje jednoho kraba | `read.csv(file = "data/krabi.csv")` and selection in short lines (no clipping); computed counts in the data panel; species wording as in the written materials; no emoji. |
| 11 | Whole-data encounter | H2 | Co naznačují naměření krabi? | Retain three prompts; categorical palette; `fig-alt`. |
| 12 | Familiar additive model | H2 | Aditivní model kreslí rovnoběžné přímky | Retain. |
| 13 | Pair prompt | H2 | Zůstává rozdíl mezi pohlavími při každé délce stejný? | Retain. |
| 14 | Evidence reveal | H2 | Data naznačují různé sklony | Retain. |
| 15 | Concept naming | H2 | Když se rozdíl mění, mluvíme o interakci | Panels by meaning (familiar additive: neutral data panel; interaction: model panel); „rozdíl se mění s délkou“ replaces `f(délky)`. |
| 16 | Formula | H2 | Jak zapsat model s interakcí? | Retain. |
| 17 | Model and lines | H2 | Model s interakcí dovoluje dvěma pohlavím různé sklony | Retain. |
| 18 | Prediction prompt | H2 | Co model odhaduje pro dva kraby dlouhé 30 mm? | 30 from named `delka_porovnani_mm` in heading, line and prompt. |
| 19 | Transparent prediction | H2 | Dva odhady při stejné délce krunýře | One evaluated visible chunk: `data_porovnani` built from `delka_porovnani_mm`, `predict()` output shown; no hidden duplicate, no `interval = "confidence"`. |
| 20 | Result | H2 | Samec má při 30 mm užší zadní část krunýře | Three computed values; figure fitted to the slide (no overflow), both estimates marked on their lines without error bars. |
| 21 | Checkpoint | H2 | Co už můžeme říci o stejně dlouhých krabech? | Retain content; balanced layout; no emoji. |
| 22 | Section divider | H1 | Koeficienty interakčního modelu | Retain. |
| 23 | Output | H2 | Jaké jsou koeficienty v `summary()`? | Takeaway „Pro výklad stačí sloupec Estimate.“ (no sequencing word). |
| 24 | Reference coefficients | H2 | První dva koeficienty popisují referenční samice | Two panels with the same treatment; intercept caveat kept in text. |
| 25 | Group coefficient | H2 | Koeficient pohlaví porovnává skupiny při délce 0 mm | Retain. |
| 26 | Interaction coefficient | H2 | Interakční koeficient mění sklon samců vůči samicím | Same panel treatment; consistent four-digit values so the displayed sum adds up; Czech decimals in math. |
| 27 | Composition at 30 mm | H2 | Rozdíl při 30 mm skládají dva známé příspěvky | Named input instead of „třicet“ and literal 30; Czech decimals in math. |
| 28 | MCQ | H2 | Platí koeficient `pohlavisamec` při každé délce? | Options reordered so the correct answer („Ne, pouze při délce 0 mm.“) is B; circled after discussion. |
| 29 | Model check | H2 | Jak dobře přímky popisují naměřené kraby? | No loess smoother; graph + takeaway layout with the interpretation in the body; „Residuum (mm)“. |
| 30 | Spine return | H2 | Co teď víme o krabech modré formy? | Opening question verbatim in `box-question`; left `panel-result`: slopes and the difference at the comparison length with CIs; right `panel-question`: příčina, kraby mimo vzorek, jiné druhy. Replaces the dense results slide. |
| 31 | Section divider | H1 | Když jsou oba prediktory skupiny | Minimal; illustration moves to row 32. |
| 32 | New question with context | H2 | Liší se rozdíl mezi pohlavími u modré a oranžové formy? | Four-crab illustration with standard disclosure and notes; response and predictor panels; short sampling note: „Do každé skupiny vybrali autoři 50 krabů.“ |
| 33 | Raw four groups | H2 | Jaké délky vidíme ve čtyřech skupinách? | `data_formy` created here; text facet labels; footer: průměrné délky závisejí na tom, které kraby autoři sesbírali. |
| 34 | Silent write | H2 | Je rozdíl mezi samci a samicemi u obou forem stejný? | Larger figure; prompt retained. |
| 35 | Evidence reveal | H2 | Průměry ukazují dva různé rozdíly | Retain. |
| 36 | Two differences | H2 | Jak velký je rozdíl samec minus samice v každé formě? | Same panel treatment for both forms; Czech decimals in math. |
| 37 | Concept | H2 | Interakce je rozdíl dvou rozdílů | Retain without emoji. |
| 38 | Formula and output | H2 | `forma * pohlavi` zapíše všechny čtyři kombinace | Retain. |
| 39 | MCQ (new) | H2 | Který údaj je rozdíl samec − samice v oranžové formě? | Coefficient table repeated; options A `pohlavisamec`, B `formaoranžová:pohlavisamec`, C součet `pohlavisamec` a `formaoranžová:pohlavisamec`, D `formaoranžová`; correct C, circled after discussion. |
| 40 | Reveal | H2 | Čtyři koeficienty skládají čtyři skupinové průměry | Layout without awkward wraps; no emoji. |
| 41 | Model means | H2 | Odhad pro každou ze čtyř skupin | Retain. |
| 42 | Group check | H2 | Rezidua jsou odchylky jednotlivých krabů od skupinových průměrů | Retain; „residua“ in labels. |
| 43 | Result with limit | H2 | Rozdíl mezi pohlavími závisí na barevné formě | Retain values; one line on the sampling limit; balanced layout. |
| 44 | Section divider | H1 | Jedna myšlenka, dva obrazy | Retain. |
| 45 | Comparison | H2 | Interakce mění sklon nebo skupinový rozdíl | Shared sex legend under both panels. |
| 46 | Repair task | H2 | Co musíme doplnit, aby tvrzení o efektu bylo úplné? | Retain. |
| 47 | Rule | H2 | Hlavní efekty v interakci jsou podmíněné | Highlights by meaning (model indigo, interaction orange), not alternating. |
| 48 | Summary | H2 | Co si odnést | Bullets mirror the shared outcomes. |
| 49 | Closing question | H2 | Který biologicky smysluplný model máme zvolit? | Retain illustration with standard disclosure and notes; interaction candidate highlighted orange (not amethyst); footer „Porovnání kandidátních modelů: následující lekce“ without lesson code. Closing question shared with the written materials appears as a fragment. |

## Illustrations

- Title slot (new): `krabi_titulni_ilustrace.png`.
- Retained in-deck series (D3, paper-cut style recorded as a lesson-level deviation from the watercolour series style): `krabi_mereni.png` (row 2), `krabi_ctyri_skupiny.png` (row 32, moved off the divider), `krabi_modely.png` (row 49).
- `GENERATED_IMAGES.md` gains per-image target slide, Czech alt text, status, and the title-image record below; existing prompts and hashes are kept.

## Title image (proposed record)

- File: `Presentation/Materials/krabi_titulni_ilustrace.png` (reserved slot; shows nothing until the file exists).
- Reference assets: `krabi_mereni.png`, `krabi_ctyri_skupiny.png` (series characters and style), the interaction-lines figure from row 17.
- Draft prompt: original flat editorial paper-cut illustration matching the L08 series; a female and a male blue rock crab on a sunny rocky shore, each with a plain caliper beside it; behind them, two thin trails in the sand that start close together and spread apart, in bluish green and reddish purple (revised D2; full prompt in `GENERATED_IMAGES.md`); playful academic tone; no text, letters, numbers, axes, charts, logos or watermarks.
- Alt text (draft): „Samice a samec modrého pobřežního kraba s posuvnými měřítky na skalnatém pobřeží; za nimi se rozbíhají dvě stopy v písku. Ilustrace vytvořená pomocí AI.“
- Caption: „Ilustrace vytvořená pomocí AI.“

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Opening / 1–7 | L01–L07; retrieval uses only L07 content | Spine question; outcomes | Interaction | Hook illustration, retrieval |
| Biology and data / 8–11 | L07 additive model | Sourced biological expectation; one crab per row | That the gap changes in these data | Context panel, code, scatter |
| Interaction named / 12–17 | Rows 8–11 | Parallel lines as an assumption; changing gap; *interakce* named after evidence; `*` = main terms + `:` | Coefficient meanings | Additive lines, pair prompt, separate lines, formula |
| Predictions / 18–21 | `predict()` from L07 | Comparison at one common length | Coefficient arithmetic | Prediction prompt, visible code, result figure |
| Coefficients / 22–30 | L06 reference level; L04 CI | Conditional coefficients; interaction as slope difference; composition at 30 mm; residual check; spine return with limits | Model comparison | Output, cards, MCQ, residual plot, spine-return panels |
| Two groups / 31–43 | L06 group coefficients and `emmeans()`; rows 22–30 | Difference of differences; reference combination; sampling limit | Model selection | Raw groups, silent write, means, equations, MCQ, `emmeans()`, residuals |
| Ending / 44–49 | Whole lesson | Two pictures of one idea; complete claims; recap; next question | R², AIC results | Comparison figure, repair task, rule, summary, closing question |

## Implementation and review contract

- Same shared rules as the learning-material map: sex palette `samice` `#009E73`, `samec` `#CC79A7` with 🔵/🟠 form cues (revised D2, 2026-10-15; originally `#C2613A` / `#2E6CA4` without circles); `format_value_cz()` (ported from L07) replaces `format_cz()`; named `delka_porovnani_mm`; data from `data/krabi.csv`; no hand-typed computed values.
- Illustrations: `include_optional_figure()` slot for the title image; disclosure „Ilustrace vytvořená pomocí AI.“ with `.text-size-tiny .text-right`; speaker note per illustration.
- Figures: brand fonts via `use_ragg_brand_fonts()` (ported from L07) instead of `family = ""`; `fig-alt` on every figure; Czech chunk labels; object locality; no `<style>` or inline `style=`; facilitation in `{.notes}`.
- In-deck MCQ answer positions: B, C.
- Order: implement after the written backbone, clean-session run of visible chunks, offline canonical render, separate read-only vision review including all fragment states, full PDF inspection, then human review.
- Author audit: heading strip reads as a content narrative; no sequencing words in visible copy; biological expectation before data; *interakce* first named in row 15 after the evidence; sampling caveat before the second-example results; no lesson code in visible copy.

## Review-driven and author-requested amendments (2026-10-15)

The deck has 50 slides (one more than approved): the closing question moved to its own minimal slide so slide 49 can breathe.

| Order | Approved heading | Implemented heading | Reason |
|---|---|---|---|
| 8 | Když rovnoběžné přímky nestačí | Platí rovnoběžné přímky i pro kraby? | Divider stated the conclusion before the evidence. |
| 11 | Co naznačují naměření krabi? | Co naznačují měření krabů? | Natural Czech. |
| 18 | Co model odhaduje pro dva kraby dlouhé 30 mm? | Co model odhaduje pro dva stejně dlouhé kraby? | The length is introduced by the visible code on the slide. |
| 29 | Jak dobře přímky popisují naměřené kraby? | Jak dobře přímky popisují změřené kraby? | Natural Czech. |
| 30 | Co teď víme o krabech modré formy? | Co víme o rozdílu mezi samicemi a samci modré formy? | No sequencing word. |
| 40 | Čtyři koeficienty skládají čtyři skupinové průměry | Co znamená každý ze čtyř koeficientů? | The slide defines the coefficients. |
| 47 | Hlavní efekty v interakci jsou podmíněné | Jak číst model s interakcí? | Content is a reading routine; now four panels. |
| 50 (new) | — | Kde byste čekali interakci vy? | Closing question on its own slide; slide 49 keeps the candidate models and the bridge sentence. |

Other changes: revised D2 colours and 🔵/🟠 form cues in figure labels, panel titles and result lists (not in headings, where emoji force awkward wraps); `vec_interval_formy` created on slide 40; visible MCQ closure on slide 39 with computed sum; sampling caveat on slides 32–33 before results; plain points on slides 33–35 (violins stay only for residuals, as in the written materials); spine slide 30 without the extra difference interval; `.panel-title` inside panels; vertical balance via `.slide-margin-top-15`; one dashed comparison line; ●/▲ cues in slide 20; „rozdíl(x)“ instead of Δ(x) on slide 27 and Δ defined in words on slide 37. Not changed: component-count windows 9–13 and 28–32 (each slide's component has a teaching role) and orange large text (brand class).
