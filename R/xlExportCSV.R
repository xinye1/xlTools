#' Export multiple dataframes to local CSVs
#'
#' This function uses write.csv to export one or more dataframes to CSV file(s)
#' on the local drive.
#'
#' @param dfs A list of dataframes to be exported.
#' @param file_loc Single character string for the path to which the files are to be exported.
#' @param file_names Character vector, the file names to be saved.
#' @param suffix A character vector to append to the end of the file names (such as the current date),
#' @param ... passed to \code{\link{write.csv}}.
#'
#' @examples
#' \dontrun{
#' xlExportCSV(list(df1, df2), './output', c('table1', 'table2'))
#' }
#'
#'
#' @export
xlExportCSV <- function(dfs, file_loc, file_names, suffix = xlTxtDate(), ...) {
  for (i in seq_along(dfs)) {
    write.csv(
      dfs[[i]],
      paste0(file_loc, '/', file_names[[i]], '_',
             ifelse(is.null(suffix), '', suffix), '.csv'),
      row.names = F, ...)
  }
}
