#----------------------------------------------------------#
#
#
#                          L08
#
#                   Prepare crab data
#
#                     O. Mottl
#                       2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Extract the reviewed package data -----
#----------------------------------------------------------#

if (
  packageDescription("MASS")[["Version"]] != "7.3-66"
) {
  cli::cli_abort(
    "Package {.pkg MASS} version 7.3-66 is required to reproduce the teaching data."
  )
}

data_krabi <-
  MASS::crabs |>
  as.data.frame()

if (
  nrow(data_krabi) != 200L ||
    ncol(data_krabi) != 8L ||
    anyNA(data_krabi)
) {
  cli::cli_abort(
    "The crabs source table failed its dimension or missing-value check."
  )
}


#----------------------------------------------------------#
# Save the teaching table -----
#----------------------------------------------------------#

readr::write_csv(
  x = data_krabi,
  file = here::here(
    "data",
    "krabi.csv"
  ),
  na = ""
)
