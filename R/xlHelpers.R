#' Tiny helpers
#'
#' One Liner helper functions.
#'
#' These functions typically take various types of vectors and return
#' transformed vectors / strings with specific formats that are common
#' in day to day daa manipulations.
#'
#' @param date A date vector to be formated, default \code{Sys.Date()} for today's date.
#' @param date_format A format string for date, default \code{\%Y\%m\%d}
#'   yielding e.g. \code{20171231}.
#' @param num Numeric vector, to be transformed into string vector of various formats.
#' @param digits Integer for the number of digits after decimal places in \code{xlPct}
#'   function.
#' @param num_format Single length string for numerical conversion format
#'   in \code{xlPct} and \code{xlAddCommas}.
#' @param big.mark the symbol for separating digits, using \code{','} as the default.
#' @param preserve.width parameters for \code{xlAddCommas} for saving additional
#'   spaces for output string.
#' @param in_values A vector of any kind, to be transformed into a string separated by
#'   commas for an 'in statement' as part of a SQL query.
#' @param ... Additional arguments passed to \code{xlPct}, \code{xlAddCommas} etc..
#'
#' @examples
#' xlTxtDate()
#' xlPct(0.83)
#' xlAddCommas(93976)
#' xlSQLIn(c('Display', 'Organic'))
#'
#'
#' @rdname xlHelpers
#' @export
xlTxtDate <- function(date = Sys.Date(), date_format = '%Y%m%d') {
  return(format(Sys.Date(), format = date_format))
}


#' @rdname xlHelpers
#' @export
xlPct <- function(num, digits = 2, num_format = "f", ...) {
  paste0(formatC(100 * num, format = num_format, digits = digits, ...), "%")
}


#' @rdname xlHelpers
#' @export
xlAddCommas <- function(num, big.mark = ',', num_format = 'd', preserve.width = 'none', ...) {
  formatC(num, format = num_format, big.mark = big.mark, preserve.width = preserve.width, ...)
}

#' @rdname xlHelpers
#' @export
xlSQLIn <- function(in_values) {
  paste0("'", in_values, "'", collapse = ', ')
}
