#----------------------------------------------------------#
#
#
#                         L08
#
#      Plot tree volume against diameter, one line per band
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#' Plot all trees in one panel with one model line per height band
#'
#' Used by the written materials. The bands only decide the colour and
#' shape of the points and the height at which each line is drawn; the
#' models keep height numeric. Requires `theme_biostat()` to be sourced.
#'
#' @param res_pasma Output of `build_tree_bands()`.
#' @param mod Fitted `lm()` with predictors `prumer_cm` and `vyska_m`.
#' @param vec_barvy Character vector with one colour per band, ordered from
#'   the lowest to the highest band.
#' @param vec_tvary Numeric vector with one point shape per band, in the
#'   same order.
#' @param base_size Base font size passed to `theme_biostat()`.
#'
#' @return A ggplot object.
plot_tree_bands <- function(
  res_pasma,
  mod,
  vec_barvy,
  vec_tvary,
  base_size = 14
) {
  data_souhrn <- res_pasma[["summary"]]
  vec_popisky <- data_souhrn[["popisek"]]

  # Each line spans only the diameters observed in its own band and is drawn
  #   at the band's median height.
  data_primky <-
    purrr::map(
      .x = seq_len(nrow(data_souhrn)),
      .f = ~ data.frame(
        pasmo = vec_popisky[.x],
        prumer_cm = seq(
          from = data_souhrn[["prumer_min_cm"]][.x],
          to = data_souhrn[["prumer_max_cm"]][.x],
          length.out = 50
        ),
        vyska_m = data_souhrn[["vyska_median_m"]][.x]
      )
    ) |>
    purrr::list_rbind()
  data_primky[["pasmo"]] <-
    factor(x = data_primky[["pasmo"]], levels = vec_popisky)
  data_primky[["objem_odhad_m3"]] <-
    stats::predict(object = mod, newdata = data_primky)

  names(vec_barvy) <- vec_popisky
  names(vec_tvary) <- vec_popisky

  graf_pasma <-
    ggplot2::ggplot(
      data = res_pasma[["data"]],
      mapping = ggplot2::aes(
        x = prumer_cm,
        y = objem_m3,
        colour = pasmo,
        shape = pasmo
      )
    ) +
    ggplot2::scale_colour_manual(values = vec_barvy) +
    ggplot2::scale_shape_manual(values = vec_tvary) +
    ggplot2::guides(
      colour = ggplot2::guide_legend(nrow = 2),
      shape = ggplot2::guide_legend(nrow = 2)
    ) +
    ggplot2::labs(
      x = "Průměr kmene (cm)",
      y = "Objem dřeva (m³)",
      colour = "Výškové pásmo",
      shape = "Výškové pásmo"
    ) +
    theme_biostat(base_size = base_size) +
    ggplot2::geom_point(
      alpha = 0.9,
      size = 2.6
    ) +
    ggplot2::geom_line(
      data = data_primky,
      mapping = ggplot2::aes(y = objem_odhad_m3),
      linewidth = 1.2
    )

  return(graf_pasma)
}
