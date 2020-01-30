# Description

# Author: David Lang
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(janitor)
# Parameters
infile<-"./data-raw/cities.csv"

raw_vars<-cols_only(
  GEOID = col_character(),
  year = col_double(),
  name = col_character(),
  evictions = col_double()
)
outfile<-"./data/cities.rds"
#===============================================================================
#https://data-downloads.evictionlab.org/
df<-
  read_csv(infile,col_types = raw_vars) %>%
  clean_names() %>%
  write_rds(outfile)
