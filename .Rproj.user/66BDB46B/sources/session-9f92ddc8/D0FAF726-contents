#' Get match results for all Euroleague matches
#'
#' Returns a data frame of all results of all Eoroleague matches
#' played since the 2000-2001 season
#'
#' @return returns a data frame of match results
#'
#' @export
#'
#' @examples
#' try({
#' match_results <- euroleague_results()
#' })
euroleague_results <- function() {

  dat <- .file_reader("https://github.com/JaseZiv/euroleagueR_data/releases/download/match_results/euroleague_match_results.rds")

  cli::cli_alert("Data last updated {attr(dat, 'euroleagueR_timestamp')} AEST")

  return(dat)

}
