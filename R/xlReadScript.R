#' xlReadScript
#'
#' Read standalone script into R as a single character string.
#'
#' The funtion calls \code{\link{readLines}} to read in the script text file,
#' strips out comments blocks, inline comments, and merge all lines into
#' one single string. As it stands, it works best for a fairly simple
#' SQL script. I will be albe to expand the functionality once
#' I'm exposed to more complex script. This function is suitable for reading
#' script that does not use line-by-line execution, but rather entirely
#' relies on keywords, e.g. SQL.
#'
#' @param script A \code{\link{connections}} object or a character string,
#' exactly the same input expected by \code{\link{readLines}} function.
#' @param cmt_sym The character sequence that signifies comment
#' strings, default \code{'--'} for SQL.
#' @param ... passed to \code{\link{readLines}}.
#'
#' @examples
#' \dontrun{
#' # postgres
#' tbl(db, sql(xlReadScript('~/Script/script1.sql')))
#'
#' # MS SQL Server
#' sqlQuery(conn, xlReadScript('~/Script/script2.sql'))
#' }
#'
#' @import dplyr
#' @export
xlReadScript <- function(script, cmt_sym = '--', ...) {
  raw_scpt <- readLines(script, ...) %>%
    gsub('^\\s+|\\s+$', '', .)
  scpt <- subset(
    raw_scpt, substr(raw_scpt, 1, length(cmt_sym)) != cmt_sym)
  out <- subset(scpt, nchar(scpt) >= 1) %>%
    sapply(function(x) {
      if (grepl(cmt_sym, x) == T) {
        substr(x, 1, regexpr(cmt_sym, x) - 1)
      } else x}) %>% unname %>%
    paste0(collapse = ' ')
  return(out)
}
