#' Hexadecimal colour opacity.
#'
#' Returns the hexadecimal values of numeric opacity.
#'
#' This is a function based on HTML colour opacity. Opacity is the hex value
#' for RGB values in range \code{[0, 255]},mapped from range \code{[0, 1]}
#' as 'x\% opaque'.
#'
#'
#' @param x a vector of numeric double in range \code{[0, 1]}, representing
#'   the percentage of opacity.
#' @return A vector of the same length, 2-character string representing the
#' hexadecimal value.
#' @examples
#' xlAlpha(c(0.3, 0.9, 0.5))
#'
#' \dontrun{xlAlpha(2)}
#'
#' @export
xlAlpha <- function(x) {
    stopifnot(all(x > 0 & x < 1))
    x1 <- toupper(as.hexmode(round(x * 255)))
    unname(sapply(x1, function(i) {
        ifelse(nchar(i) == 1, paste0('0', i), i)}
    ))
}
