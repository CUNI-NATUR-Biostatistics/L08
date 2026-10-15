# L08 exercise polishing blueprint

## Scope

- Artifact: `Exercises/cviceni.R`; addendum to [the approved exercise blueprint](2026-09-26-exercise-blueprint.md), which remains valid for outcomes, prerequisites, reference values and the optional bank unless changed below.
- Date: 2026-10-15. Branch: `polish/l08-before-teaching`.
- Authorization: D4 „yes, do the excercise as well“ (2026-10-15) in [the review](2026-10-15-polish-review.md).
- Requested work: resolve E1–E5 and the cross-artifact findings A1, A2 and A4 in the exercise.
- Stable task IDs: all 16 IDs (`L08-U01`–`L08-U08`, `L08-N01`–`L08-N08`) keep their numbers and core purpose.

## Changes

| Finding | Change |
|---|---|
| A1 | The biological expectation (rear of the carapace over the egg-carrying abdomen; Campbell a Mahon 1974) opens the first question; the second question gains the size-dimorphism framing and the fixed-50-per-group sampling caveat before `L08-U07`. Species wording: two colour forms that the authors treat as separate species. |
| A2 | `vec_barvy_pohlavi` uses `samice` `#C2613A` and `samec` `#2E6CA4`, the same mapping as the written materials and deck. Colours and symbols are selected by name with `as.character()`, explained in a short worked example before `L08-U02`. |
| A4 | Shared five-item learning outcomes („Po dokončení cvičení budete schopni:“). |
| E1 | Preparation follows L06: both file routes, saving steps, box-drawing folder tree, project explanation, Console/Plots/Environment panels, Ctrl + Shift + C, hint reading order, saving, explicit task dependencies, and the list of familiar functions. |
| E2 | `L08-U07` keeps its purpose (difference of differences from the model) but the four-group plot with means and connecting lines becomes a supplied, commented scaffold that computes the means with `tapply()` and draws them with `points()` and `segments()`. The task fits `mod_formy`, computes the three differences from coefficients and checks them against the plotted means. Nápověda 1 no longer names a function. |
| E3 | `L08-U08`: supplied `data_ctyri` moves to a worked block before the task heading; the four residual subsets are replaced by one `tapply()` call over `skupina` from `L08-U07`. |
| E4 | `L08-U03` Nápověda 2 names `abline(a = , b = )`. Hint text on colour lookup matches the name-based indexing. |
| E5 | The mislabelled refresher section is removed; the formula explanation already stands before `L08-U04`. Wording fixes („Převeďte“), `L08-U06` interpretation asks about sex rather than length as a cause, missing blank line restored. |

## Timing

Unchanged core budget of about 68–70 minutes direct work: `L08-U07` drops about 2 minutes (supplied means plot) and `L08-U08` about 1 minute (one `tapply()` call); the longer preparation text adds about 2 minutes of reading. The 85–95-minute ceiling is not approached.

## Validation required

Parse and UTF-8 checks; clean-session source run from a temporary project containing only `cviceni.R` and `data/krabi.csv`; untracked reference harness solving all 16 tasks with every stated expected value checked; visual inspection of the changed plots; prohibited-pattern and first-use audits; independent read-only review with `_internal/.ai/agents/exercise-reviewer.md`.

## Review outcomes and amendments (2026-10-15)

- Independent exercise review (Sonnet): no findings above LOW; five LOW findings resolved (U05 range check left to students, U04 names response and predictors, single arguments named and the legend example vertical, `unname()` explained in N07, hint repetition in U03/U08/N01 removed). The reviewer judged the core route closer to 85–95 min for absent beginners than to the documented 68–70 min; it stays within the ceiling, and the optional bank absorbs extra work.
- Revised D2: `vec_barvy_pohlavi` uses `samice` `#009E73` and `samec` `#CC79A7`; the expected result of U02 names green circles and reddish-purple triangles.
- Re-validation after the amendments: UTF-8 without BOM, longest line 76 characters, clean-session source from a student-style folder, reference harness: every numeric expected value reproduces.
