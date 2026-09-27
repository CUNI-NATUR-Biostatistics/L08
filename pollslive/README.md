# PollsLive retrieval-quiz adapter

L08 is opted into PollsLive with an approved three-question retrieval quiz for L07. The tracked `config.json`, `quiz.json`, evidence assets, and reproducible sources define the quiz used by the presentation. Generated QMD, QR codes, receipts, poll identity, response data, and credentials remain ignored and private.

## Approval and later changes

Do not replace the approved `quiz.json` or move the generated presentation include unless both the revised retrieval-quiz integration map and the three exact questions have explicit human approval in the lesson workflow record. Questions should ask students to interpret familiar evidence from the preceding lesson, such as a figure, table, or R output.

## Opt-in procedure for another lesson

1. Copy `quiz.template.json` to `quiz.json` and replace every technical example with the approved lesson identity, date, questions, options, correct answers, explanations, evidence descriptions, alt text, and provenance.
2. Copy `config.template.json` to `config.json`. Keep the reviewed 40-character `_internal` client revision pinned unless a later reviewed revision is intentionally adopted.
3. Add every referenced image below `pollslive/assets/` and add a deterministic `R/render_pollslive_assets.R` that reproduces the evidence or verifies an intentionally byte-identical source asset.
4. Run `node pollslive/validate.mjs`, then run a credential-free offline render with `$env:POLLSLIVE_RENDER_MODE = "offline"` and `Rscript R/render_presentation.R`.
5. Add `{{< include ../pollslive/generated/active.qmd >}}` to `Presentation/presentation.qmd` only at the approved retrieval-block position.
6. Add the lesson repository to the selected repositories of the read-only lesson-reader GitHub App.
7. Commit and push `config.json`, `quiz.json`, all evidence assets, and their reproducible sources before the first synchronized render.
8. In a fresh terminal authenticated with `gh auth login`, set `$env:POLLSLIVE_RENDER_MODE = "sync"` and run `Rscript R/render_presentation.R`. The local renderer dispatches the trusted `_internal` workflow, verifies its receipt, and produces the HTML and static PDF locally.

The lesson workflow in `.github/workflows/pollslive.yml` validates inputs without credentials. PollsLive synchronization, registry maintenance, and scheduled activation remain in `_internal`; the API key never enters a lesson repository.

## Generated and private data

Do not edit or commit generated QMD, QR codes, receipts, metadata, caches, response data, poll IDs, PINs, host tokens, management URLs, or credentials. Poll identity and public URLs live in the protected `_internal` registry and in ignored local render output.

`quiz.template.json` is a technical example only. Its wording is not approved teaching content and it must never be synchronized as a real poll.

The static HTML/PDF solution text is copied from each question's `explanation` field. The generator does not invent a justification from the options or image; if no explanation is desired beyond the correct option, keep this field brief but explicit.
