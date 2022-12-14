#' Reads climate and discharge data into a tibble.
#'
#' The data is in a csv file that can also be imported to RS Minerve to form a
#' database.
#'
#' @param filename Path to file with input data for RS Minerve.
#'
#' @return Returns a tibble of the same format as the inbuilt \code{data} in
#'   ChirchikRiverBasin with columns \code{date} (POSIXct), \code{basin} (char),
#'   \code{type} (char, T, P or Q), \code{unit} (char, C, mm/a or m3/s) and
#'   \code{value} (num). Data is in hourly (climate) to decadal (10 days) or
#'   monthly (discharge) time steps.
#' @note this function is being phased out and will disappear in future
#'   package releases. Please refer to the function \code{readDBCSV} instead.
#'
#' @examples
#' \dontrun{
#' load_minerve_input_csv("path_to_file.csv")
#' }
#'
#' @export
#' @family RS Minerve IO
#' @seealso \code{[readDBCSV]}

load_minerve_input_csv <- function(filename) {

  # Read Metadata from file, write column headers and determine column types.
  header <- readr::read_csv(filename, col_names = FALSE, skip = 0, n_max = 7)
  colnames(header) <- paste(header[1, ], header[5, ], header[7, ], sep = "|")
  colnames(header)[1] <- "date"
  Nsb <- dim(header)[2] - 1  # Number of sub-basins in data table
  coltypes <- paste("c", strrep("n", times = Nsb), sep = "")

  data <- readr::read_csv(filename, col_names = colnames(header), skip = 8,
                   col_types = coltypes)
  date_vec <- lubridate::as_datetime(data$date, format = "%d.%m.%Y %H:%M:%S")
  if (is.na(date_vec[1])) {
    date_vec <- lubridate::as_datetime(data$date, format = "%d.%m.%y %H:%M")
  }
  data$date <- date_vec

  # Reformat data table and drop superfluous rows
  data_long <- tidyr::pivot_longer(data, -date,
                                   names_to = c("basin", "type", "unit"),
                                   names_sep = "\\|", values_to = "value",
                                   values_drop_na = TRUE)

  return(data_long)

}
