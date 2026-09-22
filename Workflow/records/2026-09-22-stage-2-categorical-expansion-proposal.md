# L08 revised learning-materials story map: two kinds of interaction

- Date: 2026-09-22
- Author: AI assistant
- Status: complete; explicitly approved for drafting
- Approved by: Ondřej Mottl, 2026-09-22
- Decision: approved as proposed; communicate with the author in English while keeping the lesson in Czech.
- Trigger: Ondřej Mottl requested `summary()` and a full explanation of all four continuous-by-categorical coefficients, plus an example with two categorical predictors.
- Existing approval: the original 13-block story map was approved on 2026-09-22. This approved revision extends that arc to 18 blocks and now governs the current `skripta.qmd`.
- Dataset decision proposed for approval: keep the first blue-form rear-width example; then extend to all 200 observations in `MASS::crabs`, using colour form (blue/orange) and sex as categorical predictors of carapace length (mm). This uses the same source but changes the response and expands its subset for the second example. Each form-by-sex cell has 50 crabs. The observed sex contrast in mean carapace length is +3.912 mm (male minus female) in blue crabs and -0.930 mm in orange crabs. These descriptive values were checked directly from the package data; they are not a causal claim.
- Boundary: the revised map and ledger were approved before full student-facing prose for the new blocks was drafted.

## Complete revised story map

`Internal role` and `Speaker note` are backstage planning text. `Student-facing heading` is a proposed heading, not drafted prose.

| Order | Internal role | Student-facing heading | Speaker note |
| --- | --- | --- | --- |
| 1 | Biological opening question | Liší se vztah délky a zadní šířky krunýře mezi samicemi a samci? | Open with two equally long crabs. Keep the question about shape, not overall size or cause. |
| 2 | Retrieval from L07 | Kdy předpovídají dvě přímky stejný sklon? | Recall parallel lines and a constant group difference before the outcomes. |
| 3 | Learning outcomes | Co se v této lekci naučíte | Revise outcomes after approval to cover conditional interpretation of both interaction types and four-group prediction. |
| 4 | Data source and observation unit | Jeden řádek tabulky představuje jednoho kraba | Source `MASS::crabs`; first analysis uses blue form, rear width, length and sex. Foreshadow only that both forms exist. |
| 5 | Data inspection | Které délky a šířky jsou v datech zastoupené? | Show types, missingness and shared observed range; set 30 mm reference. |
| 6 | Observe continuous relation | Jak souvisí délka a zadní šířka krunýře? | Points by sex; ask what shape difference might change with length. |
| 7 | Familiar additive baseline | Rovnoběžné přímky předpokládají společný sklon | Fit and draw common-slope model; show its constant difference as an assumption. |
| 8 | Motivate continuous-by-categorical interaction | Mění se rozdíl mezi samicemi a samci s délkou krunýře? | Contrast plausible nonparallel lines with baseline before naming interaction. |
| 9 | Fit interaction | Model s interakcí dovoluje samicím a samcům různé sklony | Fit centred `lm()`; show `summary()` and point students to `Coefficients`/`Estimate`. Put unfamiliar output columns in optional Extra. |
| 10 | Shared-length predictions | Jakou zadní šířku model odhaduje při délce 30 mm? | Compare same-length predictions at reference and another observed length before unpacking terms. |
| 11 | Read all four terms | Co znamenají koeficienty při referenční délce 30 mm? | Explain intercept, female slope, male-minus-female contrast at 30 mm, and male-minus-female slope contrast. Reconstruct both lines and address the global-sex-effect misconception. |
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
| 5 | Variables and unit. | Counts, missingness, ranges and 30 mm shared reference. | Slope difference. | Visible data inspection. |
| 6 | Scatterplot reading. | Individual length-width pattern by sex. | Model-confirmed interaction. | Point plot and noticing prompt. |
| 7 | Additive model from L07. | Constant difference is imposed by common slope. | Model ranking. | Same-data fitted parallel lines. |
| 8 | Observed points and additive fit. | Changing sex difference with length; interaction name. | Product-term meaning. | Common-axis visual comparison. |
| 9 | Nonparallel-line idea and simple `lm()`. | Centred predictor, `*`, model output's coefficient estimates. | A sex coefficient valid at all lengths. | Visible model code, `summary()` and plot. |
| 10 | Fitted model and reference length. | Same-length predicted widths and changing contrast. | Prediction as individual observation. | Model-derived table and marked graph. |
| 11 | Concrete predictions, baseline group. | Four conditional terms, two lines, uncertainty in slope contrast. | Independent global effects. | Map output rows to prediction and slope. |
| 12 | Residual concept and model plot. | Fit limitations for first example. | Population or causal proof. | Residual view and observed range. |
| 13 | One-source crab analysis; two named categories are familiar. | Both colour forms, new CL response, four cells and sampling boundary. | Any form-by-sex length pattern. | Row/count/missingness check of full data. |
| 14 | Four groups and numerical outcome. | Four empirical means, spread and within-form sex contrasts. | Interaction coefficient or a test result. | Individual-data plot and four-cell table. |
| 15 | Two contrasts from block 14; first example's interaction idea. | The sex contrast can depend on colour form; `forma * pohlavi` encodes this. | That the fitted differences are causal or equal for each individual. | Contrast plot followed by visible model code. |
| 16 | Fitted four-cell model, reference levels, observed contrasts. | All four conditional coefficients and four model predictions; interaction as difference of differences. | Main sex/form coefficients as unconditional universal differences. | `summary()` mapped to four-cell prediction table and arithmetic. |
| 17 | Both model interpretations and prior residual reading. | Distinguish slope difference from difference of group contrasts; check within-cell variation and scope. | Formal model selection or causal explanation. | Residual/within-cell view and a compact comparison. |
| 18 | Two qualified analyses. | General rule: name the other predictor when interpreting an interaction; L09 question. | R², AIC or best-model claim. | Evidence recap in mm and next-lesson question. |

## Pre-approval audit

- Heading strip: question → L07 recall → goals → first data and fit → conditional coefficients → second question → four raw groups → categorical interaction → synthesis. The callback remains before learning outcomes.
- First-use sequence: the second question introduces the new outcome and four cells before the two-category model; observed within-form comparisons precede its interaction coefficient and difference-of-differences arithmetic.
- Scope: one biological source, two distinct response questions. The second example broadens the subset and should be marked as an explicit dataset-scope revision. No L09 model-ranking metric, causal claim or unsourced population claim is needed.
- Approval outcome: Ondřej explicitly approved this complete revised story map and ledger, including the full-dataset second example, on 2026-09-22.
