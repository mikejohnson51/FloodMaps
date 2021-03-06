% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hand_tiles.R
\name{get_hand_raster}
\alias{get_hand_raster}
\title{Get HAND Raster for an AOI}
\usage{
get_hand_raster(
  locations,
  prj = NULL,
  expand = NULL,
  clip = c("tile", "bbox", "locations"),
  verbose = TRUE,
  neg_to_na = FALSE,
  override_size_check = FALSE,
  ...
)
}
\arguments{
\item{locations}{Either a \code{data.frame} of x (long) and y (lat), a
\code{sf}, or \code{raster} object as input.}

\item{prj}{A PROJ.4 string defining the projection of the locations argument.
If a \code{sp} or \code{raster} object is provided, the PROJ.4
string will be taken from that.  This argument is required for a
\code{data.frame} of locations."}

\item{expand}{A numeric value of a distance, in map units, used to expand the
bounding box that is used to fetch the terrain tiles. This can
be used for features that fall close to the edge of a tile and
additional area around the feature is desired. Default is NULL.}

\item{clip}{A character value used to determine clipping of returned HAND.
The default value is "tile" which returns the full tiles.  Other
options are "bbox" which returns the HAND clipped to the bounding
box of the original locations (or expanded bounding box if used),
or "locations" if the spatials data (e.g. polygons) in the input
locations should be used to clip the HAND. Locations are not used
to clip input point datasets.  Instead the bounding box is used.}

\item{verbose}{Toggles on and off the note about units and coordinate
reference system.}

\item{neg_to_na}{Some of the data sources return large negative numbers as
missing data.  When the end result is a projected those
large negative numbers can vary.  When set to TRUE, only
zero and positive values are returned.  Default is FALSE.}

\item{override_size_check}{Boolean to override size checks.  Any download
between 100 Mb and 500Mb report a message but
continue.  Between 500Mb and 3000Mb requires
interaction and greater than 3000Mb fails. These
can be overriden with this argument set to TRUE.}

\item{...}{Extra arguments to pass to \code{httr::GET} via a named vector,
\code{config}. See
\code{\link{download_tiles}} for more details.}
}
\value{
Function returns a \code{raster} object.
}
\description{
This function provides access to a Amazon Web Services HAND S3 Bucket.
The function accepts a \code{data.frame} of x (long) and y (lat),
a \code{sf}, or \code{raster} object as input.
A \code{raster} object is returned.
}
