# L08 PollsLive retrieval quiz: harder replacement questions

- Date: 2026-10-19
- Branch: `pollslive-harder-retrieval`
- Workstream: focused post-presentation PollsLive revision
- Approver: Ondřej Mottl (human author)
- Decision: approved on 2026-10-19 in the authoring session, without requested revisions.

Integration-map status: unchanged and approved. Exact-question status: approved.

## Reason for the revision

After teaching L03 the author judged the retrieval questions far easier than the Moodle self-tests. In the previous L08 set the correct answers to the first two questions were the longest and only fully qualified options. The new set asks students to explain why a coefficient and its SE change after adding a correlated predictor, to recognise confounding behind a sign change, and to judge data support outside the overlap of two groups.

## Integration map

The retrieval block keeps its approved position before `Výsledky učení`. No other slide changes.

| Position | Teaching move | Student knowledge used | Bridge |
|---|---|---|---|
| Q1 | Explain a changed estimate and a larger SE after adding a correlated predictor | L07 conditional coefficients, correlated temperatures | Each coefficient answers a conditional question. |
| Q2 | Recognise confounding by origin behind a sign change | L07 origin plot and `mod_puvod` | The additive model holds one slope for both groups. |
| Q3 | Restrict a group comparison to the overlap of the predictor | L07 temperature ranges by origin | Additivity forces a constant group difference; L08 relaxes it with interaction. |

## Exact production questions

The canonical text is `pollslive/quiz.json`.

| Question ID | Correct option | Key | Distractors and the misconception each encodes |
|---|---|---|---|
| `zmena-sklonu-po-pridani-teploty` | conditional question, correlated temperatures | C | the first model was wrong; formula order changes coefficients; fewer populations were used |
| `znamenko-po-pridani-puvodu` | the overall slope mixed the two origins | A | causal sign reversal; non-significance means no effect; origin and temperature unrelated |
| `srovnani-mimo-prekryv` | extrapolation for native populations below 12 °C | B | marginal range taken as support; constant additive difference taken as support; additive model cannot predict |

Changes from the approved proposal, kept within its meaning: the Q1 and Q2 stems were shortened after the offline PDF showed the answer panel running off the slide. Q1 no longer repeats the coefficients shown in its evidence card and moves r ≈ 0,85 into the explanation. The Q2 slopes and the interval of the origin-adjusted slope moved from the stem into a subtitle of its evidence figure, and the Q1 evidence also prints that both models use 128 populations; both changes follow the independent review.

Checked numbers (fresh R session, 128 populations): simple slope of annual temperature −0,00913 (SE 0,00085); with maximum temperature −0,00528 (SE 0,00159); r = 0,85. In `puvod + teplota_rocni_C` the slope is +0,00149 mm/°C, 95% CI [−0,0009; 0,0039], and the introduced-origin shift is +0,109 mm. Annual temperature ranges: native 12,15–19,95 °C, introduced 5,95–16,35 °C.

## Knowledge-state ledger

| Item | Available before quiz? | Evidence in L07 |
|---|---|---|
| A coefficient is conditional on the other predictors; formula order does not change coefficients | yes | slides on `mod_dve_teploty` and `mod_dve_teploty_opacne` |
| Correlated predictors enlarge the SE | yes | learning materials and slides on shared climatic information |
| Confounding: the overall slope mixes between-group and within-group differences | yes | slides `Původ populací mění obraz vztahu` and `Co porovnává celkový sklon?` |
| Group comparisons only within the overlap of the numeric predictor | yes | slides `Jeden model spojí teplotu i původ` and `Která teplota leží v překryvu obou skupin?` |

## Evidence

| Asset | Source | SHA-256 |
|---|---|---|
| `l07-sklon-ve-dvou-modelech.png` | rendered by `R/render_pollslive_assets.R` (printed coefficient tables of both models) | `1588325c188bcf1daa02b821975d5bbb77736f2a65bc90db102b937df8680998` |
| `l07-tloustka-podle-puvodu.png` | redraw of the inline L07 figure `p_skupiny`, with the two slopes and the interval in a subtitle | `116c3f7d3b354b59ae113f953e4a3522a1e1716d0aeb5d6f5b0bd5a1d8a7dcff` |
| `l07-rozsahy-teplot.png` | redraw of the inline L07 figure `p_rozsahy` | `fd51ee50a5a4a82a12656602b712769380a4c15087882d649b56ff12ac10d69c` |

The two L07 figures are drawn inline in the L07 deck and are not saved as files, so they are redrawn from the same data, colours and theme. The emoji in their axis titles are left out, and the axis labels use decimal commas. The previous assets `l07-conditional-coefficient.png`, `l07-supported-scenario.png` and `l07-sequential-order.png` are removed.

## Answer key and course balance

L08 key: C A B. The course-wide table is in L04 `Workflow/records/2026-10-19-pollslive-harder-retrieval.md`.

## Validation

- `node pollslive/validate.mjs`: passed without credentials.
- `Rscript R/verify_pollslive_assets.R`: passed.
- Offline render: see the review section.

## Review

Independent read-only review: completed on 2026-10-19 by a separate reviewer subagent (canonical prompt `.ai/agents/vision-corrector.md`, scoped to the retrieval block of L04, L05, L06, L07, L08 and L10; a capable general-purpose model, chosen because the task is a focused content review of 18 short items). No blockers: every keyed answer was confirmed correct, every distractor wrong, and the course-wide key balance verified.

Should-fix, resolved: Q2 distractors could not be refuted because no interval was shown; the evidence subtitle now gives both slopes and the 95% interval. Minor, resolved: Q1 evidence now prints that both models use 128 populations, so the "fewer populations" distractor can be refuted. The abbreviation `max. teplotě` in Q1 is kept for layout.

Focused re-check of these corrections by the same reviewer: pending.

## Operational boundary

No staging, commits, pushes, live PollsLive operations, response submissions or activation changes were made.
