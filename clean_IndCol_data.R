# Clean IndCol data
# 9.28.21 SP

# load required packages
library(tidyverse)
library(here)

# load source functions
source(here::here('src', 'IndCol_functions.R'))

# set hard-coded variables

# load data
ic_raw <- read_csv(here::here('data', 'IndCol_data.csv'))

# clean and reformat raw df
ic_clean <- icclean(ic_raw)

# calculate mean scores for each subscale
ic_mean <- icmean(ic_clean)