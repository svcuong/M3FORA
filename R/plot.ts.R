#' Plotting M Competition data with forecasts obtained from difference forecasting methods
#'
#' Functions to plot a time series from the M competition data sets, showing
#' both the training and test sections of the series with forecasts obtained from difference forecasting methods .
#'
#'
#' @aliases plot.xts
#' @param x The dataset of M-competition data in  list format as M3Year, M3Quart, M3Month and M3Other
#' @param si Name of a time series
#' @param method Name or vector of names of forecasting methods
#' @return \code{plot.ts} returns a dygraphs object. This function produces a time series plot
#' of the selected series with forecast obtained from difference forecasting methods.
#' @author Andrey Davydenko, Maxim and Sai Van Cuong from Volgograd State Technical University
#' @seealso \code{\link{M3Year}}, \code{\link{M3Quart}}, \code{\link{M3Month}}, \code{\link{M3Other}}, \code{\link{M3Arima}}
#' @keywords dygraphs objects
#' @examples
#' plot.ts(M3Year, si = "Y1")
#' plot.ts(M3Year, si = "Y1", method = c("HOLT", "SINGLE", "NAIVE2"))
#'
#' plot.ts(M3Quart, si = "Q4")
#' plot.ts(M3Quart, si = "Q4", method = c("HOLT", "SINGLE", "NAIVE2"))
#'
#' plot.ts(M3Month, si = "M598")
#' plot.ts(M3Month, si = "M598", method = c("HOLT", "SINGLE", "NAIVE2"))
#'
#' plot.ts(M3Other, si = "O15")
#' plot.ts(M3Other, si = "O15", method = c("HOLT", "SINGLE"))
#' plot.ts(M3Other, si = "O15", method = c("HOLT", "SINGLE", "NAIVE2"))
#'
#' @export
#' @export plot.xts

plot.xts <- function(x, si, method = NULL ){

# Extract data from x and create new data frames and xts objects

  # For time series data from M3-Competition
  M3TS <- subset(x[[1]], series_id == si)
  df.TS <- data.frame("Series" = M3TS$value)
  df.XTS <- xts::xts(df.TS, order.by=zoo::as.Date.yearmon(M3TS$timestamp))

  # For time series data from M3-Competition with forecasts from difference methods
  MF <- subset(x[[2]], series_id == si)
  time <- zoo::as.Date.yearmon(MF[1:length(unique(MF$horizon)),]$timestamp)
  out <-matrix(NA, nrow = length(unique(MF$horizon)), ncol = length(unique(MF$method)))
  df = data.frame(out)
  colnames(df) <- unique(MF$method)
  for(i in as.vector(unique(MF$method))){
    df[, i] <- subset(MF, method == i)$forecast
  }

  df2 <- cbind(df[method[1:length(method)]])
  # Create xts object from df2
  df2.xts <- xts::xts(df2, order.by=time)
  # Combine two objects df.XTS and  df2.xts by columns
  out <- cbind(df.XTS, df2.xts )
  # Plot out using dygraphs
  dygraphs::dygraph(out, main = "Time series with forecasts") %>%
    dygraphs::dyAxis("x", label = "Time") %>%
    dygraphs::dyAxis("y", label = "Value") %>%
    dygraphs::dyRangeSelector()
}
