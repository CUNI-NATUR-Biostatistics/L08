#----------------------------------------------------------#
#
#
#                         _brand
#
#                  Render presentation
#
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

library(here)
library(quarto)
library(fs)

# Quarto otherwise knits with the `Rscript` on PATH (the machine default R).
#   Use the R that runs this script instead, so a project pinned to another
#   R version renders with that version and its renv library. An explicit
#   QUARTO_R set by the user is kept.
if (!nzchar(Sys.getenv("QUARTO_R"))) {
  Sys.setenv(QUARTO_R = R.home("bin"))
}

if (!isTRUE(getOption("biostat.theme_sync_complete"))) {
  source(here::here("R", "generate_theme.R"))
}

source(here::here("R", "Functions", "render_presentation_outputs.R"))
render_presentation_outputs()

if (file.exists(here::here("pollslive", "config.json"))) {
  message(
    "\nTo present live embeds from the rendered HTML, run:\n",
    "  Rscript R/serve_presentation.R\n"
  )
}
