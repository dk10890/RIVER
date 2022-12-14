% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readResultDST.R
\name{readResultDST}
\alias{readResultDST}
\title{Reading RSMinerve result file}
\usage{
readResultDST(filepath, chunk_size, tz = "UTC")
}
\arguments{
\item{filepath}{String with path to file to be read.}

\item{chunk_size}{Numeric telling how many lines to read for each model component.}

\item{tz}{Time zone to be passed to as_datetime. Defaults to "UTC".}
}
\value{
A tibble with time series of simulation results for all model components.
}
\description{
Reading RSMinerve result file
}
\details{
Use \code{\link{getChunkSize}} to retrieve the chunk size for the simulation resutls to read.
}
\examples{
\dontrun{
filepath <- normalizePath(file.path("Tutorial01-results.dst"))
chunk_size <- getChunkSize(
  lubridate::as_datetime("02.09.2013 00:00:00",format = "\%d.\%m.\%Y \%H:\%M:\%S"),
  lubridate::as_datetime("09.09.2013 00:00:00", format = "\%d.\%m.\%Y \%H:\%M:\%S"),
  3600
)
result <- readResultDXT(filepath, chunk_size)
}
}
\seealso{
\code{\link{getChunkSize}}

Other RS Minerve IO: 
\code{\link{getChunkSize}()},
\code{\link{load_minerve_input_csv}()},
\code{\link{readDBCSV}()},
\code{\link{readForcingCSV}()},
\code{\link{readForcingSTR}()},
\code{\link{readRSMParameters}()},
\code{\link{readResultCSV}()},
\code{\link{readSelectionCHK}()},
\code{\link{translateCSVtoDST}()},
\code{\link{writeRSMParameters}()},
\code{\link{writeSelectionCHK}()}
}
\concept{RS Minerve IO}
