# Description

# Author: David Lang
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(ussf)
library(sf)
# Parameters

city<-here::here("./data/cities.rds")
geojson<-here::here("./data/cities.geojson.rds")
#===============================================================================

city_df<-read_rds(city) %>% filter(year==2006)
setdiff(city_df$geoid,geojson_df$geoid)
geojson_df<-read_rds(geojson)
joined_df<- geojson_df %>% left_join(city_df,by = "geoid")
