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
    "l07-conditional-coefficient.png" =
      "a10a149367f7b253be6fc85561e5765cdd3584dd205d5f6f00dac82af8c63fe2",
    "l07-supported-scenario.png" =
      "a7d2cf77548b3788feee7693428c34a7915188356385b9388214b405e38018a1",
    "l07-sequential-order.png" =
      "2139de455ff77c91249126e3184d8b76a1661c2299c83c371f66a7d242403bd7"
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
