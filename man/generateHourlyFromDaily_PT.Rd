% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generateHourlyFromDaily_PT.R
\name{generateHourlyFromDaily_PT}
\alias{generateHourlyFromDaily_PT}
\title{Generate hourly precipitation and temperature time series from daily data}
\usage{
generateHourlyFromDaily_PT(PT_sim, era5_data, param)
}
\arguments{
\item{PT_sim}{Climate scenario dependent daily precipitation and temperature
station values}

\item{era5_data}{Full ERA5 data frame}

\item{param}{Stochastic weather simulation parameters}
}
\value{
List with climate scenario dependent hourly P and T data as direct
  input for RS MINERVE.
}
\description{
The function uses different gap filling methods to a) compute hourly
precipitation, and b) compute hourly temperatures for all stations/elevation
bands. Daily precipitation values are uniformly distributed over the day and
temerpatures are calculated to fit a typical diurnal station cycle between
daily Tmin and Tmax (output of stochastic weather generator). The diurnal
cycle can be calculated by the function computeDiurnalTemperatureCycle().
}
\seealso{
Other Helper functions: 
\code{\link{\%>\%}()},
\code{\link{aggregate_to_monthly}()},
\code{\link{cutRaster2Basin}()},
\code{\link{decadeMaker}()},
\code{\link{generateSeqDates}()},
\code{\link{hyear}()},
\code{\link{monDateSeq}()},
\code{\link{posixct2rsminerveChar}()}
}
\concept{Helper functions}
