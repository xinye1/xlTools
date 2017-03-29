#' Database connection commands
#'
#' These functions standardlise various database connection methods
#' and use a fairly uniform way to create connection objects which
#' can then be used in subsequent SQL queries.
#'
#' @rdname xlConnDB
#' @param u Username of the database credentials.
#' @param pw Password of the database credentials.
#' @param db The name of the database.
#' @param server The server name or host name (in the case of AWS RedShift).
#' @param instance The instance of the connection, suitable for a SQL Server.
#' @param port The port for the database.
#' @param trusted Logical input, instructing the connection to use the operating
#' system's credientials if \code{TRUE}, in which case no value is needed
#' for either \code{u} or \code{pw}.
#' @param ... Any additional arguments passed to respective function.
#'
#' @return \code{xlConnPostgres} returns a postgres source object \code{src} from
#'   \code{\link{src_postgres}}, to be used in table references like this one:
#'   \code{tbl(src, sql('<sql_query>'))}.
#'   \code{xlConnSQLServ} passes arguments to \code{\link{odbcDriverConnect}},
#'   which returns the \code{RODBC} object \code{conn} to be used in a function such as
#'   \code{sqlQuery(cnn, '<sql_query>')}.
#'
#' @examples
#' \dontrun{
#' src <- xlConnPostgres(u, pw, db, server, port)
#' sample_table <- tbl(src, sql('select top 100 * from table1'))
#' }
#'
#'
#' @export
xlConnPostgres <- function(u, pw, db, server, port, ...) {
  return(
    dplyr::src_postgres(
      db, host = server,
      host = 'regus-cube.cwcclxyklvva.eu-west-1.redshift.amazonaws.com',
      port = port,
      user = u,
      password = pw, ...))
}


#' @rdname xlConnDB
#' @examples
#' \dontrun{
#' conn <- xlConnSQLServ(db, server, instance)
#' sqlQuery(conn, 'select * from information_schema.tables')
#' }
#' @export
xlConnSQLServ <- function(u = NULL, pw = NULL, db, server, instance, trusted = T, ...) {
  cred <- ifelse(trusted == T,
                 ';trusted_connection=true',
                 paste0(';uid=', u, ';pwd=', pw))
  return(
    RODBC::odbcDriverConnect(
      paste0(
        'driver={SQL Server};server=', server, '\\', instance,
        ';database=', db, cred), ...))
}

