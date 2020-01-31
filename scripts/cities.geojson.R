# Description

# Author: David
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(ussf)
library(sf)
names(df)
# Parameters

#Data Directory
link <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"
infile <- here::here("data-raw/cities.geojson")
outfile <- here::here("data/cities.geojson.rds")

#Variable Names
vars <- c("geoid", "n", "geometry")
new_vars <- c(geoid = "geoid", city_name = "n", geometry = "geometry")
# ===============================================================================
#* Creates a tibble with three columns: city ID, city name, and geometry.
#* Renames any columns that require renaming.
#
download.file(link, infile)

df <- sf::read_sf(infile) %>%
  clean_names() %>%
  select(!!!new_vars) %>%
  write_rds(df, outfile)
