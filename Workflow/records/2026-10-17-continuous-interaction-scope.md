# Scope amendment - interaction of two numeric predictors

## Metadata

- Week: L08
- Date: 2026-10-17
- Author: AI assistant (Claude), from the author's request
- Reviewer: Ondřej Mottl
- Status: approved by Ondřej Mottl on 2026-10-17 („OK, continue with trees as secod dataset“, after confirming that both crab examples stay unchanged)

## Git checkpoint

- Stage group: post-release amendment across learning materials, presentation and exercise (precedent: `polish/l08-before-teaching`)
- Branch: `lesson/l08-continuous-interaction`, created with author authorisation
- Base branch and commit: `main` at `f5f1d54`
- `git status --short` reviewed: [x] clean before branching
- Planned PR: one amendment PR after all three artifacts pass independent and human review; separate story-map approvals per artifact

## Why the amendment

While building the L08 Moodle self-test, the author found that L08 teaches interaction only as numeric × group (`zadni_sirka_mm ~ delka_krunyre_mm * pohlavi`) and group × group (`delka_krunyre_mm ~ forma * pohlavi`). Students never see two numeric predictors interact, so they never practise the reading "the slope of one predictor changes continuously with the value of the other". The weekly outcome "Interpretovat interakci i podmíněné hlavní efekty" is incomplete without it, because with two numeric predictors the main coefficient is conditional on a value of zero that often lies far outside the data.

## Revised scope

- Stage 0 listed "Higher-order interactions or a catalogue of every predictor-type combination" as out of scope. This amendment adds exactly one more combination, numeric × numeric, as a compact third example. Higher-order interactions and a full catalogue remain out of scope.
- Learning materials: a compact third worked example after the two-group example, before the synthesis section.
- Presentation: a short new section with at least one slide of 3–5 conditional panels (each panel fixes one height and shows volume against diameter), and the synthesis "Jedna myšlenka, dva obrazy" extended to three pictures.
- Exercise: one new core task, `L08-U09`, appended after `L08-U08`; optional practice task `L08-N09` on the log–log refit.

## Non-goals

- Centring predictors as a taught technique, residual diagnostics or confidence intervals for the tree model beyond what the compact example needs.
- Changes to the PollsLive retrieval quiz (it retrieves L07) or to L09.
- New glossary terms; `interakce-predikatoru` already defines the concept for any predictor type.

## Dataset decision

| Candidate | Model | Finding | Decision |
|---|---|---|---|
| Blue-form crabs (`krabi.csv`) | e.g. `RW ~ CL * BD` | All carapace and body measurements correlate at r ≈ 0.99, so conditional panels would hold only thin size slices and the interaction mainly reflects collinearity. | Rejected |
| L07 knotweed populations | `tloustka_listu_mm ~ teplota_rocni_C * srazky_rocni_mm` and four other climate pairs | No clear interaction (temperature × precipitation p = 0.94; others p ≥ 0.10), or predictors strongly correlated (temperature × latitude r = −0.91). | Rejected |
| `datasets::airquality` | `Ozone ~ Temp * Wind` | Strong interaction (p = 7e-5), but already rejected in Stage 1: consecutive days are dependent, ozone values are missing, and it is not a biological question. | Rejected |
| Synthetic plant-growth data | growth ~ temperature × moisture | Clean panels, but conflicts with the real-data preference in `datasets.md`. | Rejected |
| `datasets::trees` (black cherry) | `objem_m3 ~ prumer_cm * vyska_m` | Strong, interpretable interaction with moderate predictor correlation. | **Selected by the author on 2026-10-17** |

## Selected data and numerical probes

- Source: `datasets::trees`, 31 felled black cherry trees (*Prunus serotina*, Czech „střemcha pozdní“, an invasive species in Czech forests, which may serve as a familiar hook); Meyer (1953) *Forest Mensuration*, via Ryan, Joiner and Ryan (1976). R documentation notes that `Girth` is actually the diameter in inches at 4 ft 6 in. The documentation gives neither location nor selection method, so the trees are not a documented probability sample.
- Delivery: `R/prepare_tree_data.R` exports the unchanged table to `data/stromy.csv` (SHA-256 `07d02f124e798c97d979079c3a8e61f6879c4486cd6953d272e17d8c733e4286`). Students convert units in visible code: `prumer_cm = Girth * 2.54`, `vyska_m = Height * 0.3048`, `objem_m3 = Volume * 0.0283168`.
- Ranges: diameter 21.1–52.3 cm, height 19.2–26.5 m, volume 0.29–2.18 m³; r(diameter, height) = 0.52.
- `lm(objem_m3 ~ prumer_cm * vyska_m)`: interaction +0.00493 m³ per cm per m (95% interval 0.00310 to 0.00675); R² 0.948 for the additive model and 0.976 with interaction; nested-model p = 7.5e-6.
- Slope of diameter: 0.033 m³/cm at 20 m, 0.048 at 23 m and 0.063 at 26 m. The main coefficient of diameter (−0.065 m³/cm) applies at a height of 0 m and has no biological meaning, which motivates reporting slopes and predictions at observed heights.
- On the log–log scale the interaction disappears (p = 0.70), because volume is roughly proportional to diameter² × height. This links to the existing box "Doplňující: interakce závisí na měřítku odezvy".
- Checks: adding a quadratic diameter term gives p = 0.09; one tree exceeds the 4/n Cook's-distance screen; height terciles hold 11, 13 and 7 trees.
- All numbers were recomputed from `data/stromy.csv` with R 4.5.1 and `Rscript --vanilla` on 2026-10-17.

## Biological question

**Přibývá objem dřeva s průměrem kmene stejně rychle u nízkých i vysokých stromů?** One extra centimetre of diameter adds a thicker ring along the whole trunk, so a taller trunk gains more wood. The interaction follows from trunk geometry rather than from a physiological mechanism; the materials say so plainly.

## Decision

- [x] Dataset approved by the author (2026-10-17)
- [x] Compact third example approved (2026-10-17)
- [x] New core exercise task approved (2026-10-17); placement as `L08-U09` after `L08-U08` proposed in the approved plan
- [x] Record approved by the author (2026-10-17); trees are an added second dataset, both crab examples stay unchanged
- Support check (2026-10-17): low trees reach only about 35–41 cm in diameter, so comparisons use diameters 28 and 36 cm and heights 21, 23 and 25 m, all inside the observed data, instead of the 25/40 cm and 20/26 m values in the original plan.
- Next step: learning-material story map and knowledge-state ledger, then stop for explicit approval before drafting prose.
