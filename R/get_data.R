#' Get Euroleague match results
#'
#' Returns a data frame of all results of all Euoroleague matches
#' played since the 2000-2001 season
#'
#' @return returns a data frame of match results
#'
#' @importFrom cli cli_alert
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


#' Get Euroleague shot data
#'
#' Returns a data frame of all available shot data
#' for any season(s) of Euroleague matches played
#' since 2010-11 season, including shot types,
#' shot locations and players.
#'
#' @return returns a data frame of shot location data
#'
#' @importFrom cli cli_alert
#' @importFrom cli cli_inform
#' @importFrom dplyr bind_rows
#'
#' @param season either a single integer or range of seasons
#' @param verbose set to TRUE if you want season progress alert
#'
#' @export
#'
#' @examples
#' try({
#' shots_22 <- euroleague_shots(season = 2022)
#' shots_20to22 <- euroleague_shots(season = c(2020:2022))
#' })
euroleague_shots <- function(season, verbose = FALSE) {

  dat_df <- data.frame()
  for(i in season) {

    if(verbose) {
      cli::cli_inform("Returning season {i}")
    }

    each_df <- .file_reader(paste0("https://github.com/JaseZiv/euroleagueR_data/releases/download/shot_data/shots_", i, ".rds"))
    dat_df <- dplyr::bind_rows(dat_df, each_df)
  }

  cli::cli_alert("Data last updated {attr(each_df, 'euroleagueR_timestamp')} AEST")

  return(dat_df)
}


#' Get Euroleague play-by-play data
#'
#' Returns a data frame of all available play by play
#' data for any season(s) of Euroleague matches played
#' since 2010-11 season, including play types, players
#' involved and outcomes.
#'
#' @return returns a data frame of play-by-play data
#'
#' @importFrom cli cli_alert
#' @importFrom cli cli_inform
#' @importFrom dplyr bind_rows
#'
#' @param season either a single integer or range of seasons
#' @param verbose set to TRUE if you want season progress alert
#'
#' @export
#'
#' @examples
#' try({
#' pbp_22 <- euroleague_pbp(season = 2022)
#' pbp_21to22 <- euroleague_pbp(season = c(2021:2022))
#' })
euroleague_pbp <- function(season, verbose = FALSE) {

  dat_df <- data.frame()
  for(i in season) {

    if(verbose) {
      cli::cli_inform("Returning season {i}")
    }

    each_df <- .file_reader(paste0("https://github.com/JaseZiv/euroleagueR_data/releases/download/pbp/pbp_", i, ".rds"))
    dat_df <- dplyr::bind_rows(dat_df, each_df)
  }

  cli::cli_alert("Data last updated {attr(each_df, 'euroleagueR_timestamp')} AEST")

  return(dat_df)
}




#' Get Euroleague team box score data
#'
#' Returns a data frame of all available team box scores
#' data for Euroleague matches played since 2010-11
#'
#' @return returns a dataframe of team box score data
#'
#' @importFrom cli cli_alert
#' @importFrom cli cli_inform
#' @importFrom dplyr bind_rows
#'
#' @param season either a single integer or range of seasons
#' @param verbose set to TRUE if you want season progress alert
#'
#' @export
#'
#' @examples
#' try({
#' team_box <- euroleague_team_box(season = 2022)
#' team_box_21to22 <- euroleague_team_box(season = c(2021:2022))
#' })
euroleague_team_box <- function(season, verbose = FALSE) {

  dat_df <- data.frame()
  for(i in season) {

    if(verbose) {
      cli::cli_inform("Returning season {i}")
    }

    each_df <- .file_reader(paste0("https://github.com/JaseZiv/euroleagueR_data/releases/download/box_scores/team_box_", i, ".rds"))
    dat_df <- dplyr::bind_rows(dat_df, each_df)
  }

  cli::cli_alert("Data last updated {attr(each_df, 'euroleagueR_timestamp')} AEST")

  return(dat_df)
}


#' Get Euroleague player box score data
#'
#' Returns a data frame of all available player box scores
#' data for Euroleague matches played since 2010-11
#'
#' @return returns a dataframe of player box score data
#'
#' @importFrom cli cli_alert
#' @importFrom cli cli_inform
#' @importFrom dplyr bind_rows
#'
#' @param season either a single integer or range of seasons
#' @param verbose set to TRUE if you want season progress alert
#'
#' @export
#'
#' @examples
#' try({
#' player_box <- euroleague_player_box(season = 2022)
#' player_box_21to22 <- euroleague_player_box(season = c(2021:2022))
#' })
euroleague_player_box <- function(season, verbose = FALSE) {

  dat_df <- data.frame()
  for(i in season) {

    if(verbose) {
      cli::cli_inform("Returning season {i}")
    }

    each_df <- .file_reader(paste0("https://github.com/JaseZiv/euroleagueR_data/releases/download/box_scores/player_box_", i, ".rds"))
    dat_df <- dplyr::bind_rows(dat_df, each_df)
  }

  cli::cli_alert("Data last updated {attr(each_df, 'euroleagueR_timestamp')} AEST")

  return(dat_df)
}
