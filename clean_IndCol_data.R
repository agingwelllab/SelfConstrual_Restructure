# Clean IndCol data
# 9.21.21 SP

# load required packages
library(tidyverse)

# load source functions
source('/Users/ssp160230/github_directory/IndCol_Restructure/src/IndCol_functions.R')

# set hard-coded variables 
ic_raw <- read_csv('/Users/ssp160230/github_directory/IndCol_Restructure/data/IndCol_data.csv')

# intermediate clean dfs
ic_clean <- icclean(ic_raw)

# intermediate mean df
ic_mean <- icmean(ic_clean)

# write csv for clean df
write.csv(
  ic_clean, 
  "/Users/ssp160230/github_directory/IndCol_Restructure/output/IndCol_clean.csv", 
  row.names = FALSE
)

# write csv for octant df
write.csv(
  ic_mean, 
  "/Users/ssp160230/github_directory/IndCol_Restructure/output/IndCol_mean.csv", 
  row.names = FALSE
)

