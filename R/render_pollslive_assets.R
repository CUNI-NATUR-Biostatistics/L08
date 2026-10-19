#----------------------------------------------------------#
#
#
#             CUNI-NATUR-Biostatistics L08
#
#          Render PollsLive retrieval evidence
#               - the quiz retrieves L07
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#

# Reproducible source of the evidence images. Local PollsLive preparation
#   runs R/verify_pollslive_assets.R, which checks the approved bytes.

here::i_am("R/render_pollslive_assets.R")

source(here::here("R", "set_r_theme.R"))
# Pixel canvases use 150 DPI; match showtext font metrics to the save device.
showtext::showtext_opts(dpi = 150)

path_assets <-
  here::here("pollslive", "assets")

path_source <-
  here::here("pollslive", "source", "l07-kridlatka_populace.csv")

# Colours and theme of the L07 figures (L07 Presentation/presentation.qmd).
vec_cols_origin <-
  c(
    "Původní" = "#4E9A8A",
    "Zavlečené" = "#C2613A"
  )

theme_l07 <-
  theme_biostat(base_size = 19) +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(
      fill = biostat_background_color,
      colour = NA
    ),
    panel.background = ggplot2::element_rect(
      fill = biostat_cols[["white"]],
      colour = NA
    ),
    axis.title = ggplot2::element_text(
      color = biostat_cols[["graphite"]]
    ),
    panel.grid.minor = ggplot2::element_blank(),
    legend.position = "bottom"
  )

save_asset <- function(plot, filename, height) {
  # Czech decimal commas apply to axis labels drawn while saving.
  options_previous <- options(OutDec = ",")
  on.exit(options(options_previous), add = TRUE)

  plot_canvas <-
    plot +
    ggview::canvas(
      width = 1600,
      height = height,
      units = "px",
      dpi = 150
    )

  res_file <-
    ggview::save_ggplot(
      plot = plot_canvas,
      file = here::here(path_assets, filename)
    )

  return(invisible(res_file))
}


#----------------------------------------------------------#
# 1. Fit the L07 models -----
#----------------------------------------------------------#

stopifnot(
  identical(
    digest::digest(file = path_source, algo = "sha256"),
    "638aa8dbf0829d27760e0447eebc7104c6c2270836935dafd8fa88f8b6dc4cc1"
  )
)

data_kridlatka <-
  utils::read.csv(file = path_source) |>
  dplyr::mutate(
    puvod = base::factor(
      x = puvod,
      levels = c("Puvodni", "Zavleceny"),
      labels = c("Původní", "Zavlečené")
    )
  )

mod_rocni_teplota <-
  stats::lm(
    formula = tloustka_listu_mm ~ teplota_rocni_C,
    data = data_kridlatka
  )

mod_dve_teploty <-
  stats::lm(
    formula = tloustka_listu_mm ~ teplota_rocni_C + teplota_max_C,
    data = data_kridlatka
  )

mod_puvod <-
  stats::lm(
    formula = tloustka_listu_mm ~ puvod + teplota_rocni_C,
    data = data_kridlatka
  )

mat_coef_rocni <-
  base::round(stats::coef(base::summary(mod_rocni_teplota))[, 1:2], 4)

mat_coef_dve <-
  base::round(stats::coef(base::summary(mod_dve_teploty))[, 1:2], 4)

vec_ci_puvod <-
  stats::confint(mod_puvod)["teplota_rocni_C", ]

stopifnot(
  base::nrow(data_kridlatka) == 128L,
  mat_coef_rocni["teplota_rocni_C", "Estimate"] == -0.0091,
  mat_coef_dve["teplota_rocni_C", "Estimate"] == -0.0053,
  mat_coef_dve["teplota_rocni_C", "Std. Error"] == 0.0016,
  base::round(
    stats::cor(
      data_kridlatka[["teplota_rocni_C"]],
      data_kridlatka[["teplota_max_C"]]
    ),
    2
  ) == 0.85,
  base::round(stats::coef(mod_puvod)[["teplota_rocni_C"]], 4) == 0.0015,
  base::round(vec_ci_puvod[[1]], 4) == -0.0009,
  base::round(vec_ci_puvod[[2]], 4) == 0.0039
)


#----------------------------------------------------------#
# 2. Q1: the annual-temperature slope in two models -----
#----------------------------------------------------------#

vec_console_lines <-
  c(
    "> round(coef(summary(mod_rocni_teplota))[, 1:2], 4)",
    utils::capture.output(base::print(mat_coef_rocni)),
    "> round(coef(summary(mod_dve_teploty))[, 1:2], 4)",
    utils::capture.output(base::print(mat_coef_dve)),
    "> c(nobs(mod_rocni_teplota), nobs(mod_dve_teploty))",
    utils::capture.output(
      base::print(
        c(
          stats::nobs(mod_rocni_teplota),
          stats::nobs(mod_dve_teploty)
        )
      )
    )
  )

vec_console_colours <-
  base::ifelse(
    stringr::str_detect(vec_console_lines, "^>"),
    biostat_cols[["grey_olive"]],
    biostat_cols[["graphite"]]
  )

plot_console <-
  ggplot2::ggplot() +
  ggplot2::coord_cartesian(
    xlim = c(0, 1),
    ylim = c(0.5, base::length(vec_console_lines) + 0.5)
  ) +
  ggplot2::theme_void() +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(
      fill = biostat_cols[["white"]],
      colour = NA
    )
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 0.05,
    y = base::rev(base::seq_along(vec_console_lines)),
    label = vec_console_lines,
    hjust = 0,
    family = biostat_mono_font,
    size = 7.5,
    colour = vec_console_colours
  )

save_asset(
  plot = plot_console,
  filename = "l07-sklon-ve-dvou-modelech.png",
  height = 950
)


#----------------------------------------------------------#
# 3. Q2: leaf thickness by temperature and origin -----
#----------------------------------------------------------#

# Redrawn from the L07 slide "Původ populací mění obraz vztahu"; the slide
#   draws it inline, and the emoji in its axis titles are left out here.
plot_skupiny <-
  ggplot2::ggplot(
    data = data_kridlatka,
    mapping = ggplot2::aes(
      x = teplota_rocni_C,
      y = tloustka_listu_mm,
      color = puvod
    )
  ) +
  ggplot2::scale_color_manual(
    values = vec_cols_origin,
    name = "Původ"
  ) +
  ggplot2::labs(
    x = "Průměrná teplota původu (°C)",
    y = "Tloušťka listu (mm)",
    subtitle = stringr::str_c(
      "Sklon roční teploty bez původu: −0,0091 mm/°C\n",
      "s původem v modelu: +0,0015 mm/°C, 95% interval [−0,0009; 0,0039]"
    )
  ) +
  theme_l07 +
  ggplot2::theme(
    plot.subtitle = ggplot2::element_text(
      size = 15,
      colour = biostat_cols[["graphite"]]
    )
  ) +
  ggplot2::geom_point(
    alpha = 0.78,
    size = 2.8
  )

save_asset(
  plot = plot_skupiny,
  filename = "l07-tloustka-podle-puvodu.png",
  height = 900
)


#----------------------------------------------------------#
# 4. Q3: temperature ranges of both origins -----
#----------------------------------------------------------#

# Redrawn from the L07 slide "Jeden model spojí teplotu i původ".
data_rozsahy <-
  data_kridlatka |>
  dplyr::summarise(
    minimum = base::min(teplota_rocni_C),
    maximum = base::max(teplota_rocni_C),
    .by = puvod
  ) |>
  dplyr::mutate(
    y = dplyr::if_else(puvod == "Původní", 2, 1)
  )

plot_rozsahy <-
  ggplot2::ggplot(
    data = data_rozsahy,
    mapping = ggplot2::aes(
      y = y,
      color = puvod
    )
  ) +
  ggplot2::scale_color_manual(
    values = vec_cols_origin,
    guide = "none"
  ) +
  ggplot2::scale_x_continuous(
    breaks = base::seq(from = 6, to = 20, by = 2)
  ) +
  ggplot2::scale_y_continuous(
    breaks = c(1, 2),
    labels = c("Zavlečené", "Původní"),
    limits = c(0.65, 2.55)
  ) +
  ggplot2::labs(
    x = "Průměrná teplota původu (°C)",
    y = NULL
  ) +
  theme_l07 +
  ggplot2::geom_segment(
    mapping = ggplot2::aes(
      x = minimum,
      xend = maximum,
      yend = y
    ),
    linewidth = 8,
    lineend = "round"
  )

save_asset(
  plot = plot_rozsahy,
  filename = "l07-rozsahy-teplot.png",
  height = 600
)
