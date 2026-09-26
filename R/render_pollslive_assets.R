library(grid)

here::i_am("R/render_pollslive_assets.R")

source_path <- here::here("pollslive", "source", "l07-kridlatka_populace.csv")
output_dir <- here::here("pollslive", "assets")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

expected_source_hash <- "638aa8dbf0829d27760e0447eebc7104c6c2270836935dafd8fa88f8b6dc4cc1"
stopifnot(
  identical(
    digest::digest(file = source_path, algo = "sha256"),
    expected_source_hash
  )
)

data_l07 <- utils::read.csv(source_path, check.names = FALSE)
model_order_a <- stats::lm(
  tloustka_listu_mm ~ teplota_rocni_C + teplota_max_C,
  data = data_l07
)
model_order_b <- stats::lm(
  tloustka_listu_mm ~ teplota_max_C + teplota_rocni_C,
  data = data_l07
)

stopifnot(
  isTRUE(all.equal(stats::coef(model_order_a), stats::coef(model_order_b)[names(stats::coef(model_order_a))])),
  isTRUE(all.equal(stats::fitted(model_order_a), stats::fitted(model_order_b)))
)

cols <- c(
  parchment = "#F4F1EC", white = "#FFFFFF", indigo = "#5D2890",
  graphite = "#2E2E2E", grey = "#8A8A8A", orange = "#F3A712",
  teal = "#167B88", pale = "#E9DFEF"
)

open_png <- function(filename, width = 1600, height = 900) {
  grDevices::png(
    filename = here::here(output_dir, filename),
    width = width, height = height, res = 160,
    type = "cairo", bg = cols[["parchment"]]
  )
  grid::grid.newpage()
}

draw_title <- function(title, subtitle = NULL) {
  grid::grid.text(
    title, x = 0.06, y = 0.92, just = "left",
    gp = grid::gpar(col = cols[["indigo"]], fontsize = 31, fontface = "bold")
  )
  if (!is.null(subtitle)) {
    grid::grid.text(
      subtitle, x = 0.06, y = 0.84, just = "left",
      gp = grid::gpar(col = cols[["graphite"]], fontsize = 18)
    )
  }
}

open_png("l07-conditional-coefficient.png")
draw_title(
  "Co znamená sklon v modelu se dvěma teplotami?",
  "tloušťka listu ~ roční teplota + maximální teplota"
)
grid::grid.roundrect(
  x = 0.50, y = 0.56, width = 0.86, height = 0.36,
  r = grid::unit(0.025, "npc"),
  gp = grid::gpar(fill = cols[["white"]], col = cols[["pale"]], lwd = 2)
)
coef_annual <- stats::coef(model_order_a)[["teplota_rocni_C"]]
grid::grid.text(
  "roční teplota", x = 0.13, y = 0.64, just = "left",
  gp = grid::gpar(col = cols[["graphite"]], fontsize = 23, fontface = "bold")
)
grid::grid.text(
  sprintf("%+.5f mm / °C", coef_annual),
  x = 0.13, y = 0.51, just = "left",
  gp = grid::gpar(col = cols[["indigo"]], fontsize = 32, fontface = "bold")
)
grid::grid.text(
  "při stejné\nmaximální teplotě",
  x = 0.57, y = 0.58, just = "left",
  gp = grid::gpar(col = cols[["orange"]], fontsize = 22, fontface = "bold", lineheight = 1.15)
)
grid::grid.text(
  "Každý koeficient drží ostatní prediktory stejné.",
  x = 0.06, y = 0.23, just = "left",
  gp = grid::gpar(col = cols[["graphite"]], fontsize = 21)
)
grDevices::dev.off()

open_png("l07-supported-scenario.png")
draw_title(
  "Která kombinace teplot má oporu v datech?",
  "Jeden bod představuje jednu zdrojovou populaci."
)
pushViewport(grid::viewport(x = 0.51, y = 0.49, width = 0.83, height = 0.64))
x <- data_l07$teplota_rocni_C
y <- data_l07$teplota_max_C
xlim <- range(c(x, 7))
ylim <- range(c(y, 33))
sx <- function(z) 0.08 + 0.84 * (z - xlim[1]) / diff(xlim)
sy <- function(z) 0.10 + 0.80 * (z - ylim[1]) / diff(ylim)
for (tick in pretty(xlim, 5)) {
  grid::grid.lines(x = grid::unit(c(sx(tick), sx(tick)), "npc"),
                   y = grid::unit(c(0.10, 0.90), "npc"),
                   gp = grid::gpar(col = cols[["pale"]]))
  grid::grid.text(format(tick), x = sx(tick), y = 0.05,
                  gp = grid::gpar(col = cols[["grey"]], fontsize = 12))
}
for (tick in pretty(ylim, 5)) {
  grid::grid.lines(x = grid::unit(c(0.08, 0.92), "npc"),
                   y = grid::unit(c(sy(tick), sy(tick)), "npc"),
                   gp = grid::gpar(col = cols[["pale"]]))
  grid::grid.text(format(tick), x = 0.04, y = sy(tick),
                  gp = grid::gpar(col = cols[["grey"]], fontsize = 12))
}
grid::grid.points(sx(x), sy(y), pch = 16, size = grid::unit(1.5, "mm"),
                  gp = grid::gpar(col = grDevices::adjustcolor(cols[["graphite"]], 0.45)))
scenarios <- data.frame(label = c("A", "B"), annual = c(18, 7), maximum = c(29, 33))
grid::grid.points(
  sx(scenarios$annual), sy(scenarios$maximum), pch = 21,
  size = grid::unit(4.3, "mm"),
  gp = grid::gpar(col = c(cols[["teal"]], cols[["orange"]]), fill = cols[["white"]], lwd = 3)
)
grid::grid.text(scenarios$label, x = sx(scenarios$annual), y = sy(scenarios$maximum),
                gp = grid::gpar(col = c(cols[["teal"]], cols[["orange"]]), fontsize = 14, fontface = "bold"))
grid::grid.text("Průměrná roční teplota (°C)", x = 0.50, y = 0.00,
                gp = grid::gpar(col = cols[["graphite"]], fontsize = 15))
grid::grid.text("Maximum\nnejteplejšího\nměsíce (°C)", x = 0.98, y = 0.50,
                gp = grid::gpar(col = cols[["graphite"]], fontsize = 14))
popViewport()
grid::grid.text(
  "A leží v pozorovaném mraku · B kombinuje hodnoty mimo něj",
  x = 0.50, y = 0.10,
  gp = grid::gpar(col = cols[["graphite"]], fontsize = 19)
)
grDevices::dev.off()

anova_a <- stats::anova(model_order_a)
anova_b <- stats::anova(model_order_b)
open_png("l07-sequential-order.png")
draw_title(
  "Stejný model, jiné pořadí sekvenčních testů",
  "Koeficienty a předpovědi zůstávají stejné."
)
grid::grid.roundrect(
  x = 0.28, y = 0.54, width = 0.42, height = 0.46,
  r = grid::unit(0.02, "npc"),
  gp = grid::gpar(fill = cols[["white"]], col = cols[["pale"]], lwd = 2)
)
grid::grid.roundrect(
  x = 0.72, y = 0.54, width = 0.42, height = 0.46,
  r = grid::unit(0.02, "npc"),
  gp = grid::gpar(fill = cols[["white"]], col = cols[["pale"]], lwd = 2)
)
grid::grid.text("roční + maximální", x = 0.28, y = 0.71,
                gp = grid::gpar(col = cols[["indigo"]], fontsize = 22, fontface = "bold"))
grid::grid.text("maximální + roční", x = 0.72, y = 0.71,
                gp = grid::gpar(col = cols[["indigo"]], fontsize = 22, fontface = "bold"))
left_text <- sprintf(
  "sekvenční SS\nroční: %.4f\nmaximální: %.4f",
  anova_a[["Sum Sq"]][1], anova_a[["Sum Sq"]][2]
)
right_text <- sprintf(
  "sekvenční SS\nmaximální: %.4f\nroční: %.4f",
  anova_b[["Sum Sq"]][1], anova_b[["Sum Sq"]][2]
)
grid::grid.text(left_text, x = 0.28, y = 0.48,
                gp = grid::gpar(col = cols[["graphite"]], fontsize = 20, lineheight = 1.4))
grid::grid.text(right_text, x = 0.72, y = 0.48,
                gp = grid::gpar(col = cols[["graphite"]], fontsize = 20, lineheight = 1.4))
grid::grid.text(
  "anova() čte členy zleva doprava",
  x = 0.50, y = 0.20,
  gp = grid::gpar(col = cols[["orange"]], fontsize = 27, fontface = "bold")
)
grDevices::dev.off()

message("Rendered three L08 PollsLive evidence assets.")