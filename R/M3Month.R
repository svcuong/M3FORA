#' M3-Competition monthly data
#'
#' The monthly time series from the M3 forecasting competition.
#'
#' @format M3 is a list of  2 data.frames of 1428 monthly time series from M3-Competition.
#'
#' First list element is the data.frame with the following structure:
#' \describe{
#'   \item{series}{Name of the series}
#'   \item{category}{The category of series. Possible values for M3 are "DEMOGRAPHIC", "FINANCE", "INDUSTRY",
#'             "MACRO", "MICRO", "OTHER".}
#'   \item{value}{A time series (the historical data(training data) + the future data (test data))}
#'   \item{timesatmp}{The timestamp of series (monthly period)}
#' }
#'
#' Second list element is the data.frame with the following structure:
#' \describe{
#'   \item{serie}{Name of the series}
#'   \item{category}{The category of series. Possible values for M3 are "DEMOGRAPHIC", "FINANCE", "INDUSTRY",
#'             "MACRO", "MICRO", "OTHER".}
#'   \item{actual}{The future data (test data) or actual values of each time series from M3-Competition monthly data}
#'   \item{method}{The forecasting methods for each time series from M3-Competition monthly data}
#'   \item{forecast}{The forecast values of future from difference forecasting methods for each time series from M3-Competition monthly data}
#'   \item{horizon}{The forecast horizons for each time series from M3-Competition monthly data}
#'   \item{timesatmp}{The timestamp of series (monthly period)}
#' }
#' @author Andrey Davydenko, Maxim and Sai Van Cuong from Volgograd State Technical University
#' @seealso \code{\link{plot.ts}}
#' @source
#' \url{https://github.com/svcuonghvktqs/M3FORA}.
#'
#' @keywords datasets
#' @examples
#'
#' M3Month[[1]][1:5,]
#' M3Month[[2]][1:5,]
#' subset(M3Month[[1]], series == "M1")
#' subset(M3Month[[2]], method == "HOLT")
#' plot.ts(M3Month, series_id = "M1")
"M3Month"
