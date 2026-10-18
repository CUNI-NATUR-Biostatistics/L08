#----------------------------------------------------------#
#
#
#                         L08
#
#          Build height bands for the tree panels
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#' Split trees into height bands used only for drawing
#'
#' Height stays a numeric predictor in every model. The bands only decide
#' which trees are shown together in one panel and at which height each
#' panel's prediction line is drawn.
#'
#' @param data_stromy Data frame with numeric columns `prumer_cm`, `vyska_m`
#'   and `objem_m3`.
#' @param n_bands Number of bands; quantiles of height give bands with
#'   similar numbers of trees.
#'
#' @return A list with `data` (the input with a factor column `pasmo`) and
#'   `summary` (one row per band: label, number of trees, median height and
#'   the observed diameter range).
build_tree_bands <- function(data_stromy, n_bands = 4) {
  vec_hranice <-
    stats::quantile(
      x = data_stromy[["vyska_m"]],
      probs = seq(from = 0, to = 1, length.out = n_bands + 1)
    )

  vec_pasmo <-
    cut(
      x = data_stromy[["vyska_m"]],
      breaks = vec_hranice,
      include.lowest = TRUE,
      labels = FALSE
    )

  data_souhrn <-
    data.frame(pasmo_cislo = seq_len(n_bands)) |>
    dplyr::mutate(
      n = purrr::map_int(
        .x = pasmo_cislo,
        .f = ~ sum(vec_pasmo == .x)
      ),
      vyska_min_m = purrr::map_dbl(
        .x = pasmo_cislo,
        .f = ~ min(data_stromy[["vyska_m"]][vec_pasmo == .x])
      ),
      vyska_max_m = purrr::map_dbl(
        .x = pasmo_cislo,
        .f = ~ max(data_stromy[["vyska_m"]][vec_pasmo == .x])
      ),
      vyska_median_m = purrr::map_dbl(
        .x = pasmo_cislo,
        .f = ~ stats::median(data_stromy[["vyska_m"]][vec_pasmo == .x])
      ),
      prumer_min_cm = purrr::map_dbl(
        .x = pasmo_cislo,
        .f = ~ min(data_stromy[["prumer_cm"]][vec_pasmo == .x])
      ),
      prumer_max_cm = purrr::map_dbl(
        .x = pasmo_cislo,
        .f = ~ max(data_stromy[["prumer_cm"]][vec_pasmo == .x])
      )
    ) |>
    dplyr::mutate(
      popisek = paste0(
        "výška ",
        format_value_cz(vyska_min_m, digits = 1),
        "–",
        format_value_cz(vyska_max_m, digits = 1),
        " m"
      )
    )

  data_pasma <- data_stromy
  data_pasma[["pasmo"]] <-
    factor(
      x = data_souhrn[["popisek"]][vec_pasmo],
      levels = data_souhrn[["popisek"]]
    )

  res_pasma <-
    list(
      data = data_pasma,
      summary = data_souhrn
    )

  return(res_pasma)
}
