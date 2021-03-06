
<!-- README.md is generated from README.Rmd. Please edit that file -->

# FloodMapping <img src="man/figures/logo.png" width=160 height = 120 align="right"/>

<!-- badges: start -->

[![Build
Status](https://travis-ci.org/mikejohnson51/FloodMapping.svg?branch=master)](https://travis-ci.org/mikejohnson51/FloodMapping)
[![DOI](https://zenodo.org/badge/130427796.svg)](https://zenodo.org/badge/latestdoi/130427796)
<!-- badges: end -->

The advent of the National Water Model and the development of the Height
Above Nearest Drainage products (HAND) offer the ability to map flood
extents for anywhere in the lower 48 United States. The challenges with
this methodology stem from the acquisition, management and application
of large scale data sets.

FloodMapper is designed to help users get the data they need, archive it
on their local machines, and then process flood extents. In executing
the steps in this process the first time the process in run the data is
collected and formatted - meaning it is slow. After the intital pass,
users can quickly generate flood maps for their region from real-time
National Water Model output and historic data (nwmTools), and can adjust
forecasted values to build pre-stages maps (adjust).

### Installation:

``` r
remotes::install_github("mikejohnson51/FloodMapping")
```

### Use case for Kansas

``` r
library(AOI)
library(leaflet)
library(stars)
library(leafem)
library(nwmTools)
library(FloodMapping)

raw.dir <-'/Users/mikejohnson/Desktop/test_nomads.tmp/'

AOI          <-  aoi_get("Lawrence, KS")
project.name <- "KU"

files <- getRawData(AOI, dir = raw.dir, project.name)

files$flows.path <- nwmTools::create_nwm_nc(type = "analysis_assim", num  = 1,
  dstfile = paste0(raw.dir, project.name, '/flows.nc'))
  

maps  = map_flood(
  hand.path      = files$hand.path,
  catchment.path = files$catch.path,
  flows.path     = files$flows.path,
  threshold = .1
)

leaflet() %>%
  addProviderTiles(providers$CartoDB.DarkMatter) %>%
  addStarsImage(st_as_stars(maps[[1]]), colors = blues9)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

------------------------------------------------------------------------

The HAND datasets are a product of:

Liu, Yan Y., David R. Maidment, David G. Tarboton, Xing Zheng, and
Shaowen Wang. 2018. A CyberGIS Integration and Computation Framework for
High-Resolution Continental-Scale Flood Inundation Mapping. Journal of
the American Water Resources Association (JAWRA). Accepted.

Liu, Yan Y., David R. Maidment, David G. Tarboton, Xing Zheng, Ahmet
Yildirim, Nazmus S. Sazib and Shaowen Wang. 2016. A CyberGIS Approach to
Generating High-resolution Height Above Nearest Drainage (HAND) Raster
for National Flood Mapping. The Third International Conference on
CyberGIS and Geospatial Data Science. July 26–28, 2016, Urbana,
Illinois. <http://dx.doi.org/10.13140/RG.2.2.24234.41925/1>

### Support:

Development is supported with funds from the UCAR COMET program; the
NOAA National Water Center; and the University of California, Santa
Barbara and is available under the MIT license
