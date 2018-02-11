#' M3-Competition other data
#'
#' The other time series from the M3 forecasting competition.
#'
#' @format M3 is a list of  2 data.frames of 174 other time series from M3-Competition.
#'
#' First list element is the data.frame with the following structure:
#' \describe{
#'   \item{series}{Name of the series}
#'   \item{category}{The category of series. Possible values for M3 are "DEMOGRAPHIC", "FINANCE", "INDUSTRY",
#'             "MACRO", "MICRO", "OTHER".}
#'   \item{value}{A time series (the historical data(training data) + the future data (test data))}
#'   \item{timesatmp}{The timestamp of series (other period)}
#' }
#'
#' Second list element is the data.frame with the following structure:
#' \describe{
#'   \item{serie}{Name of the series}
#'   \item{category}{The category of series. Possible values for M3 are "DEMOGRAPHIC", "FINANCE", "INDUSTRY",
#'             "MACRO", "MICRO", "OTHER".}
#'   \item{actual}{The future data (test data) or actual values of each time series from M3-Competition other data}
#'   \item{method}{The forecasting methods for each time series from M3-Competition other data}
#'   \item{forecast}{The forecast values of future from difference forecasting methods for each time series from M3-Competition other data}
#'   \item{horizon}{The forecast horizons for each time series from M3-Competition other data}
#'   \item{timesatmp}{The timestamp of series (other period)}
#' }
#' @author Andrey Davydenko, Maxim and Sai Van Cuong from Volgograd State Technical University
#' @seealso \code{\link{plot.ts}}
#' @source
#' \url{https://github.com/svcuonghvktqs/M3FORA}.
#'
#' @keywords datasets
#' @examples
#'
#' M3Other[[1]][1:5,]
#' M3Other[[2]][1:5,]
#' subset(M3Other[[1]], series == "O1")
#' subset(M3Other[[2]], method == "HOLT")
#' plot.ts(M3Other, series_id = "O1")
"M3Other"
