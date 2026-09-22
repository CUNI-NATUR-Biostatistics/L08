# L08 learning-materials story map: data, model, then comparison lengths

- Date: 2026-09-22
- Author: AI assistant
- Status: complete; explicitly approved for drafting
- Requested by: Ondřej Mottl, 2026-09-22
- Approved by: Ondřej Mottl, 2026-09-22
- Decision: approved the completed revised story map and knowledge-state ledger for drafting.
- Post-approval human-directed revisions: Ondřej first requested the original-length `summary()` before the centred `summary()` in block 11. He then removed the confusing 30-mm shift. His latest review found that two prediction lengths burden the flow while the figure shows only 30 mm. The current map keeps one original-length model, one worked 30-mm comparison, and reads changing contrast from the two slopes. The 18-block sequence is unchanged.
- Trigger: inspect data and fit the interaction before choosing one shared comparison length; replace opaque `by()` output with split data frames and `summary()` on each.
- Prior approval: the 18-block map in `2026-09-22-stage-2-categorical-expansion-proposal.md` was approved on 2026-09-22. This proposal changes the internal order of blocks 5 and 9-11; all other blocks keep their approved roles.
- Technical sequence: fit the interaction once on original millimetres, then choose 30 mm from the observed overlap to compare equally long crabs. Show `summary()` of that single model. Its intercept and sex coefficient refer to 0 mm, outside the observed range; interpret them as conditional model terms, not biological descriptions of observed crabs. Explain changing contrast through the different slopes, without a second arbitrary prediction length.
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
| 9 | Fit interaction | Model s interakcí dovoluje samicím a samcům různé sklony | Fit `lm()` with original carapace length and the interaction; show its two lines over raw observations. State only that `*` allows different slopes here; defer expansion of the formula to the coefficient-reading block. |
| 10 | Shared-length predictions | Co model předpovídá pro stejně dlouhou samici a samce? | After inspecting the observed overlap and fitted lines, choose 30 mm as one readable position on the x-axis. Predict both sexes at the same length and mark those two points on the fitted lines. Present the male-minus-female contrast as the main highlighted result. The changing separation of the lines motivates the later slope-difference explanation. |
| 11 | Read all four terms in one model | Co znamenají koeficienty modelu s interakcí? | Begin from the familiar additive formula, add `delka_krunyre_mm:pohlavi`, and only then show that `*` is its shorthand. Show `summary()` for the original-length fit and explain all four terms. Before the worked 30-mm arithmetic, call back to the already highlighted male-minus-female result and show that the coefficients reproduce it. Keep unfamiliar summary columns and `emmeans` in optional Extras. Explain 0 mm once as an algebraic anchor outside the observations. |
| 12 | Check first fit | Jak dobře přímky popisují naměřené kraby? | Check residual pattern, influence and observational boundaries without ranking models. |
| 13 | Second biological question and data extension | Liší se rozdíl v délce krunýře mezi pohlavími u obou barevných forem? | Widen to blue and orange forms of the same crab source. Clarify new outcome (length), two group labels, one crab per row, 50 per cell and missingness. Describe forms accurately; avoid treating labels as causal treatments. |
| 14 | Four observed groups | Jaké délky krunýře vidíme ve čtyřech skupinách? | Show one raw-point figure without summary marks, then a four-cell mean table. Students compare male-minus-female differences within each form before a model. Distinguish means from individual measurements. |
| 15 | Fit two-categorical interaction | Jak model zachytí změnu rozdílu mezi pohlavími podle formy? | Reuse the exact raw-point figure from block 14 and add only the four group means and within-form connecting lines. Then fit `lm(delka_krunyre_mm ~ forma * pohlavi)`; name interaction as a difference of differences. |
| 16 | Decode model and predictions | Co znamenají čtyři koeficienty modelu se dvěma skupinovými znaky? | Use explicit reference levels (blue, female), explain four `summary()` estimates in mm, and build four predicted means by adding appropriate terms. Show the interaction coefficient equals the change in male-minus-female contrast from blue to orange. Avoid treating a coefficient as a universal effect. |
| 17 | Check second fit | Co o jednotlivých krabech čtyři průměry neříkají? | Check within-cell spread/residuals and the limits of four group means. Leave comparison of the two interaction meanings to the final synthesis. No causal or population-wide extrapolation. |
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
| 9 | Nonparallel-line idea and simple `lm()`. | In this fitted model, `*` permits group-specific slopes; two model lines can be drawn on the observed scale. | A reference length or interpretation of the 0-mm intercept. | Visible model code and fitted lines over observations. |
| 10 | Fitted lines and shared observed range. | Choose 30 mm for an illustrative same-length comparison and obtain two predictions; identify their male-minus-female contrast as the main result. | Prediction as individual observation or a coefficient valid at every length. | One model-derived two-row table, two marked points, and a highlighted contrast. |
| 11 | Concrete predictions at one observed-range length and the familiar additive formula. | Adding the interaction term to `delka_krunyre_mm + pohlavi` gives the expanded formula, for which `*` is shorthand. The original-scale `summary()` gives four conditional terms. A worked 30-mm calculation explicitly reproduces the contrast already highlighted in block 10; the interaction term describes how it changes with length. | Independent global effects or a sex coefficient valid at every length. | One visible `summary()`, four coefficient interpretations and a worked 30-mm prediction. |
| 12 | Residual concept and model plot. | Fit limitations for first example. | Population or causal proof. | Residual view and observed range. |
| 13 | One-source crab analysis; two named categories are familiar. | Both colour forms, new CL response, four cells and sampling boundary. | Any form-by-sex length pattern. | Row/count/missingness check of full data. |
| 14 | Four groups and numerical outcome. | Individual observations, four empirical means, spread and within-form sex contrasts. | Interaction coefficient or a test result. | A raw-point plot without mean markers, followed by a four-cell table. |
| 15 | Raw-point figure and two contrasts from block 14; first example's interaction idea. | Adding means and within-form lines to the same raw-data figure makes the changing sex contrast visible; `forma * pohlavi` encodes it. | That the fitted differences are causal or equal for each individual. | The same raw plot with only means and connectors added, followed by visible model code. |
| 16 | Fitted four-cell model, reference levels, observed contrasts. | All four conditional coefficients and four model predictions; interaction as difference of differences. | Main sex/form coefficients as unconditional universal differences. | `summary()` mapped to four-cell prediction table and arithmetic. |
| 17 | Four group means and prior residual reading. | See the within-cell variation that four means cannot capture and limit the claim to observed data. | Formal model selection or causal explanation. | Residual/within-cell view with all observations. |
| 18 | Two qualified analyses. | Distinguish slope difference from change of group contrasts; name the other predictor when interpreting an interaction; L09 question. | R², AIC or best-model claim. | Evidence recap in mm and next-lesson question. |

## Pre-approval audit

- Heading strip: biological question, L07 retrieval and outcomes, data inspection and scatterplot, familiar additive fit, interaction on original length scale, one shared-length comparison, then interpretation of the same model's coefficients. The second crab example shows four observed groups before asking how a model captures their contrast; its residual check precedes the final synthesis.
- First-use sequence: students see each group's range and individual measurements before any model. They see the interaction's fitted lines before 30 mm is selected. The single same-length comparison motivates an explanation of the four coefficients of the original model, including the limited meaning of terms defined at 0 mm.
- Numerical invariant: the single original-scale model must reproduce both 30-mm predictions and their contrast. The chosen length must be inside the observed range of both groups.
- Scope: this simplifies the first example to one model and one 30-mm worked comparison, with male-minus-female direction throughout. The two-categorical example and observational limits remain as in the approved 18-block map.
- Approval outcome: Ondřej Mottl explicitly approved this complete revised map and ledger on 2026-09-22 before the sequence rewrite.
