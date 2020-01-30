# Description

# Author: David
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(ussf)
library(sf)
names(df)
# Parameters
infile <- "./data-raw/cities.geojson"
outfile <- "./data/cities.geojson.rds"
vars <- c("geoid", "n", "geometry")
new_vars <- c("geoid", "city_name", "geometry")
# ===============================================================================
#* Creates a tibble with three columns: city ID, city name, and geometry.
#* Renames any columns that require renaming.

#
df <- sf::read_sf(infile) %>%
  clean_names() %>%
  select(!!!vars)
names(df) <- new_vars

write_rds(df,outfile)
