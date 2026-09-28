# L08 learning-material Extras revision

## Approval and scope

- Date: 2026-09-28
- Branch: `lesson/l08-learning-material-extras`
- Human approver: Ondřej Mottl
- Decision: approved in the course-wide L01-L08 Extra-content review and explicitly authorised for implementation on 2026-09-28.
- Scope: add bounded interaction extensions while preserving the previously approved original-scale model.
- Preserved prior decision: the 30 mm centred refit is not reintroduced because the 2026-09-22 human review found it confusing.

## Mandatory story map

- Artifact: Learning materials amendment
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-28
- Approval decision and requested revisions: The course-wide L01-L08 Extra-content map was approved and implementation was explicitly authorised; no revisions were requested. The table below records that approved content in the canonical format without changing its substance.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Formula safeguard | Doplňující: proč s interakcí ponecháváme i oba hlavní členy | Place only after the expansion and all four coefficients have been interpreted, then name the hierarchy principle. |
| 2 | Support boundary | Doplňující: interakci můžeme číst jen tam, kde máme data | Extend the existing residual and range warning by asking whether groups overlap where the comparison is interpreted. |
| 3 | Scale preview | Doplňující: interakce závisí na měřítku odpovědi | After both examples are synthesised in millimetres, contrast difference and ratio questions without fitting a new model. |

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| Hierarchy principle | Students have seen `x * z = x + z + x:z` and interpreted the lower-order and interaction coefficients. | Lower-order terms provide the reference effects needed to interpret the interaction term. | Automated term deletion or model-selection testing. | Attach after the existing formula expansion and coefficient interpretation; model comparison is L09. |
| Overlap and support | Students can inspect group-specific ranges and predictions. | A different slope is supported only over ranges and combinations actually observed. | Formal extrapolation analysis or causal generalisation. | Extend the current diagnostic/range warning. |
| Scale of interaction | Students understand differences in millimetres. | Constant differences and constant ratios are different biological claims. | Link functions or GLM interaction algebra. | Preview the later binary/count-response lesson without fitting a GLM. |

## Leakage audit

- No centred refit, three-way interaction or interaction-selection test is added.
- The GLM connection is vocabulary and interpretation only; calculations remain in L12.

## Review and validation

- Independent amendment review: passed after moving the hierarchy-principle block below the formula expansion and coefficient interpretation.
- Glossary coverage: checked for the added prose; `hierarchicky-princip-modelu` remains explicitly marked as a future glossary addition.
- Source checks: UTF-8 without BOM, no replacement characters, `git diff --check` passed.
- Render: project-native HTML and PDF render passed; all 23 PDF pages were inspected through lesson-wide contact sheets and the three new Extra pages at readable size. An orphaned closing-callout header was corrected with a print page break and the final rerender has no clipping, overlap, broken glyphs or orphaned blocks.
- Pre-existing full-artifact review notes outside this amendment: the first stage of one existing equation progression and repeated hardcoded 30 mm teaching-input prose remain candidates for a later cleanup.
