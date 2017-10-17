#' Capitalising words
#'
#' A sophisticated version of word capitalisation
#'
#' @param s the string to convert.
#' @param strict logical, if \code{True} then all words will have only
#' the first letter capitalised and others in lower cases.
#'
#' @export
xlCap <- function(s, strict = FALSE) {
  cap <- function(s) paste(toupper(substring(s, 1, 1)),
                           {s <- substring(s, 2); if(strict) tolower(s) else s},
                           sep = "", collapse = " " )
  sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}
