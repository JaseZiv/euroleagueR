#' Save files to nblr_data release
#'
#' This functions attaches nblr_data attributes like type and timestamp, saves
#' data to a temporary directory in rds format and then uploads to nblr_data
#' repository for a specified release tag.
#'
#' @param df data_frame to save
#' @param file_name file_name to upload as, without the file extension
#' @param release_tag name of release to upload to
#'
#' @export
save_to_rel <- function(df, file_name, release_tag) {
  
  Sys.setenv(TZ = "Australia/Melbourne")
  attr(df,"euroleagueR_timestamp") <- Sys.time()
  
  temp_dir <- tempdir(check = TRUE)
  .f_name <- paste0(file_name,".rds")
  saveRDS(df, file.path(temp_dir, .f_name))
  
  piggyback::pb_upload(file.path(temp_dir, .f_name),
                       repo = "JaseZiv/euroleagueR_data",
                       tag = release_tag
  )
  
}


#' Parse Home and Away team metadata
#'
#' This functions parses scraped match results to get metadata
#' for each team
#'
#' @param games_list data frame of a scraped match
#' @param h_a whether `"home"` or `"away"`
#' 
#' @importFrom rlang .data
#'
#' @export
parse_h_a_results <- function(games_list, h_a) {
  
  h_a_df <- games_list |>  
    dplyr::select(tidyselect::all_of(h_a)) |> 
    tidyr::unnest(h_a)
  
  h_a_scores <- h_a_df |>  
    dplyr::select(.data$code, .data$name, .data$abbreviatedName, .data$tla, .data$score, .data$standingsScore, .data$coach) |> 
    tidyr::unnest(.data$coach, names_sep = "_")
  
  h_a_qs <- h_a_df$quarters
  
  non_empty_cols <- names(h_a_qs[sapply(h_a_qs, length) != 0])
  h_a_qs <- h_a_qs[, non_empty_cols]
  
  h_a_out <- h_a_scores |> cbind(h_a_qs)
  
  # change home or away to have uppercase for nicer looking col names
  h_a <- if (h_a == "home") {
    h_a <- "Home"
  } else {
    h_a <- "Away"
  }
  
  colnames(h_a_out) <- paste0(names(h_a_out), h_a)
  
  return(h_a_out)
}