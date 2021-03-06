% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/src_gen.R
\name{get_catchmask}
\alias{get_catchmask}
\title{Get catchmask raster via nhdplusTools}
\usage{
get_catchmask(aoi, template)
}
\arguments{
\item{aoi}{An area of interest. Can be retrieved via \code{AOI::aoi_get}.}

\item{template}{A \code{raster} to template
the catchmask raster to.}
}
\value{
A \code{raster} representing the Catchmask
templated to \strong{template}.
}
\description{
Get catchmask raster via nhdplusTools
}
\keyword{internal}
