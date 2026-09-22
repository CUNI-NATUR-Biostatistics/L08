# Stage 1 - Dataset research and decision

## Metadata and Git checkpoint

- Week: L08
- Date: 2026-09-22
- Author: AI assistant
- Human reviewer: Ondřej Mottl (approved 2026-09-22)
- Branch: `lesson/l08-scope-data`, based on `main` at `dd4f544`
- Stage 0 record: `Workflow/records/2026-09-22-stage-0-scope.md`
- Decision status: **blue-form `MASS::crabs` data story approved and locked on 2026-09-22**

## Dataset needs and inspiration

L08 needs a continuous response, two interpretable predictors, and an interaction visible within the observed ranges. A continuous-by-group example is the most direct bridge from L07's parallel additive lines. Prefer about 60–200 independent observational units, manageable missingness, stable access, and a biological question that can be stated without a coefficient table. Plot observed points and predictions for each group before introducing `x1 * x2`.

The course inspiration hub (_internal/obecne/nove/biostatistics_course_inspiration_hub.md) points to [Modern Statistics with R](https://modernstatisticswithr.com/) for model-first sequence, [PH525x interactions and contrasts](https://genomicsclass.github.io/book/pages/interactions_and_contrasts.html) for contrasting additive and interaction predictions, and the [CUNY biostatistics chapter](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Combining_numerical_and_categorical_predictors.html) for a biological linear-model framing. Borrow the visual comparison and conditional interpretation, not matrix algebra, automatic model selection, or package-heavy student code.

## Broad discovery gate

Nine distinct examples from six independent source families were examined: Dryad/CHELSA, Palmer Station LTER and its data paper, PH525x, CUNY Biostatistics, base R dataset documentation, and MASS dataset documentation. Primary dataset records and teaching examples are both represented. A package's presence on this computer was not used as a selection criterion. Reuse terms are distinguished from mere availability; where the item-level terms were not established, the row remains unsuitable for redistribution.

| Source and exact example | Variables and proposed model | Unit, population or sampling story, provenance and reuse | Useful teaching pattern | Main complication and disposition |
| --- | --- | --- | --- | --- |
| [L07 prepared knotweed data](https://github.com/CUNI-NATUR-Biostatistics/L07/blob/main/data/README.md), [Dryad source](https://datadryad.org/dataset/doi%3A10.5061/dryad.qbzkh18r4), [CHELSA](https://www.chelsa-climate.org/datasets/chelsa_bioclim) | Mean leaf thickness `tloustka_listu_mm ~ teplota_rocni_C * puvod` | 128 source populations grown in the Shanghai common garden; source climate at collection sites. Dryad and CHELSA inputs are documented as CC0 in L07. | Direct continuation of L07's parallel-lines question. | Native and introduced temperature ranges overlap little, and fitted slope difference is uncertain; **shortlist**, not automatic reuse. |
| [Palmer penguin data paper](https://journal.r-project.org/articles/RJ-2022-020/), [source CSV](https://github.com/allisonhorst/palmerpenguins/blob/main/inst/extdata/penguins.csv) | `body_mass_g ~ flipper_length_mm * species` | Adult foraging penguins sampled near Palmer Station, 2007–2009; 344 birds, three species. Data documented as CC0. | Charismatic measurement story and visible group-specific lines. | Species differ in flipper range and island is strongly confounded with species; three lines complicate a first interaction. **Reject as primary**. |
| [PH525x spider example](https://genomicsclass.github.io/book/pages/interactions_and_contrasts.html) | Friction `friction ~ type * leg` (push/pull by leg pair) | Measured friction of spider attachment pads; source cites Wolff and Gorb (2013) and provides a CSV. Dataset-specific redistribution terms were not confirmed. | Excellent arrows showing a group difference that changes across legs. | Four leg pairs, two categorical predictors, unequal variance noted by authors, and technical apparatus. **Borrow visual pattern, reject data**. |
| [CUNY iris interaction](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Combining_numerical_and_categorical_predictors.html), [R data documentation](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html) | `Sepal.Length ~ Species * Petal.Length` | One iris flower per row; 150 flowers, 50 of each species, collected by Anderson; bundled with R. Original collection and item-level reuse terms need separate treatment. | Shows that ANCOVA is still a linear model. | The cited example reports a weak interaction, and iris was used earlier in this course. **Reject primary**. |
| [CUNY FEV example](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Combining_numerical_and_categorical_predictors.html) | Lung function `FEV ~ Age * Smoker` or `FEV ~ Height * Sex` | One child per record in the teaching table; source page links `fev.txt`, but the original sampling and redistribution terms were not established in this scan. | Public-health question with intuitive conditional effects. | Age, height, sex and smoking are entwined; the chapter moves into many high-order terms and automatic selection. **Reject primary**. |
| [R ToothGrowth documentation](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/ToothGrowth.html) | Odontoblast length `len ~ dose * supp` | 60 guinea pigs, one treatment combination per animal; 3 dose levels by 2 delivery methods, 10 per cell. Source is Bliss (1952) / Crampton (1947); item-level redistribution terms are not stated. | Balanced six-cell design makes conditional differences easy to see. | The dose response is substantially curved; a linear dose interaction misrepresents the high-dose convergence. **Shortlist only with dose treated categorically**. |
| [R ChickWeight documentation](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/ChickWeight.html) | Chick mass `weight ~ Time * Diet` | 578 measurements, but repeated measures on the same chicks under four diets; source is Crowder and Hand. Item-level terms not stated. | Strong growth-curve picture. | Row is a measurement, not an independent chick; longitudinal modelling belongs later. **Reject primary**. |
| [R airquality documentation](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/airquality.html) | `Ozone ~ Temp * Wind` | 153 daily measurements in New York, May–September 1973, from state and weather agencies; item-level terms not stated. | Public-life/environmental question. | Missing ozone values and sequential days raise dependence; relationship may be nonlinear. **Reject primary**. |
| [MASS crabs documentation](https://stat.ethz.ch/CRAN/web/packages/MASS/refman/MASS.html) | Rear carapace width `RW ~ CL * sex`, within blue colour form | 100 individual crabs, 50 female and 50 male, from 200 measured near Fremantle, Australia; Campbell and Mahon (1974). [MASS package license](https://cran.r-project.org/package=MASS) is GPL-2 or GPL-3; use the package directly for teaching; a copied CSV needs a separate rights notice. | One continuous and one binary predictor, broad size overlap, distinct slopes; direct visual bridge from L07. | Historical sampling details and distinct blue/orange forms need disclosure. **Selected after human approval**. |

## Finalist comparison

| Finalist | Outcome and student fit | Stepwise visual sequence and practical feasibility | Main risk | Rank |
| --- | --- | --- | --- | --- |
| Blue-form `MASS::crabs` | Biological size question; two groups; clean `lm(y ~ x * group)` interpretation in mm | Points → L07-style parallel lines → separate slopes → predicted widths at the same carapace length; 100 complete observations | Use the package directly; explain the colour-form restriction | 1, selected |
| L07 knotweed populations | Perfect narrative continuity and ecological relevance | Prepared Czech table and L07 plot can be reused; 128 complete populations | Limited temperature overlap, uncertain interaction, possible curvature | 2, useful opening counterexample or callback |
| `ToothGrowth` guinea pigs | Controlled 3-by-2 biological treatment story | Six cell means are easy to plot; 60 complete observations | Categorical dose makes this a different visual bridge; a straight-line dose model fits poorly | 3, fallback only |

## Numerical and practical probes

All estimates below were recomputed in R 4.5.1 with `Rscript --vanilla`; the calls used `lm()`, `confint()`, group ranges, Cook's distances and a quadratic comparison. These are feasibility probes, not evidence of causal effects.

### Blue-form rock crabs

- Source and access: `MASS::crabs`, 200 rows in the documented package; select the blue form (`sp == "B"`), leaving 100 crabs, 50 female and 50 male, with no missing values in `RW`, `CL`, or `sex`. Use the package directly for planning and teaching; package license is GPL-2 or GPL-3. A copied CSV requires a separate rights notice.
- Unit and sampling: one crab; historical collection near Fremantle. The dataset description does not document a probability sample. Blue and orange colour forms are separated so the first model asks one clear question.
- Model: `lm(RW ~ CL * sex)` with female reference. Female slope is 0.407 mm rear width per 1 mm carapace length; male slope is 0.282 mm/mm. Male-minus-female slope difference is -0.124 mm/mm (95% model interval -0.151 to -0.098).
- Visible comparison: at carapace length 30 mm, fitted rear widths are 12.91 mm for females and 11.15 mm for males. Female and male carapace ranges are 14.7–40.9 and 16.1–47.1 mm, so 30 mm is inside both observed ranges. The two line slopes differ visibly.
- Checks: both colour forms separately show the same direction (orange-form interaction -0.108 mm/mm); full-data model with colour form as an additive control estimates -0.117 mm/mm. A quadratic extension within blue form did not show a strong improvement in this probe (nested-model p = 0.138). Eight observations exceed a 4/n Cook's-distance screen, so the final lesson should inspect influence rather than call the line perfect.

### L07 Japanese knotweed populations

- Source and access: L07's reproducible prepared CSV uses CC0 Dryad plant data and CC0 CHELSA climate layers; 128 populations, 55 native and 73 introduced, no missing model values.
- Unit and sampling: one source population, averaged from plants grown in a common garden. The 128 source populations are not a random sample of all knotweed populations; source climate is observational.
- Model: `lm(tloustka_listu_mm ~ teplota_rocni_C * puvod)` with native reference. Native slope is +0.00387 mm leaf thickness per °C; introduced slope is approximately -0.000035 mm/°C. Introduced-minus-native slope difference is -0.00391 mm/°C (95% model interval -0.00880 to +0.00099).
- Visual and structure check: native-source annual temperature spans 12.15–19.95 °C and introduced-source temperature 5.95–16.35 °C, leaving only 12.15–16.35 °C of overlap. A quadratic extension gives a borderline nested-model p = 0.050 in this probe; nine rows exceed a 4/n Cook's-distance screen. These limitations could dominate the first interaction lesson.

### Guinea-pig `ToothGrowth`

- Source and access: R's documented `ToothGrowth`, 60 animals, no missing values; 10 animals in each dose-by-supplement cell. The original data source is cited, while item-level redistribution permission is not specified by the R help page.
- Unit and sampling: one guinea pig receiving one dose and delivery method; assignment method is not established in the help page.
- Numeric-dose model: `lm(len ~ dose * supp)` estimates an OJ-minus-VC slope difference of -3.90 length units per mg/day (95% model interval -7.29 to -0.52). Mean lengths at doses 0.5, 1 and 2 mg/day are VC: 7.98, 16.77, 26.14 and OJ: 13.23, 22.70, 26.06.
- Structure check: a quadratic-dose extension strongly improves the straight-line interaction model (nested-model p = 0.00067). If used, dose should be a three-level factor and predictions interpreted as six cell means, not as two straight biological dose-response lines. Two rows exceed the 4/n Cook's-distance screen.

### Additional checked rejection: Palmer penguins

- Of 344 birds, 342 have response, flipper length and species present. Species counts are Adélie 151, Chinstrap 68 and Gentoo 123. Flipper ranges are 172–210, 178–212 and 203–231 mm respectively. An Adélie-reference interaction model estimates a Gentoo slope difference of +21.79 g/mm (95% model interval +8.14 to +35.44), while Chinstrap differs by only +1.74 g/mm (interval -13.71 to +17.19). Gentoo birds are all from Biscoe Island and Chinstrap birds all from Dream Island in this table, so the attractive three-line plot hides a strong species-island coupling.

## Selected dataset and minimal story

- Selected source: blue colour form of `MASS::crabs`, Campbell and Mahon (1974), with the original citation and package provenance kept visible.
- Biological question: **Does rear carapace width increase with carapace length at the same rate in female and male rock crabs?**
- Response: rear carapace width (`RW`, mm).
- Predictors: carapace length (`CL`, mm), sex, and their interaction.
- First visual: show observed points and the L07 additive assumption of parallel lines, then fitted female and male lines over their observed ranges; ask students to compare predicted widths at 30 mm.
- Bridge to L09: the biological question can motivate a small, predefined comparison of additive and interaction models, but R², adjusted R² and AIC belong to L09.
- Why preferred: clear observed-range comparison and substantial slope difference with 100 independent crab units; less overlap/shape trouble than knotweed or ToothGrowth. Unlike L07's dataset, it requires a new animal and anatomy introduction, so use the L07 parallel-lines figure only as a retrieval bridge.
- Remaining source decision: use MASS::crabs through the package with the Campbell and Mahon (1974) citation; any copied CSV needs a separate rights notice.

## Decision checklist

- [x] At least 4 independent source families and 8 distinct examples reviewed.
- [x] Established teaching examples and primary dataset documentation included.
- [x] Two or three finalists compared and numerically probed; rejection reasons recorded.
- [x] Observational units, group structure, ranges, missingness, and influence screened.
- [x] Reuse path recorded: access via MASS::crabs, with no copied CSV in the planning branch.
- [x] Human author approved the blue-form crab data story on 2026-09-22.
- [x] Dataset locked for implementation.
- [x] Stage 0–1 working-tree scope reviewed: only the two records and stage log changed; no PR created.
