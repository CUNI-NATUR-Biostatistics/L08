#----------------------------------------------------------#
# Verify approved local evidence for the L08 retrieval quiz
#----------------------------------------------------------#

library(here)

here::i_am("R/verify_pollslive_assets.R")

# These images are reviewed teaching inputs. Re-rendering them can change their
# bytes across R sessions and therefore makes immutable synchronization
# unreliable. R/render_pollslive_assets.R stays as their reproducible source;
# local PollsLive preparation verifies the approved bytes instead.
approved_assets <-
  c(
    "l07-sklon-ve-dvou-modelech.png" =
      "1588325c188bcf1daa02b821975d5bbb77736f2a65bc90db102b937df8680998",
    "l07-tloustka-podle-puvodu.png" =
      "116c3f7d3b354b59ae113f953e4a3522a1e1716d0aeb5d6f5b0bd5a1d8a7dcff",
    "l07-rozsahy-teplot.png" =
      "fd51ee50a5a4a82a12656602b712769380a4c15087882d649b56ff12ac10d69c"
  )

asset_paths <-
  here::here("pollslive", "assets", names(approved_assets))

missing_assets <-
  names(approved_assets)[!file.exists(asset_paths)]

if (length(missing_assets) > 0L) {
  stop(
    "Missing approved PollsLive evidence assets: ",
    paste(missing_assets, collapse = ", ")
  )
}

actual_checksums <-
  unname(
    vapply(
      asset_paths,
      digest::digest,
      character(1),
      algo = "sha256",
      file = TRUE
    )
  )

changed_assets <-
  names(approved_assets)[actual_checksums != unname(approved_assets)]

if (length(changed_assets) > 0L) {
  stop(
    "Approved PollsLive evidence assets changed: ",
    paste(changed_assets, collapse = ", ")
  )
}
