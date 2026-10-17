#----------------------------------------------------------#
#
#
#                         L08
#
#        Plot tree volume against diameter by height
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#' Plot one panel per height band with the model line at that height
#'
#' Used by both the written materials and the presentation so that the two
#' show the same figure. Requires `theme_biostat()`, `biostat_cols` and
#' `format_value_cz()` to be sourced.
#'
#' @param res_pasma Output of `build_tree_bands()`.
#' @param mod Fitted `lm()` with predictors `prumer_cm` and `vyska_m`.
#' @param flag_reference Logical. If `TRUE`, every panel also shows the
#'   lowest band's line as a grey dashed reference.
#' @param base_size Base font size passed to `theme_biostat()`.
#'
#' @return A ggplot object.
plot_tree_panels <- function(
  res_pasma,
  mod,
  flag_reference = FALSE,
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

  graf_pasma <-
    ggplot2::ggplot(
      data = res_pasma[["data"]],
      mapping = ggplot2::aes(x = prumer_cm, y = objem_m3)
    ) +
    ggplot2::facet_wrap(
      facets = ggplot2::vars(pasmo),
      nrow = 1
    ) +
    ggplot2::labs(
      x = "Průměr kmene (cm)",
      y = "Objem dřeva (m³)"
    ) +
    theme_biostat(base_size = base_size) +
    # Extra spacing keeps the last tick of one panel apart from the first
    #   tick of the next
    ggplot2::theme(
      panel.spacing.x = ggplot2::unit(1.6, "lines")
    )

  if (
    flag_reference
  ) {
    # The lowest band's line, repeated in every panel but clipped to the
    #   diameters observed in that band, so it never extrapolates
    vec_prumery_reference <-
      data_primky[["prumer_cm"]][data_primky[["pasmo"]] == vec_popisky[[1]]]
    data_reference <-
      purrr::map(
        .x = vec_popisky,
        .f = ~ data.frame(
          pasmo = .x,
          prumer_cm = vec_prumery_reference
        )
      ) |>
      purrr::list_rbind()
    data_reference[["pasmo"]] <-
      factor(x = data_reference[["pasmo"]], levels = vec_popisky)
    data_reference[["vyska_m"]] <- data_souhrn[["vyska_median_m"]][[1]]
    data_reference[["objem_odhad_m3"]] <-
      stats::predict(object = mod, newdata = data_reference)

    graf_pasma <-
      graf_pasma +
      ggplot2::geom_line(
        data = data_reference,
        mapping = ggplot2::aes(y = objem_odhad_m3),
        linetype = "dashed",
        linewidth = 0.9,
        colour = biostat_cols[["grey_olive"]]
      )
  }

  graf_pasma <-
    graf_pasma +
    ggplot2::geom_point(
      alpha = 0.8,
      size = 2.2,
      colour = biostat_cols[["graphite"]]
    ) +
    ggplot2::geom_line(
      data = data_primky,
      mapping = ggplot2::aes(y = objem_odhad_m3),
      linewidth = 1.2,
      colour = biostat_cols[["indigo_velvet"]]
    )

  return(graf_pasma)
}
