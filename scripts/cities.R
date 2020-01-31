# Description

# Author: David Lang
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(janitor)
# Parameters


# Data Directories
link <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"
infile <- here::here("data-raw/cities.csv")
outfile <- here::here("data/cities.rds")

raw_vars <- cols_only(
  GEOID = col_character(),
  year = col_double(),
  name = col_character(),
  evictions = col_double()
)
# ===============================================================================
download.file(link, destfile = infile)
df <-
  read_csv(infile, col_types = raw_vars) %>%
  clean_names() %>%
  write_rds(outfile)
