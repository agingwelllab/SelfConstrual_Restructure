# function to clean up raw data frame
icclean <- function(icraw_df) {
  
  # remove unnecessary column for "complete" form status
  icwide <- select(icraw_df, -individualismcollectivism_survey_complete)
  
  # restructure df to change from wide to long format
  iclong <- pivot_longer(
    data = icwide,
    cols = ind_1:col_15,
    names_to = "variables",
    values_to = "response"
    )
  
  # separate variables column into subscale and q_number
  iclong <- iclong %>%
    separate(variables, c('subscale', 'q_number'), '_')
  
  # restructure df back to wide format
  ictotal_clean <- pivot_wider(
    data = iclong,
    names_from = q_number,
    values_from = response,
    names_prefix = "q_"
  )
}

# function to calculate mean scores for subscales
icmean <- function(ictotal_clean) {
  
  # convert back to long format for easier restructuring of mean df
  ictotal_mean_raw <- pivot_longer(
    data = ictotal_clean,
    cols = q_1:q_15,
    names_to = "q_number",
    values_to = "response"
  )
  
  # remove q_number column
  ictotal_mean_raw <- ictotal_mean_raw %>%
    select(-q_number)
  
  # convert to wide format with aggregate mean scores for each subscale
  ictotal_mean <- pivot_wider(
    data = ictotal_mean_raw,
    names_from = subscale,
    values_from = response,
    values_fn = mean
  )
  
  # round mean values to 2 decimals
  ictotal_mean$ind <- round(ictotal_mean$ind, digits = 2)
  ictotal_mean$col <- round(ictotal_mean$col, digits = 2)
  
  return(ictotal_mean)
}