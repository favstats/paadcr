
<!-- README.md is generated from README.Rmd. Please edit that file -->

# paadcr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/paadcr)](https://CRAN.R-project.org/package=paadcr)
<!-- badges: end -->

The goal of paadcr is to provide access to the PAADCR API.

## Installation

You can install `paadcr` from GitHub with:

``` r
remotes::install_github("favstats/paadcr")
```

## Load library

This is a basic example which shows you how to solve a common problem:

``` r
library(paadcr)
## basic example code
```

## Authentication

First you need to authenticate. Have your username and password ready
and run this:

``` r
paadcr_auth()
```

## Usage

Get the raw json from every week.

``` r
## Get week 1 data
paadcr_week(1)

## week 2 data
paadcr_week(2)
```

Get parsed data as rectangular data frame with each row being one
timeline item:

``` r
paadcr_week(1, clean = T)
```

## Get all data

``` r
## create a vector with all weeks
1:2 %>% 
    map_dfr(~paadcr_week(.x, clean = T))
```
