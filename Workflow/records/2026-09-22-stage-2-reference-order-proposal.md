# L08 learning-materials story map: data, model, then reference lengths

- Date: 2026-09-22
- Author: AI assistant
- Status: complete; explicitly approved for drafting
- Requested by: Ondřej Mottl, 2026-09-22
- Approved by: Ondřej Mottl, 2026-09-22
- Decision: approved the completed revised story map and knowledge-state ledger for drafting.
- Trigger: move the choice of 30 and 35 mm after data inspection, raw-data plot and interaction fit; replace opaque `by()` output with split data frames and `summary()` on each.
- Prior approval: the 18-block map in `2026-09-22-stage-2-categorical-expansion-proposal.md` was approved on 2026-09-22. This proposal changes the internal order of blocks 5 and 9-11; all other blocks keep their approved roles.
- Technical sequence: fit the interaction first on original millimetres, choose two comparison lengths from the observed overlap, then centre at 30 mm to interpret coefficients. The centred fit is the same model relationship expressed with a different zero; predictions and residuals must agree numerically. The raw-scale 0-mm intercept is not given a biological interpretation.
- Boundary: approval preceded full student-facing prose and code for the revised order. The split-data-frame inspection had already been made within the existing approved block 5.

## Complete revised story map

`Internal role` and `Speaker note` are backstage planning text. `Student-facing heading` is a proposed heading, not drafted prose.

| Order | Internal role | Student-facing heading | Speaker note |
| --- | --- | --- | --- |
| 1 | Biological opening question | Liší se vztah délky a zadní šířky krunýře mezi samicemi a samci? | Open with two equally long crabs. Keep the question about shape, not overall size or cause. |
| 2 | Retrieval from L07 | Kdy předpovídají dvě přímky stejný sklon? | Recall parallel lines and a constant group difference before the outcomes. |
| 3 | Learning outcomes | Co se v této lekci naučíte | Revise outcomes after approval to cover conditional interpretation of both interaction types and four-group prediction. |
| 4 | Data source and observation unit | Jeden řádek tabulky představuje jednoho kraba | Source `MASS::crabs`; first analysis uses blue form, rear width, length and sex. Foreshadow only that both forms exist. |
| 5 | Data inspection | Které délky a šířky jsou v datech zastoupené? | Split the data into female and male data frames; show `summary()` for each, missingness and shared observed range. Do not choose comparison lengths yet. |
| 6 | Observe continuous relation | Jak souvisí délka a zadní šířka krunýře? | Points by sex; ask what shape difference might change with length. |
| 7 | Familiar additive baseline | Rovnoběžné přímky předpokládají společný sklon | Fit and draw common-slope model; show its constant difference as an assumption. |
| 8 | Motivate continuous-by-categorical interaction | Mění se rozdíl mezi samicemi a samci s délkou krunýře? | Contrast plausible nonparallel lines with baseline before naming interaction. |
| 9 | Fit interaction | Model s interakcí dovoluje samicím a samcům různé sklony | Fit `lm()` with original carapace length and the interaction; show its two lines over raw observations. Explain `*` and the question it answers, without choosing reference lengths or teaching the 0-mm coefficients. |
| 10 | Shared-length predictions | Jakou zadní šířku model odhaduje při dvou délkách? | After inspecting the observed overlap and fitted lines, choose 30 and 35 mm as illustrative shared lengths, not to maximise a result. Compare same-length predictions and show the changing contrast before unpacking terms. |
| 11 | Re-express and read all four terms | Co znamenají koeficienty při referenční délce 30 mm? | Now centre length at 30 mm and refit the same interaction relationship; show `summary()` and explain why fitted lines and predictions stay the same. Explain intercept, female slope, male-minus-female contrast at 30 mm and slope contrast. Place unfamiliar summary columns and `emmeans` in optional Extras. |
| 12 | Check first fit | Jak dobře přímky popisují naměřené kraby? | Check residual pattern, influence and observational boundaries without ranking models. |
| 13 | Second biological question and data extension | Liší se rozdíl v délce krunýře mezi pohlavími u obou barevných forem? | Widen to blue and orange forms of the same crab source. Clarify new outcome (length), two group labels, one crab per row, 50 per cell and missingness. Describe forms accurately; avoid treating labels as causal treatments. |
| 14 | Four observed groups | Jaké délky krunýře vidíme ve čtyřech skupinách? | Show raw points or compact distribution plot plus a four-cell count/mean table. Students compare male-minus-female differences within each form before a model. Distinguish means from individual measurements. |
| 15 | Fit two-categorical interaction | Mění se rozdíl mezi pohlavími podle barevné formy? | Draw a two-form contrast plot: group means linked within form, with sex on x and form as colour or separate facets. Then fit `lm(delka_krunyre_mm ~ forma * pohlavi)`; name interaction as a difference of differences. |
| 16 | Decode model and predictions | Co znamenají čtyři koeficienty modelu se dvěma skupinovými znaky? | Use explicit reference levels (blue, female), explain four `summary()` estimates in mm, and build four predicted means by adding appropriate terms. Show the interaction coefficient equals the change in male-minus-female contrast from blue to orange. Avoid treating a coefficient as a universal effect. |
| 17 | Check and compare meanings | Co se z obou příkladů o interakci naučíme? | Check within-cell spread/residuals, then place the two interaction meanings side by side: change in slope with length versus change in sex contrast with form. Both concern conditional comparisons. No causal or population-wide extrapolation. |
| 18 | Synthesis and L09 bridge | Kdy potřebujeme při výkladu modelu uvést další prediktor? | Summarise evidence and limitations from both crab questions in original units; bridge to choosing among sensible models in L09 without teaching R², AIC or formal selection here. |

## Knowledge-state ledger

Each row describes the state before and after its matching block.

| Block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
| --- | --- | --- | --- | --- |
| 1 | Numerical traits and group labels can differ. | A biological length-width question conditional on sex. | Any observed difference or cause. | Two equally long crabs/measurement sketch. |
| 2 | L07 additive `lm()` and parallel lines. | Parallel lines encode a constant group difference. | That crab slopes are equal. | Retrieval sketch and prompt. |
| 3 | Opening question and recalled model. | Observable goals for both interaction examples. | The results or full formula. | Revised short outcome list. |
| 4 | Rows and measured variables in general. | One crab per row; source, blue subset and mm units. | Representativeness or data pattern. | Source note and labelled rows. |
| 5 | Variables and unit. | Counts, missingness, group summaries and shared observed range. | Any chosen reference length or slope difference. | Visible split data frames and two `summary()` outputs. |
| 6 | Scatterplot reading. | Individual length-width pattern by sex. | Model-confirmed interaction. | Point plot and noticing prompt. |
| 7 | Additive model from L07. | Constant difference is imposed by common slope. | Model ranking. | Same-data fitted parallel lines. |
| 8 | Observed points and additive fit. | Changing sex difference with length; interaction name. | Product-term meaning. | Common-axis visual comparison. |
| 9 | Nonparallel-line idea and simple `lm()`. | `*` fits group-specific slopes; two model lines can be drawn on the observed scale. | A reference length or interpretation of the 0-mm intercept. | Visible model code and fitted lines over observations. |
| 10 | Fitted lines and shared observed range. | Choose 30 and 35 mm for illustration; obtain same-length predictions and a changing contrast. | Prediction as individual observation or a reference-dependent coefficient. | Stated selection rationale, model-derived table and marked graph. |
| 11 | Concrete predictions and a chosen 30-mm reference. | Centring changes coefficient meanings while preserving fitted values; `summary()` now shows four interpretable conditional terms, two lines and slope-contrast uncertainty. | Independent global effects. | Centred model code, prediction-equivalence check and coefficient-to-prediction mapping. |
| 12 | Residual concept and model plot. | Fit limitations for first example. | Population or causal proof. | Residual view and observed range. |
| 13 | One-source crab analysis; two named categories are familiar. | Both colour forms, new CL response, four cells and sampling boundary. | Any form-by-sex length pattern. | Row/count/missingness check of full data. |
| 14 | Four groups and numerical outcome. | Four empirical means, spread and within-form sex contrasts. | Interaction coefficient or a test result. | Individual-data plot and four-cell table. |
| 15 | Two contrasts from block 14; first example's interaction idea. | The sex contrast can depend on colour form; `forma * pohlavi` encodes this. | That the fitted differences are causal or equal for each individual. | Contrast plot followed by visible model code. |
| 16 | Fitted four-cell model, reference levels, observed contrasts. | All four conditional coefficients and four model predictions; interaction as difference of differences. | Main sex/form coefficients as unconditional universal differences. | `summary()` mapped to four-cell prediction table and arithmetic. |
| 17 | Both model interpretations and prior residual reading. | Distinguish slope difference from difference of group contrasts; check within-cell variation and scope. | Formal model selection or causal explanation. | Residual/within-cell view and a compact comparison. |
| 18 | Two qualified analyses. | General rule: name the other predictor when interpreting an interaction; L09 question. | R², AIC or best-model claim. | Evidence recap in mm and next-lesson question. |

## Pre-approval audit

- Heading strip: biological question, L07 retrieval and outcomes, data inspection and scatterplot, familiar additive fit, interaction on original length scale, shared-length predictions, then centred coefficient interpretation. The second crab example and synthesis retain their approved order.
- First-use sequence: students see each group's range and individual measurements before any model. They see the interaction's fitted lines before 30 and 35 mm are selected. Predictions at those lengths motivate the 30-mm centring and the four conditional coefficient interpretations.
- Numerical invariant: `predict()` from raw and centred fits must agree for the comparison table and observed data; changing the zero must not be described as improving model fit. Neither chosen length may be outside a group's observed range.
- Scope: this changes teaching order and reference parameterisation within the first example. The two-categorical example, learning outcomes and observational limits remain as in the approved 18-block map.
- Approval outcome: Ondřej Mottl explicitly approved this complete revised map and ledger on 2026-09-22 before the sequence rewrite.
