#' Colour Palettes
#'
#' These functions return various colour palettes I have collected over time from
#' places including companies I have worked for.
#'
#' @details To do: how to use.
#'
#' Currently the available palettes are as follow:
#'
#'
#'
#' @param cols character or numeric vector for the names or the indices of colours
#' in the palette specified by \code{palette}.
#' @param palette a string, the colour palette name.
#' @param alpha a number between \code{[0, 1]} for the opacity, 0 being opac.
#' @param ... parameters passed to either \code{\link{rgb}} (for \code{xlRgbtoHex})
#' or \code{\link{img}} (for \code{xlColPalDisp}).
#'
#' @references
#' Wipro colours are taken from
#' the \href{https://wipro365-my.sharepoint.com/personal/scshekar_wipro_com/Documents/Analytics%20-%20Overview%20-%202017.pptx?web=1}{
#' internal template}
#'
#'
#'
#' @examples
#' xlColPal()
#' xlColPal(c(1, 2, 3))
#' xlColPal(c('red', 'cyan', 'grey'))
#' xlColPal(rep(c(1, 2), 3)) # repeats are allowed
#'
#' \dontrun{
#' # What not to do:
#' xlColPal(c(1, 2, 3), palette = 'wrong') # error, wrong palette name
#' xlColPal(c(356, 6))                     # error, as 356 is outside of 1:10
#' xlColPal(c(1, 'cyan', 'grey'))          # error, mixed cols element types
#' xlColPal(c('1'))                        # error, numeric should not be quoted
#' }



xlRgbtoHex <- function(rgb_list, max_col_val = 255, col_names = names(rgb_list), ...) {

  rgb_df <- as.data.frame(t(data.frame(
    rgb_list,
    row.names = c("red", "green", "blue"))))

  rgb(rgb_df, maxColorValue = max_col_val, names = col_names, ...)

}

#' @export

xlColPal <- function(cols = NULL, palette = "wipro", alpha = 1) {

  if (!palette %in% names(xlPalettes)) {
    bad_pal <- paste(names(xlPalettes), collapse = ', ')
    stop("Wrong palette name. Available palettes are: ", bad_pal)
  }

  pal_name <- switch(
    palette,
    "ee" = "ee_hex_cols",
    "wipro" = "wipro_rgb_cols",
    "wipro_rgb_cols"
  )

  if (grepl("_rgb_", pal_name)) {
    all_cols <- xlRgbtoHex(xlPalettes[[palette]], alpha = round(alpha * 255))
  } else if (grepl("_hex_", pal_name)) {
    all_cols <- paste0(xlPalettes[[palette]], as.hexmode(round(alpha * 255)))
    names(all_cols) <- names(xlPalettes[[palette]])
  }

  if (is.null(cols)) {
    cols <- names(all_cols)
  }

  if (any(sapply(cols, function(x) {
    !x %in% c(seq_along(all_cols), names(all_cols))
  }))) {
    stop("For the palette ", pal_name,
      ", cols should be a vector in either 1:", length(all_cols),
      ", or in the following names: ",
      paste(names(all_cols), collapse = ', '))
  }

  all_cols[cols]

}



#' @export


xlColPalDisp <- function(cols = NULL, palette = "wipro", ...) {

  if (!palette %in% names(xlPalettes)) {
    stop("The palette name is not valid for xlColPal.")
  }

  pal <- xlColPal(cols, palette)
  n <- length(pal)

  image(1:n, 1, as.matrix(1:n), col = pal,
        xlab = paste0("Palette name: ", palette),
        xaxt = "n", yaxt = "n",
        ylab = "", bty = "n",
        ...)
  axis(side = 1, tick = F, at = 1:n, labels = names(pal))
}

