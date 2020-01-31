# Description
# Joins the cities and geojson data
# Author: David Lang
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(ussf)
library(sf)
# Parameters

#Data Directory
city <- here::here("data/cities.rds")
geojson <- here::here("data/cities.geojson.rds")
outfile <- here::here("data/joined.rds")
#Year
year_cat <- 2016
# ===============================================================================

city_df <- read_rds(city) %>% filter(year == year_cat)
setdiff(city_df$geoid, geojson_df$geoid)
geojson_df <- read_rds(geojson)
joined_df <- geojson_df %>%
  left_join(city_df, by = "geoid") %>%
  write_rds(outfile)
