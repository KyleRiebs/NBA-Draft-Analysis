remove_na <- function(df) { ## Automatize the removal of missing observations.
  n_obs <- nrow(df)
  missing <- rep(FALSE, n_obs)
  for (obs_ind in 1:n_obs) {
    obs <- df[obs_ind, ]
    n_missing <- sum(is.na(obs))
    if(n_missing > 0) {
      missing[obs_ind] <- TRUE
    }
  }
  df_red <- df[!missing, ]
  
  return(df_red)
}

