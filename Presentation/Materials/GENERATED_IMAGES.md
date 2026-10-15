# Generated illustration provenance

## Scope

- Lesson: L08 — Interakce prediktorů
- Initial generation date: 2026-09-23; selected series refresh and title generation: 2026-10-15.
- Generation mode: OpenAI built-in image generation; new bitmap assets followed by targeted edits.
- Shared subjects and style: friendly blue rock crabs, a coastal setting, rich warm natural-history watercolour/gouache, genuine transparent silhouettes, and no generated instructional text. All three in-deck illustrations were redrawn to match the author-approved portrait title T2 on 2026-10-15.
- Student-facing metadata: each occurrence has Czech alternative text, the standard visible disclosure „Ilustrace vytvořená pomocí AI.“ (`.text-size-tiny .text-right`) and a speaker note in `Presentation/presentation.qmd` (updated 2026-10-15).
- Series style and author decision: the original paper-cut series and its temporary retention (D3 in `Workflow/records/2026-10-15-polish-review.md`) are historical. On 2026-10-15 the author requested an L10-inspired title, approved the resulting portrait T2 ("This is so much better"), and explicitly requested the other images in the same style. The selected in-deck images now follow T2's natural-history watercolour/gouache, richly painted blue shells, dimensional rocks and coastal materials, and genuine transparency. The title itself is unchanged by this series redraw.
- Teaching boundary: the illustrations are context and memory devices. Statistical evidence remains attached to observed data and model-derived figures.
- Brand treatment: natural blue and sand belong only to the depicted organism and setting. Exact variable labels remain graphite; competing models use indigo and amethyst; semantic orange is reserved for the closing interpretation question. Since 2026-10-15 (author decision) blue and orange identify the two crab colour forms, and sex groups use bluish green `#009E73` (samice) and reddish purple `#CC79A7` (samec). This is the documented categorical-palette override allowed by `_brand/brand_guidelines.qmd`. The four-group image uses these colours on large matte painted wooden medallions held by the crabs; the model and title images use coloured trails. The painterly measurement scene and selected title have no badges. The four-group symbols repeat the distinction without relying on colour alone.

## `krabi_mereni.png`

- Teaching role: make carapace length and rear carapace width concrete before students inspect the scatterplot.
- SHA-256 (selected painterly redraw, 2026-10-15): `F1F582BCF8566B13E69BDC6A5D960A7265BD6E90479D06C791D9FA113922BBC5`
- Original SHA-256: `6A84F1C521A11B073A98CA65073526901CD6CFEBB29FA5E62164B33B9F905CC4`
- Selected output: four blue crabs at a painterly coastal measuring station; two crab assistants operate the central caliper. A dorsal view aligns the central crab's head-to-rear direction with the caliper, while the separate right-hand crab has a transverse tool. No badges or human hands. Two targeted edits corrected the central measurement orientation and an extra claw in an intermediate draft.
- Earlier refresh decision 2026-10-15: the author rejected the generated small-badge variant and initially retained the original artwork. The later request to match title T2 supersedes that temporary retention. Earlier prompts below are historical.

### Initial generation prompt

```text
Use case: scientific-educational
Asset type: 16:9 lecture-slide illustration for a university biostatistics course
Primary request: Create a humorous but scientifically grounded scene that introduces measuring crab morphology. Show several stylized blue rock crabs at a small seaside field-research measurement station. One crab is being measured with a large plain caliper along the carapace length while another plain measuring tool suggests rear carapace width; the crabs look mildly curious and cooperative. The image is a memory and context device, not analytical evidence.
Scene/backdrop: simple coastal field table with a few rocks and a subdued sea horizon; generous clean negative space around the subjects
Subject: recognizable shore crabs with blue-toned carapaces and visible body variation
Style/medium: original flat editorial paper-cut illustration, crisp shapes, gentle texture, playful academic tone
Composition/framing: wide landscape composition, main crab and measuring tools centered, uncluttered, readable when projected
Lighting/mood: bright, friendly, lightly comic
Color palette: natural muted blues, sand, off-white and graphite; restrained accents so course purple and orange overlays remain available
Constraints: no text, no letters, no numbers, no formulas, no graph axes, no logos, no watermark; measurement tools must be plain and physically plausible; do not imply exact quantitative results or sex differences
Avoid: photorealism, cartoon speech bubbles, lab coats with writing, anthropomorphic human hands, decorative statistics, crowded background
```

### Targeted edit prompt

```text
Use case: precise-object-edit
Asset type: 16:9 university lecture-slide illustration
Input image: the immediately previous generated crab measurement image is the edit target
Primary request: Preserve the coastal crab measurement scene and the recognisable blue crabs, but remove both human hands completely. Have two smaller crab assistants hold or operate the plain calipers in a playful, physically plausible way. Simplify the rendering into a clearly flat editorial paper-cut illustration with crisp layered shapes and gentle paper texture.
Composition/framing: keep the main measured crab centered, keep the second width measurement visible on the right, preserve generous uncluttered space and slide readability
Constraints: change the human-hand operation and visual medium only; no human hands or arms; no text, letters, numbers, formulas, graph axes, logos, or watermark; do not imply quantitative results or sex differences
Avoid: photorealism, speech bubbles, written markings, crowded scenery
```

The initial variant contained human hands and was rejected before repository use.

## `krabi_modely.png`

- Teaching role: frame the closing choice between an additive model with a constant group separation and an interaction model with changing separation.
- SHA-256 (selected painterly redraw, 2026-10-15): `97843DDFD59F075C358E906611D8BA1154049ED276BAAFE6B074156E69E48F1E`
- Superseded paper-cut colour refresh SHA-256: `0CAD5710684DC4A9DF5603CCBDC05BA0F9E263E6575532734A9873736F2BA9E2`
- Original SHA-256 (2026-09-23): `C620FB23AD14001EC7B1004C704734C507E917F4C15FE98806C77BD2095B9ACE`
- Style reference for the selected redraw: approved `krabi_titulni_ilustrace.png` T2. The previous model-choice image supplied the teaching metaphor only.
- Selected output: two painterly blue crabs compare two independent trail pairs in a sandy coastal clearing. The left pair is approximately parallel; the right pair opens toward the background. Each pair has one green and one pink-purple trail; neither candidate is marked correct. Four trails total, separated by rocks, with no road-like fork or labels.
- Earlier colour refresh 2026-10-15: the paper-cut original received coloured grooves; that version is superseded by the painterly redraw recorded at the end of this file.

### Initial generation prompt

```text
Use case: scientific-educational
Asset type: 16:9 closing lecture-slide illustration
Input image: use the immediately previous crab measurement illustration only as a style and character reference; create a new scene
Primary request: Show one thoughtful blue rock crab at a seaside fork choosing between two model paths. On the left, two simple tracks remain parallel all the way. On the right, two simple tracks begin near each other and clearly diverge. A second small crab peers at the choice with comic curiosity. This is a memorable metaphor for choosing an additive model with parallel relationships versus an interaction model with changing separation.
Scene/backdrop: uncluttered sandy shoreline with a minimal horizon and a simple fork in the foreground
Subject: the same friendly blue crab character language as the reference
Style/medium: coherent original flat editorial paper-cut illustration with crisp layered shapes and gentle paper texture
Composition/framing: wide landscape, crab and fork on the left-to-center, the parallel and diverging tracks clearly visible, generous negative space for exact Quarto formula labels beside the image
Lighting/mood: bright, playful, thoughtful
Color palette: muted blue, sand, off-white, graphite; restrained natural accents
Constraints: no text, letters, numbers, formulas, graph axes, signs with writing, logos, or watermark; exactly two candidate path systems, one parallel and one diverging; do not present either path as automatically correct
Avoid: photorealism, human hands, speech bubbles, decorative statistics, visually obvious winner, crowded scene
```

### Targeted edit prompt

```text
Use case: precise-object-edit
Asset type: 16:9 closing lecture-slide illustration
Input image: the immediately previous seaside crab crossroads image is the edit target
Primary request: Correct only the path metaphor. Keep the same crabs, beach, paper-cut style, framing, and mood. Replace the road-like fork with two clearly separated candidate diagrams drawn as simple paired trails in the sand: on the left, two thin trails stay parallel with constant separation from foreground to background; on the right, two thin trails start close together in the foreground and steadily spread farther apart toward the background. The paired trails must not look like the two edges of a single road. The thoughtful crab is comparing the two candidate pairs.
Constraints: exactly four thin trails total, organized as two candidate pairs; left pair constant gap, right pair increasing gap; no arrows, text, letters, numbers, formulas, graph axes, signboards, logos, or watermark; neither candidate is shown as correct
Avoid: road lanes, branching Y intersection, curved parallel road edges, photorealism, human hands, speech bubbles
```

The first crossroads variant made both candidates look like roads with parallel edges and was rejected before repository use.

## `krabi_ctyri_skupiny.png`

- Teaching role: introduce the categorical-by-categorical example by making the four combinations of two color forms and two sexes visible before students inspect the data.
- Generation date: 2026-09-26
- SHA-256 (selected painterly redraw, 2026-10-15): `8EFA2165E0F294659D2FE7E88B62E5B55D42C5D1E4FF7919A5F4DA6CB23A99FD`
- Superseded paper-cut medallion refresh SHA-256: `608F5357282761185EABE82CACA6AF0E1A8DBCA71E32C462C58C088A143A24CC`
- Original SHA-256 (2026-09-26): `DC7959D457959A6D151B367B6A7DC960AA0EFF076DC292670C57A433241B93A0`
- Generation mode: OpenAI built-in image generation; new bitmap asset.
- Style reference for the selected redraw: approved `krabi_titulni_ilustrace.png` T2; the previous four-group image supplied the arrangement and sex/form encoding only.
- Selected output: exactly four painterly crabs in a balanced 2 × 2 group, with blue female/male at left and orange female/male at right. Large matte painted wooden medallions are held naturally in their claws: green ♀ in the upper row and pink-purple ♂ in the lower row. No tiny stickers or sex-size hierarchy.
- Earlier refresh 2026-10-15: the author selected large integrated paper-cut medallions after rejecting small stickers. Their large, integrated treatment is retained in painterly materials by the later redraw; the flat paper-cut version is superseded.

### Generation prompt

```text
Use case: scientific-educational
Asset type: 16:9 section-divider illustration for a university biostatistics lecture
Primary request: Create a humorous, friendly illustration showing the four combinations formed by two crab color forms and two sexes. Arrange exactly four recognizable shore crabs as a clean 2 by 2 character group: blue female and blue male on the left side, orange female and orange male on the right side. Each color pair must clearly contain one female and one male. Give each crab a small plain round badge showing only one large standard sex symbol, either ♀ or ♂, so the two sexes are unambiguous. The four crabs look like a cheerful class photo and have slightly different natural poses.
Scene/backdrop: minimal sandy shoreline with a subdued sea horizon and generous clean negative space
Subject: exactly four friendly shore crabs, two naturally blue toned and two naturally orange toned
Style/medium: original flat editorial paper cut illustration, crisp layered shapes, gentle paper texture, rounded friendly character design, playful academic tone consistent with a polished university lecture
Composition/framing: wide landscape, balanced four character composition, readable when projected, no overlap between badges
Lighting/mood: bright, warm, lightly comic
Color palette: muted natural blue, muted natural orange, sand, off white, and graphite; avoid bright course purple
Text (verbatim): no words or numbers; the only glyphs allowed are two ♀ symbols and two ♂ symbols
Constraints: exactly four crabs; exactly two blue and two orange; exactly one ♀ and one ♂ within each color; symbols must be correct and clearly paired with individual crabs; no formulas, graphs, axes, logos, watermark, human hands, clothing, eyelashes, bows, hats, or gender stereotypes; do not imply that one sex or color is better, larger, or the correct answer; this is a conceptual memory device, not statistical evidence
Avoid: photorealism, crowded background, speech bubbles, written labels, decorative statistics, extra animals, duplicated limbs, incorrect sex symbols
```

## Placement summary (2026-10-15)

Status note (later on 2026-10-15): the title image now exists (T2) and all three in-deck images were redrawn; see „Title revision T2“ and „Complete in-deck painterly redraw“ below. The „current image retained“ statuses in this table and the re-prompt section are historical.

| File | Slide | Teaching role | Czech alt text | Status |
|---|---|---|---|---|
| `krabi_titulni_ilustrace.png` | 1 (title) | Connect crab measurement, colour forms and the question of a changing gap on the arrival screen | Dva modří krabi u posuvného měřítka mezi skalami a přílivovými tůněmi; za nimi vede pobřežím zelená a růžovofialová stopa ke dvěma oranžovým krabům. Ilustrace vytvořená pomocí AI. | Portrait T2 generated 2026-10-15, inspired by L10; transparent painterly vignette in the existing title slot |
| `krabi_mereni.png` | 2 | Ground the two carapace measurements before the data | Skupina modrých krabů u pobřežního měřicího stanoviště; dva krabi obsluhují posuvná měřítka kolem krunýře svého kolegy. | Painterly transparent redraw matching T2, 2026-10-15 |
| `krabi_ctyri_skupiny.png` | 32 | Make the 2 × 2 structure of form and sex visible before the second example | Čtyři krabi tvoří čtyři kombinace: samice a samec modré formy a samice a samec oranžové formy. | Painterly transparent redraw matching T2, with large painted medallions, 2026-10-15 |
| `krabi_modely.png` | 49 | Frame the closing choice between a constant and a changing gap | Dva modří krabi porovnávají dvě dvojice stop v písku: první dvojice zůstává rovnoběžná, druhá se postupně rozbíhá. | Painterly transparent redraw matching T2, with green/pink-purple trails, 2026-10-15 |

## `krabi_titulni_ilustrace.png`

- Target: title slide (`.course-title-illustrated`), generated file activates the existing slot in `Presentation/Materials/`.
- Teaching role: introduce the lesson's biological question — does the female–male difference in rear carapace width change with size?
- Reference assets for selected T2: `krabi_mereni.png` and `krabi_ctyri_skupiny.png` (crab subjects and forms only); the interaction-lines figure of slide 17, saved unchanged as `title_references/interakcni-primky.png` (colour pairing and relationship motif only); `L10/Presentation/Materials/ostrovy_titulni.png` (portrait composition, painterly style and transparency only).
- Caption: „Ilustrace vytvořená pomocí AI.“ (rendered only when the file exists).
- Provenance: OpenAI built-in image generation, 2026-10-15; selected portrait T2 generated as a new scene from the four references above. Unchanged tool output, 1086 × 1448 px, RGBA; no post-generation image editing. The exact prompt and reference hashes are recorded below.
- SHA-256 (selected T2): `A2FF8B9CF74D22277CA70D5FC69C3DA8D7962036462634D6318FD09D566368DF`
- Superseded landscape T1 SHA-256: `BCC67C81932B14BDA1D54C86A013D793DC9E2A0519BE3B26480352545891A7CA`; author rejected the title image and requested inspiration from L10. The earlier title prompts below are historical.

### Initial generation prompt (superseded by the badge-free correction below)

```text
Use case: scientific-educational
Asset type: wide title-slide illustration for a university biostatistics lecture, placed beside slide text on a dark indigo background
Input images: krabi_mereni.png and krabi_ctyri_skupiny.png as style and character references only
Primary request: Original flat editorial paper-cut illustration matching the L08 crab series. A female and a male blue rock crab stand on a sunny rocky shore, each with a plain caliper beside it. The female wears a small round bluish-green (#009E73) badge with ♀ and the male a small round reddish-purple (#CC79A7) badge with ♂. Behind them, two thin trails in the sand start close together in the foreground and spread apart toward the background, one bluish green and one reddish purple. Playful academic tone, friendly characters, natural crab anatomy.
Constraints: no text, letters or numbers; the only glyphs are one ♀ and one ♂ on the badges; no formulas, axes, charts, logos or watermark; do not imply which sex is larger; keep the crabs naturally blue; generous negative space; readable when projected
Avoid: photorealism, speech bubbles, human hands, crowded background
```

## Re-prompts for the new sex colours (2026-10-15)

Author decision 2026-10-15: blue and orange are reserved for the two colour forms; the sexes use bluish green `#009E73` (samice) and reddish purple `#CC79A7` (samec). The initial re-prompts below preserve the established paper-cut style and use the original image as a composition reference. During generation the author rejected the small stickers and chose large integrated paper-cut badges for the four-group scene. The final execution prompts and retained-image decision supersede the original small-badge instructions.

### `krabi_mereni.png` (slide 2)

```text
Use case: precise-object-edit
Input image: the current krabi_mereni.png (style, scene and composition reference)
Primary request: Keep the coastal measurement station, the paper-cut style and the cooperative blue rock crabs. Give the two crab assistants small round badges: one bluish-green (#009E73) badge with ♀ and one reddish-purple (#CC79A7) badge with ♂, so the sex colours of the lecture figures appear in the opening scene. The measured crab in the middle has no badge.
Constraints: crabs stay naturally blue; the only glyphs are one ♀ and one ♂; no text, letters, numbers, formulas, axes, logos or watermark; no human hands; do not imply quantitative results or that one sex is larger
```

### `krabi_ctyri_skupiny.png` (slide 32)

```text
Use case: precise-object-edit
Input image: the current krabi_ctyri_skupiny.png (style, composition and character reference)
Primary request: Keep the cheerful 2 by 2 class photo of four crabs: blue female and blue male on the left, orange female and orange male on the right. Recolour only the round sex badges: both ♀ badges bluish green (#009E73), both ♂ badges reddish purple (#CC79A7), so the badge colour matches the sex colour used in the figures while the body colour shows the colour form.
Constraints: exactly four crabs; bodies stay naturally blue and orange; the only glyphs are two ♀ and two ♂; no text, numbers, formulas, axes, logos or watermark; do not imply which sex or form is larger
```

### `krabi_modely.png` (slide 49)

```text
Use case: precise-object-edit
Input image: the current krabi_modely.png (style, scene and composition reference)
Primary request: Keep the thoughtful blue crabs, the beach and the two candidate pairs of thin trails in the sand. Tint each pair consistently: in both pairs one trail is bluish green (#009E73) and the other reddish purple (#CC79A7). The left pair stays parallel with a constant gap; the right pair starts close and steadily spreads apart. Neither pair is shown as correct.
Constraints: exactly four thin trails in two pairs; crabs stay naturally blue; no text, letters, numbers, formulas, axes, arrows, signboards, logos or watermark; no road-like shapes
```

### `krabi_titulni_ilustrace.png` (slide 1)

The initial prompt in the title-image section above was followed by the badge-free correction recorded below.

## First refresh execution prompts and selection (2026-10-15; title superseded by T2)

Tool: OpenAI built-in `image_gen`, with opaque backgrounds for this first refresh. Selected PNGs were copied unchanged into `Presentation/Materials/`; generated originals and rejected small-badge variants remain outside the repository under the tool's generated-image directory. The original measurement image is intentionally retained. Both landscape title variants are superseded by the transparent portrait T2 below.

### Four-group image: integrated paper-cut medallions

```text
Use case: precise-object-edit
Asset type: 16:9 university biostatistics lecture illustration.
Input image: the current four-crab illustration is the edit target. Preserve the existing original flat editorial paper-cut style and 2 by 2 composition, the four character bodies and poses, the sea and sand.
Primary request: Replace the existing plain round sex badges with LARGER PAPER-CUT BADGES INTEGRATED INTO THE ILLUSTRATION, not glossy stickers. Each crab holds its own large circular layered-paper medallion naturally against its lower shell with a claw, partly overlapping the paper-cut body layers. The medallions should be about a third of a crab's shell width, with softly irregular hand-cut edges, visible matte paper fibre and subtle layered shadow matching the original illustrated paper material. Both female medallions (top row) are bluish green #009E73 with a single large graphite ♀ cut-paper symbol. Both male medallions (bottom row) are reddish purple #CC79A7 with a single large graphite ♂ cut-paper symbol. Symbols must be clean, correct and highly legible. No white outlines, no shiny surfaces, no modern app-icon stickers. Aim for the badges to look physically crafted from the same textured paper as the crabs.
Constraints: exactly four crabs, blue female top left, blue male bottom left, orange female top right, orange male bottom right. Preserve blue and orange body forms, no new anatomy or stereotypes. Do not change relative crab sizes or imply size differences between sexes/forms. Exactly two ♀ and two ♂ symbols; no other text, letters, numbers, formulas, axes, logos, watermarks, clothing, eyelashes or bows. Keep wide landscape framing and generous space between all four characters.
```

### Model-choice image: coloured trails

```text
Use case: precise-object-edit
Asset type: 16:9 closing university biostatistics lecture-slide illustration.
Input image: the supplied current krabi_modely.png is the edit target (style, scene and composition reference).
Primary request: Keep the thoughtful blue crabs, the beach and the two candidate pairs of thin trails in the sand. Tint each pair consistently: in both pairs one trail is bluish green (#009E73) and the other reddish purple (#CC79A7). The left pair stays parallel with a constant gap; the right pair starts close in the foreground and steadily spreads apart toward the background. Neither pair is shown as correct. Preserve the exact existing trail geometry; recolour the narrow grooves themselves with clearly visible green and pink-purple pigment. These are four separate thin coloured trails, each pair has one green and one pink-purple line.
Constraints: exactly four thin trails in two pairs; crabs stay naturally blue; preserve the crab poses, framing, beach, rocks and sea, original flat editorial paper-cut style with crisp layered shapes and gentle paper texture; no text, letters, numbers, formulas, axes, arrows, signboards, logos or watermark; no road-like shapes, no filled bands between trails, no extra lines.
```

### Title-image correction: remove badges and straighten the diverging trails

```text
Use case: precise-object-edit
Asset type: 16:9 university lecture title illustration.
Input image: the supplied two-blue-crab beach illustration is the edit target.
Primary request: Make two corrections only. (1) Completely remove BOTH round badges and ALL sex glyphs from the crabs, restoring their natural blue and cream paper-cut shells underneath. The user explicitly rejected small stickers; both crabs must now be badge-free. (2) Replace the two wavy tracks with exactly two thin, nearly straight coloured trails in the sand that start CLOSE TOGETHER in the foreground (lower middle of image) and spread progressively FARTHER APART toward the background (upper middle toward the sea). One trail bluish green #009E73 and one reddish purple #CC79A7. The separation at the background end must be visibly greater than at the foreground end, despite perspective. Use a simple wide-open V with no joined vertex; two separate thin trails, no crossings, bends or looping, no arrows.
Keep unchanged: two equally prominent similarly sized naturally blue rock crabs, their natural anatomy and friendly appearance, each plain caliper beside it, sunny rocky coastline, subtle sea horizon, generous negative space, original flat editorial paper-cut style, crisp layered shapes and gentle paper texture, wide framing.
Constraints: NO badges, stickers, symbols, text, letters, numbers, formulas, axes, charts, logos, watermark or human hands. Do not imply which sex is larger. This is a conceptual memory image, not a chart or quantitative evidence.
```

### Attribution and reuse

Original AI-generated illustrations created with OpenAI's built-in image-generation tool for this course; references are the course-owned series images and lesson-generated figure. No third-party artwork was introduced. Distributed as original educational figures under CC BY 4.0 in `LICENSE.md`, with attribution to Biostatistika a plánování ekologických pokusů (MB120P163), Ondřej Mottl and contributors, Charles University, 2026, and a link to the source repository. Visible Czech AI disclosures and existing alternative texts remain in the presentation.

### First refresh validation (2026-10-15; before portrait T2)

- Rendered the current presentation through `R/render_presentation.R` with `POLLSLIVE_RENDER_MODE=offline` and the existing theme (`biostat.theme_sync_complete=TRUE`); HTML and the 50-slide PDF completed successfully. No quiz synchronization or publication was performed.
- Inspected slides 1, 2, 32 and 49 in the rendered HTML and PDF: the title is badge-free, the measurement scene retains its original artwork, the four-group scene has large integrated paper medallions, and both model candidates use the sex-coloured trails. AI disclosures are visible and the images fit their existing slots.
- Confirmed that every saved PNG is embedded byte-for-byte in the HTML, has nonempty Czech alternative text and matches its recorded SHA-256. `Presentation/presentation.html` and `docs/index.html` are identical. Checked UTF-8 without BOM or replacement characters and `git diff --check` for this record.
- The render reported an existing `renv` synchronization warning and Sass variable-before-declaration warnings. They did not stop rendering; dependency and shared-theme changes are outside this image refresh.

## Title revision T2: portrait inspired by L10 (2026-10-15)

The author rejected the first landscape title illustration and explicitly requested L10 as inspiration. T2 adopts the reference's compact portrait composition, rich natural-history watercolour/gouache treatment, strong foreground characters and genuine transparent silhouette. Two blue rock crabs and unmarked calipers occupy the foreground; rocky tide pools and two smaller orange-form crabs extend the lesson setting upward. Green and pink-purple trails remain a restrained conceptual motif. There are no badges, symbols, text or numerical results. The existing 36%-wide title slot and canonical brand files are unchanged.

The saved file is `Presentation/Materials/krabi_titulni_ilustrace.png`, copied byte-for-byte from the built-in output `exec-dbdd1608-b06e-4f21-88b6-8a6816da8ede.png`. Format: portrait 3:4, 1086 × 1448 px, PNG RGBA, alpha range 0–255, 20.58% fully transparent pixels, non-transparent bounds (0, 3, 1085, 1448). The rejected T1 remains outside the repository in the generated-image directory. Student-facing alternative text and the title speaker note were updated to describe the new scene accurately.

### Actual tool references

Paths in the first column are relative to the multi-repository workspace, except the local `title_references` file. The L10 source was read only; its course-original image remains under the CC BY 4.0 terms recorded in that repository. No L10 external photo or third-party image was supplied.

| Reference | Role | SHA-256 |
|---|---|---|
| `L10/Presentation/Materials/ostrovy_titulni.png` | Painterly style, portrait composition and transparent-vignette reference only | `2bfdd5f98300a9e52cfa73fc8052ad893c6934a106a12cc6843680572ec27458` |
| `L08/Presentation/Materials/krabi_mereni.png` | Blue crab characters, coastal measurement context | `6a84f1c521a11b073a98ca65073526901cd6cfebb29fa5e62164b33b9f905cc4` |
| `L08/Presentation/Materials/krabi_ctyri_skupiny.png` | Blue and orange body forms only; badges excluded | `608f5357282761185eabe82caca6af0e1a8dbca71e32c462c58c088a143a24cc` |
| `title_references/interakcni-primky.png` | Original L08 figure extracted unchanged from the rendered HTML, chunk `interakcni-primky`, slide 17; colours and changing-gap motif only | `f4c631127d35d33e7a692bf0535551f9d761e67f3413ba84ce68a9a90496515a` |

### Exact submitted T2 prompt

```text
Use case: illustration-story / scientific-educational title illustration.
Create a NEW PORTRAIT 3:4 composition for the right-hand column of a university biostatistics title slide. Genuine TRANSPARENT RGBA background, irregular natural silhouette, subject fills almost all the portrait. It must look beautiful and richly illustrated at only 360-380 px wide on a deep purple #5D2890 slide.
Input roles: image 1 (L10 tortoise/islands title) is the primary STYLE, painterly quality, portrait composition, depth and transparent-vignette reference ONLY. Do not include its tortoise, birds, islands, cacti or notebook. Images 2 and 3 are L08 crab-character, coastal measurement and blue/orange body-form references ONLY; do not copy their flat paper-cut medium, rectangles, smiles or badges. Image 4 is the actual L08 interaction-lines plot: use ONLY the idea of two relationships gradually separating and its green #009E73 / pink-purple #CC79A7 colour pairing. No part of the chart may appear in the artwork.
Primary scene: a captivating miniature natural-history coastal world, painted in warm storybook WATERCOLOUR AND GOUACHE with nuanced organic brushwork, as detailed and dimensional as the L10 reference. In the lower foreground two expressive naturally BLUE rock crabs explore a rugged, richly textured grey shoreline ledge with a shallow tide pool, seaweed and a few pale shells. Their complete bodies and claws have convincing crab anatomy and gentle character, no human hands. One crab curiously examines a large plain unmarked metal caliper lying diagonally on the ledge between them; the second looks across at its companion, as a lightly humorous field-measurement partnership. The crabs are equally prominent and similar in size; no suggested sex-size hierarchy. A second smaller plain measuring tool is nestled naturally among the foreground rocks. Clear luminous blue shells and cream undersides, finely painted natural texture, lively dark eyes, no drawn cartoon grins.
Behind and ABOVE the foreground cast, a compact rocky shoreline recedes upward through a narrow sandy inlet and small rock pools, with subdued blue sea local to the scene. Two delicate pigment-tinted trails in the sand, one bluish green #009E73 and one reddish purple #CC79A7, start close and gradually separate toward the upper scene, integrated quietly as a secondary metaphor; never dominate the animals. Near the distant upper shoreline two much smaller naturally orange rock crabs suggest the other colour form. The entire environment forms a tall coherent tapered vignette, with depth and a strong foreground silhouette, rather than a horizontal postcard. The two large blue crabs and diagonal caliper must be readable first.
Palette: natural sea blues, stone graphite, warm pale sand, olive seaweed, cream shells; green and pink-purple only as restrained trails, orange naturally on the two distant crabs. Rich warm natural-history lighting, painterly detail and gentle academic humour. Preserve dark/light separation so the vignette reads on purple.
Transparency and framing: empty space OUTSIDE the irregular vignette is truly transparent; transparent gaps above and around rocks; NO sky fill, no solid background, no rectangular border, no white wash or glow, no vignette fading into opaque white, no checkerboard pattern. Fill the 3:4 canvas tightly with modest breathing room around complete claws and rock edges.
Absolute constraints: NO badges, stickers, medallions, gender symbols, clothing, text, letters, numbers, scales on tools, formulas, graph axes, plots, arrows, logos or watermarks. No photorealism, no paper-cut/cartoon/app-icon styling, no extra animals, no human hands. This is evocative lesson art, not statistical evidence.
```

### T2 validation

- Regenerated the HTML and 50-slide PDF through `R/render_presentation.R`, using the existing theme and offline PollsLive preparation. Inspected the title slide in rendered HTML and rasterised PDF. The portrait fills its existing title column, blends with the purple background and has no clipping or overlap with the title, caption or footer. At a 1050 × 700 viewport the image occupies approximately 340 × 454 px, with the crabs and caliper clearly visible.
- Verified the saved title PNG's dimensions, genuine alpha channel and SHA-256, its exact embedded bytes and Czech alt text in the final HTML, and the 1086 × 1448 image in PDF page 1. Verified all four lesson images against their recorded hashes and embedded bytes. `Presentation/presentation.html` and `docs/index.html` remain byte-identical.
- Source and provenance files passed UTF-8/no-BOM, replacement-character and whitespace checks. L10 and `_brand` were inspected read-only and remain unchanged. Existing dependency and Sass warnings remain as recorded above.


## Complete in-deck painterly redraw (2026-10-15)

After approving title T2, Ondřej Mottl explicitly requested that the other images be redrawn in the same style. All three were generated with OpenAI's built-in `image_gen`, using the approved title as the primary style/character reference and the previous corresponding image only for its teaching role and composition. The title reference SHA-256 is `A2FF8B9CF74D22277CA70D5FC69C3DA8D7962036462634D6318FD09D566368DF`; the three previous-image hashes are retained in the individual entries above. Those earlier references and prompts remain historical records; this section describes the selected in-deck files.

The images are unchanged tool outputs copied into `Presentation/Materials/`. All are RGBA with alpha range 0–255 and genuine transparent space around irregular painted silhouettes. No deterministic image editing, recolouring or background removal was applied. Initial drafts and superseded images remain outside the repository in the generator's image directory. The measurement scene required two targeted tool edits for the central crab's orientation and an extra claw in the intermediate draft; only the corrected output is used.

| Selected file | Dimensions | Fully transparent pixels | Generated source | SHA-256 |
|---|---|---|---|---|
| `krabi_mereni.png` | 1672 × 941 px (approximately 16:9) | 23.11% | `exec-43b79f2b-0748-46d9-b833-010af58867b7.png` | `F1F582BCF8566B13E69BDC6A5D960A7265BD6E90479D06C791D9FA113922BBC5` |
| `krabi_ctyri_skupiny.png` | 1448 × 1086 px (4:3) | 19.62% | `exec-8f5977ca-3a89-4ebb-9b79-1efe77566a3a.png` | `8EFA2165E0F294659D2FE7E88B62E5B55D42C5D1E4FF7919A5F4DA6CB23A99FD` |
| `krabi_modely.png` | 1448 × 1086 px (4:3) | 18.06% | `exec-0083fce3-9f30-4fdd-b399-68c42c1522a0.png` | `97843DDFD59F075C358E906611D8BA1154049ED276BAAFE6B074156E69E48F1E` |

The large natural blue and orange areas depict body forms, while green/pink-purple encode sex on the four-group medallions and trails in the model-choice metaphor. There are no tiny stickers, answer labels or numerical results. The existing Czech alternative texts and visible AI disclosures remain applicable. Attribution and CC BY 4.0 distribution terms recorded above also apply to these original redrawn course illustrations.

### Measurement scene: generation

```text
Use case: illustration-story / scientific-educational.
Asset: krabi_mereni.png, NEW wide 16:9 slide illustration with genuine transparent RGBA background and a tightly framed irregular natural vignette.
Input image 1, the approved L08 portrait title, is the PRIMARY painterly style, crab-character and coastal material reference. Image 2, the old measurement scene, is ONLY a subject and scene-function reference; do not copy its flat paper-cut rendering or rectangular backdrop. Create a new coherent scene in exactly the approved title's rich warm natural-history WATERCOLOUR/GOUACHE style: organic brushwork, dimensional rocks, finely painted blue shells and cream undersides, lively dark eyes, gentle academic humour and convincing crab anatomy.
Scene: a small coastal morphology field station on a weathered wooden table integrated with rocky shoreline and shallow tide pools. One cooperative blue rock crab is centred on a plain pale measuring board in an elevated three-quarter dorsal view. Two smaller blue crab assistants, one at either side, use their natural claws to operate a large plain metal caliper beside its carapace, clearly suggesting the front-to-back carapace-length measurement. To the right, a fourth blue crab seen more from above has a second plain caliper placed transversely beside the rear carapace, suggesting rear carapace width. Both calipers must have plausible beams, sliding jaws and visible separation around the shell; no numbers, markings or exact measured values. All four crabs are naturally blue, curious and cooperative, not identifiable by sex. No human hands or arms. Keep the main crab and both tools unobscured and readable at slide size. This image introduces measurement context, not numerical evidence.
Composition: main subjects and measuring tools fill the lower and central frame; only a few richly painted rocks, olive seaweed, pale shells and a small local blue sea inlet behind them to connect to the approved title. Wide, compact, balanced scene, gently lit. No broad sky, no distant horizontal panorama. Complete silhouettes, no clipped claws. Table edge and rocks form an irregular painterly boundary, empty space outside truly transparent. Natural muted sea blues, graphite metal and stone, warm pale sand/wood, off-white; brand purple/orange not used as large decorative areas.
Absolute constraints: NO badges, medallions, stickers, sex symbols, clothing, text, letters, numbers, scales or marks on tools, formulas, axes, charts, arrows, logos or watermarks. No photorealism, paper-cut shapes, flat cartoon grins, crowded scenery, extra crabs, duplicated claws or human limbs. No rectangular backdrop, sky fill, white background wash, checkerboard or glow. Transparent RGBA, not simulated transparency.
```

### Measurement scene: orientation correction

```text
Use case: precise-object-edit / scientific-educational.
Edit ONLY the CENTRAL measured crab, its measuring board and the orientation of its main caliper in the supplied newly painted coastal measurement illustration. Retain the approved rich natural-history watercolour/gouache, every other crab, second transverse caliper on the right, table, rocks, seaweed, tide pools, wide composition and genuine transparent RGBA silhouette.
Correction: the large central caliper currently runs across the shell sideways, showing width. It needs to demonstrate FRONT-TO-BACK CARAPACE LENGTH. Show the central crab FROM ABOVE in a clear dorsal view, rotated in the plane so its HEAD AND EYES point to the RIGHT side of the picture, and the rear of the shell points LEFT. Its two claws extend to the RIGHT beyond the shell, walking legs extend naturally above and below the central shell. Keep the complete plausible crab body on the board, with its head/rear direction unambiguous. Place the large caliper's long beam horizontally just ABOVE this central crab's shell, aligned with the crab's LEFT-TO-RIGHT LONGITUDINAL body axis. The two downward measuring jaws bracket only the hard shell: left jaw touches the shell's rearmost edge on the LEFT, right jaw touches the FRONT rim between the eyes on the RIGHT; never measure to the end of the claws. A narrow neutral guide alignment is optional ONLY as a physical caliper extension, no drawn arrows or lines. The two side crab assistants operate the ends of the plain caliper with their natural claws. The separate right-hand crab and tool still illustrate transverse rear width and must remain unchanged.
This is a local orientation correction, not a new scene. Keep natural blue/cream shell texture, realistic crab anatomy, organic painterly materials, gentle character. No human hands, extra crabs, badges, sex symbols, clothing, text, letters, numbers, tool scale markings, formulas, charts, axes, arrows, logos, watermark or simulated transparency. The background remains truly transparent outside the existing irregular vignette.
```

### Measurement scene: extra-claw correction

```text
Use case: precise-object-edit. Edit ONLY ONE ANATOMY ERROR in the supplied transparent coastal measurement painting. The central sideways crab on the pale board currently has THREE large claws pointing right; a crab must have exactly TWO claws. Remove the LOWEST of those three central-crab claws, the one lying along the lower edge of the pale board and pointing toward the lower right. Restore the plain board underneath it, and show a slender normal pointed walking leg in place of that third oversized pincer if needed. Retain the two legitimate central-crab claws on the UPPER RIGHT and MIDDLE RIGHT, its two eyes pointing right, its blue dorsal shell, the front-to-back measuring orientation and large caliper, the surrounding two assistant crabs, and the separate lower-right crab with its own width caliper. Do not accidentally remove a claw belonging to that separate right-hand crab. Preserve every other object, all framing, warm natural-history watercolour/gouache, rocky shore, table, seaweed, colours and genuine transparent RGBA background. No added text, marks, symbols, badges, extra limbs or animals. Make only this local central-crab claw correction.
```

### Four-group scene: generation

```text
Use case: illustration-story / scientific-educational.
Asset: krabi_ctyri_skupiny.png, NEW compact landscape 4:3 university slide illustration with genuine transparent RGBA background.
Image 1, the approved L08 portrait title, is the PRIMARY reference for the rich warm natural-history WATERCOLOUR/GOUACHE style, natural blue crab faces and shells, organic brushwork, dimensional rock/seaweed/shell materials, coastal lighting and irregular transparent vignette. Image 2, the previous four-group image, is ONLY a composition and semantic reference for the 2 by 2 arrangement, blue/orange body forms, correct sex symbols and large integrated medallions. Do not copy its paper-cut visual medium or flat cartoon grins. Create a NEW scene matching the approved title.
Main subject: EXACTLY FOUR friendly natural rock crabs in a balanced, uncluttered 2 by 2 group on one low rocky/sandy coastal ledge. TOP LEFT naturally blue female; TOP RIGHT naturally orange female; BOTTOM LEFT naturally blue male; BOTTOM RIGHT naturally orange male. Body colour alone identifies the blue or orange form. All four are similarly sized and equally prominent, each with complete, plausible crab limbs and claws, luminous dark eyes, blue or orange finely painted shells and cream undersides. Slight natural differences of pose, no sex-size hierarchy, no lashes, bows, clothes or stereotypes. No additional crabs anywhere.
Each crab naturally holds one LARGE round medallion against its lower shell with a claw. These must look like tangible matte weathered wood or thick natural fibre tags painted in the same painterly scene, with visible fine grain, softly irregular edges and subtle natural shadow, NOT pasted-on stickers, glossy buttons or app icons. Approximately one third of shell width. Both top-row female medallions have a bluish-green #009E73 painted face bearing ONE large dark graphite standard ♀ symbol; both bottom-row male medallions have a reddish-purple #CC79A7 face bearing ONE large dark graphite standard ♂ symbol. Make the sex glyphs geometrically correct, clean and large enough for projection: female circle with short cross below, male circle with arrow at upper right. Exactly two ♀ and two ♂ in total, one glyph per medallion, all unobscured by claws. Green/pink denotes sex, blue/orange BODY colour denotes form; do not mix these encodings.
Composition and setting: compact 4:3 balanced group, clear transparent breathing room between the four characters, low graphite rocks with a few olive seaweed fronds and pale shells around the base, a small local tide pool behind them, all in one coherent beautifully painted vignette. The four crabs and medallions dominate, environmental detail subordinate. Readable at about 450 px wide. True transparent space outside irregular rocky silhouette, no sky, rectangular background, frames, white wash, glow or simulated checkerboard. Natural sea blue, orange shells, graphite, cream and olive, green/pink medallions; no large brand-purple decorative field.
Constraints: no text, letters or numbers; ONLY the two ♀ and two ♂ symbols are allowed. No formulas, charts, graph axes, arrows anywhere except the integral male glyph, logos, watermarks, extra animals, human hands or arms. No photorealism, paper-cut geometry or cartoon smile lines. This is a conceptual four-combination memory image, not numerical evidence.
```

### Model-choice scene: generation

```text
Use case: illustration-story / scientific-educational.
Asset: krabi_modely.png, NEW compact landscape 4:3 university slide illustration, genuine transparent RGBA with an irregular natural vignette.
Input 1 (approved L08 portrait title) is the PRIMARY style/character/material reference: match its rich warm natural-history WATERCOLOUR/GOUACHE, organic brushwork, dimensional graphite rocks, olive seaweed, pale shells, luminous natural blue crab shells and cream undersides, dark expressive eyes and gentle academic humour. Input 2 (old model-choice scene) is ONLY the semantic reference for exactly two blue crabs comparing two candidate pairs of trails. Do not copy paper-cut rendering or the rectangular background. New beautifully painted coherent scene.
Subject: two thoughtful naturally BLUE rock crabs stand along the LOWER LEFT edge of a compact sandy coastal clearing, looking across the sand at TWO CLEARLY SEPARATED CANDIDATE PAIRS of thin coloured grooves. One crab closer to us, a second modestly smaller companion behind it; complete natural crab anatomy, no clothes, badges or symbols. The first crab's slightly lifted claw and curious posture suggests comparing options, not selecting a winner.
Critical geometry: exactly FOUR thin continuous trails TOTAL, grouped into two pairs on adjacent open sandy areas. LEFT candidate pair: one bluish-green #009E73 trail and one reddish-purple #CC79A7 trail, both straight, exactly parallel, with a visibly CONSTANT separation along their full visible length. RIGHT candidate pair: one bluish-green #009E73 trail and one reddish-purple #CC79A7 trail starting CLOSE together near the lower foreground and opening steadily FARTHER APART toward the upper background. The right pair must not cross or join at the near end. Keep the two candidates far enough apart to read independently. No branching fork, single road, paired road edges, arrows, labels, filled ribbons, dotted lines or additional trails. Trail pigments belong to narrow textured grooves in sand. Both pairs equally prominent, neither highlighted as correct.
Composition: sufficiently elevated near-overhead viewpoint so the trail geometry reads clearly without perspective making the parallel pair appear convergent. Sand patches occupy the central and upper scene, crabs lower left, a small cluster of natural rocks between the two candidate systems if useful for separation. A few richly painted coastal rocks, small olive seaweed fronds and pale shells frame the outside; a small local tide pool near an upper edge ties the setting to the title. Environmental detail subordinate to the two crabs and four trails. Compact 4:3 vignette, no large empty margins, readable at about 450 px wide. Warm pale sand, natural blue shells, graphite stones, quiet sea blue; green/pink-purple reserved for the four trails.
Absolute constraints: no text, letters, numbers, sex symbols, badges, stickers, medallions, formulas, graph axes, charts, signposts, arrows, logos, watermark or human hands. No photorealism, flat paper-cut/cartoon aesthetic, drawn smile lines or extra animals. True transparent empty space outside irregular vignette, no sky fill, rectangular backdrop, white halo/wash, checkerboard pattern. This is a comparison metaphor with no quantitative result or preferred candidate.
```

### Painterly-series validation

- `R/render_presentation.R` completed in offline PollsLive mode using the existing theme and produced the 50-slide HTML/PDF deck. Inspected slides 2, 32 and 49 in rendered HTML and rasterised PDF, and confirmed title T2 on PDF page 1 remains unchanged. The wider measurement vignette and the 4:3 four-group/model vignettes fit their original slots, with complete silhouettes, readable medallions and trails, visible AI disclosures, and no clipping or overlap with the slide copy.
- Checked all four PNGs for their exact embedded bytes, nonempty Czech alternative text and recorded SHA-256. Verified genuine alpha in each redrawn image, the unchanged title hash and byte-identical `Presentation/presentation.html` / `docs/index.html`.
- Source/provenance UTF-8, absence of BOM/replacement characters and `git diff --check` passed. This redraw changes the three in-deck PNGs, this provenance record and the generated presentation outputs; no further source-copy or shared-brand changes were needed. Existing render warnings remain as recorded above.

### Alt text and speaker-note update after the redraw (2026-10-15)

The redrawn images show new detail, so the Czech `fig-alt` texts of slides 2, 32 and 49 and the speaker notes of slides 2 and 32 were rewritten to describe what is visible: the two calipers measuring length and rear width (slide 2), the green ♀ and reddish-purple ♂ medallions with body colour as form (slide 32), and the green and reddish-purple trail pairs, parallel versus diverging (slide 49). The title alt text and note had already been updated with T2.
