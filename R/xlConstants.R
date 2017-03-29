#' Coordinate Reference System objects
#'
#' Returns a CRS object for geo-spatial analysis.
#'
#' There are a few constants that are useful in geo-spatial analysis: CRS
#' such as \href{https://en.wikipedia.org/wiki/World_Geodetic_System}{World
#' Geodetic System (wgs84)} and \href{https://en.wikipedia.org/wiki/Ordnance_Survey_National_Grid}{
#' British National Grid (bng)}.
#'
#' @param system A string, either \code{wgs84} (default), \code{bng} or \code{google}.
#'
#' @return A CRS (coordinate reference system) object from calling \code{\link{CRS}}.
#'   So far the elements are the CRS objects
#' \code{wgs84}, \code{bng} and \code{google}. More will come as needed.
#'
#' @details Input \code{system} can be one of the below values:
#' \itemize{
#'   \item \code{wgs84}: \href{http://spatialreference.org/ref/epsg/4326/}{
#'   \code{EPSG:4326}}, WGS 84 aka the latest version of
#'   World Geodetic System (1984), with the generic latitude and
#'   longitude measured degrees.
#'   \item \code{bng}: \href{http://spatialreference.org/ref/epsg/27700/}{
#'   \code{EPSG:27700}}, British National Grid, with easting and
#'   northing measured in meters.
#'   \item \code{google}: \href{http://wiki.openstreetmap.org/wiki/EPSG:3857}{
#'   \code{EPSG:3857}}, the Web Mercator project, aka the Google
#'   projection. Sometimes the reference is also \code{EPSG:900913}. If it's
#'   not obvious, squint and look again. Still no? \code{900913} spells \code{Google}.
#'   }
#'
#' @references \url{http://spatialreference.org/ref/epsg/}.
#'
#'
#' @export
xlCRS <- function(system = 'wgs84') {
  sys = switch(system,
               wgs84 = 4326,
               bng = 27700,
               google = 3857)
    return(sp::CRS(paste0('+init=epsg:', sys)))
}


#' Actual radius of the earth
#'
#' This function calculates the radius of the earth at any latitude
#'
#' @param latitude numerical, the latitude in degrees.
#'
#' @return the Earth's radius in meters
#'
#' @source The numbers and equations are taken from
#' \href{http://en.wikipedia.org/wiki/Figure_of_the_Earth}{Wikipedia}
#'
#' @export
xlEarthRadius <- function(latitude) {
  # Radius (meter) of the earth, equatorial and polar
  r_eq = 6378137
  r_pol = 6356752.3142

  return(
    sqrt(((r_eq ^ 2 * cos(latitude)) ^ 2 + (r_pol ^ 2 * sin(latitude)) ^ 2) /
           ((r_eq * cos(latitude)) ^ 2 + (r_pol * sin(latitude)) ^ 2))
  )

}
