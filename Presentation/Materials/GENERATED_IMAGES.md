# Generated illustration provenance

## Scope

- Lesson: L08 — Interakce prediktorů
- Generation date: 2026-09-23
- Generation mode: OpenAI built-in image generation; new bitmap assets followed by targeted edits.
- Shared visual language: original flat editorial paper-cut illustration with friendly blue rock crabs, a coastal setting, and no generated instructional text.
- Student-facing metadata: each occurrence has Czech alternative text and the visible caption `Ilustrační obraz vytvořen AI.` in `Presentation/presentation.qmd`.
- Teaching boundary: the illustrations are context and memory devices. Statistical evidence remains attached to observed data and model-derived figures.
- Brand treatment: natural blue and sand belong only to the depicted organism and setting. Exact variable labels remain graphite; competing models use indigo and amethyst; orange is reserved for the closing interpretation question.

## `krabi_mereni.png`

- Teaching role: make carapace length and rear carapace width concrete before students inspect the scatterplot.
- SHA-256: `6A84F1C521A11B073A98CA65073526901CD6CFEBB29FA5E62164B33B9F905CC4`
- Selected output: the targeted edit removed human hands and let crab assistants operate the measuring tools.

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
- SHA-256: `C620FB23AD14001EC7B1004C704734C507E917F4C15FE98806C77BD2095B9ACE`
- Style reference: `krabi_mereni.png`; the scene and concept are new.
- Selected output: the targeted edit replaced a road-like fork with two independent trail pairs so the constant-gap and changing-gap candidates are visually distinct.

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