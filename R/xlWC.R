#' Week commencing date
#'
#' Find the week commencing of a date, given a specific day as the start of week.
#'
#'
#' @param date Date value for which the week start date can be found.
#'   Default is \code{Sys.Date()}
#' @param pre_wk Integer for the number of weeks prior to the lookup date.
#'   Default is 0, no shifting of the week.
#' @param wk_start Integer, possible values are 1 - 7, correspnoding to Monday to Sunday as
#'   the start of the week. Default is 1 for Monday.
#'
#' @examples
#' # Get the close Monday before today
#' xlWC()
#'
#' # Get the Sunday before 2 weeks prior to 1st Jan 2017
#' xlWC(as.Date('2017-01-01'), pre_wk = 2, wk_start = 7)
#'
#'
#' @export
xlWC <- function(date = Sys.Date(), pre_wk = 0, wk_start = 1) {
  weekday <- date %>% as.POSIXlt %>% '$'(wday)
  weekday[weekday == 0] <- 7
  weekday <- (weekday - wk_start) %% 7
  return(date - weekday - pre_wk * 7)
}