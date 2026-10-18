#----------------------------------------------------------#
#
#
#                          L08
#
#                   Prepare tree data
#
#                     O. Mottl
#                       2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Extract the reviewed base R data -----
#----------------------------------------------------------#

# datasets is part of base R, so there is no package version to pin. The
#   values have not changed for decades; the checks below guard the exact
#   table that the lesson numbers were computed from.
data_stromy <-
  datasets::trees |>
  as.data.frame()

if (
  nrow(data_stromy) != 31L ||
    !identical(names(data_stromy), c("Girth", "Height", "Volume")) ||
    anyNA(data_stromy) ||
    !isTRUE(all.equal(sum(data_stromy[["Volume"]]), 935.3))
) {
  cli::cli_abort(
    "The trees source table failed its dimension, name or value check."
  )
}


#----------------------------------------------------------#
# Save the teaching table -----
#----------------------------------------------------------#

# Values stay in the original inches, feet and cubic feet; students convert
#   them to metric units in visible code.
readr::write_csv(
  x = data_stromy,
  file = here::here(
    "data",
    "stromy.csv"
  ),
  na = ""
)
