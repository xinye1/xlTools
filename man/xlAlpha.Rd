% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xlAlpha.R
\name{xlAlpha}
\alias{xlAlpha}
\title{Hexadecimal colour opacity.}
\usage{
xlAlpha(x)
}
\arguments{
\item{x}{a vector of numeric double in range \code{[0, 1]}, representing
the percentage of opacity.}
}
\value{
A vector of the same length, 2-character string representing the
hexadecimal value.
}
\description{
Returns the hexadecimal values of numeric opacity.
}
\details{
This is a function based on HTML colour opacity. Opacity is the hex value
for RGB values in range \code{[0, 255]},mapped from range \code{[0, 1]}
as 'x\% opaque'.
}
\examples{
xlAlpha(c(0.3, 0.9, 0.5))

\dontrun{xlAlpha(2)}

}
