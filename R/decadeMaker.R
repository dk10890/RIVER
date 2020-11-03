#' Creates a vector of decadal (10 days) dates
#'
#' This function creates a decadal 10-days dates vector that allows date tagging
#' for decadal (10-days) time series. This type of timeseries is usually used for
#' hydro-meteorological data in the former Soviet Republics. The intra-months decades
#' can be configured as dates at the beginning or end of the decade.
#'
#' @param s starting date in YYYY-mm-dd format
#' @param e end date in YYYY-mm-dd format
#' @param type 'start' creates starting decade dates, 'end' creates ending decade dates.
#' @return A sequence of decadal dates
#' @export
decadeMaker <- function(s,e,type){
  decade <- 1 : 36 # Preparation of decade indicators
  ydiff <- as.Date(e) %>% year() - as.Date(s) %>% year() + 1
  decade <- rep(decade, times = ydiff)
  #decade <- as.vector(repmat(decade, 1, ydiff))
  temp <- zoo::zooreg(decade, frequency = 36, start=zoo::as.yearmon(s))
  eom <- seq.Date(zoo::as.Date(s),by='month',length.out = ydiff * 12) %>%
    zoo::as.yearmon() %>% zoo::as.Date(,frac=1) %>% format('%d') %>% as.numeric
  if (strcmp(type,'end')){
    daysV <- cbind(10,20,eom) %>% t %>% as.vector()
  } else if (strcmp(type,'start')){
    daysV <- cbind(1,11,21) %>% t %>% as.vector()
  }
  temp.Date <- zoo::as.Date(time(temp)) + daysV - 1
  decade <- zoo::zoo(decade, temp.Date) %>% return
}