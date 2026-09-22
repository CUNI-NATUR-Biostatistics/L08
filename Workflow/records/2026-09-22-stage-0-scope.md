# Stage 0 - Vymezení L08

## Metadata

- Week: L08
- Date: 2026-09-22
- Author: AI assistant, using the canonical course outline
- Reviewer: Ondřej Mottl (approved 2026-09-22)

## Git checkpoint

- Stage group: Stages 0-1 planning
- Branch: `lesson/l08-scope-data`
- Base branch and commit: `main` at `dd4f544` (initial template commit)
- `git status --short` reviewed: yes; clean before this record
- Previous-stage PR merged: N/A (new weekly repository)
- Planned PR: Stages 0-1 planning, after dataset research and human decision

## Weekly outcomes (mapped)

Canonical source: `_internal/osnova_lekci.md`, section **L08 – Interakce prediktorů**.

1. Rozpoznat biologickou otázku, která vyžaduje interakci.
2. Fitovat jednoduchý model s interakcí a vizualizovat jeho predikce.
3. Interpretovat interakci i podmíněné hlavní efekty bez mechanického čtení jednotlivých koeficientů.

## Inspiration consulted

- Authoring problem to solve: make a change in one predictor's effect across another predictor understandable before interpreting coefficients.
- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: Modern Statistics with R for the model-based sequence; genomicsclass / PH525x for interaction examples; CUNY Biostatistics book for biological framing.
- Pattern worth borrowing: begin with a biological question and plotted predictions, then connect the visual contrast to the interaction model.
- Pattern rejected: starting with a coefficient table or an abstract product-term formula; importing advanced genomic examples or package-heavy visible code.
- Why this fits: L07 already shows parallel prediction lines from an additive model and asks whether the temperature relationship could differ by population origin. L08 can turn that open question into a testable interaction question.

## Concrete student actions

1. Formulate a biological question in which the relationship between a quantitative predictor and a response could differ between groups.
2. Compare an additive model's parallel prediction lines with a model that allows group-specific slopes.
3. Fit `lm(y ~ x1 * x2)` and plot predictions for meaningful predictor values or groups.
4. Explain the predicted change within each group and what the conditional main effects mean at the reference group or specified predictor value.

## Out of scope this week

- Systematic candidate-model ranking with R², adjusted R², or AIC (L09).
- Nonlinear functional forms and transformations (L10).
- Higher-order interactions or a catalogue of every predictor-type combination.
- Causal interpretation from observational associations without study-design support.

## Risks and dependencies

- Risk: a convenient dataset may show non-parallel lines only because of sparse ranges, influential observations, or hidden grouping. Stage 1 must probe these before selection.
- Dependency: use the approved L07 concept bridge, while checking the final L07 release state before reusing its exact data or visual.
- Inspiration risk: interaction teaching can drift into mechanical coefficient reading; keep predicted values and the biological comparison primary.

## Decision

- [x] Scope mapped from the canonical weekly outcomes
- [x] Continue Stage 1 research on this same planning branch
- [x] Scope approved by human author
- Notes: Ondřej Mottl approved the Stage 0 scope and the blue-form crab data story on 2026-09-22. Stage 1 records the dataset decision separately.
