#### Preamble ####
# Purpose: Simulates the figure 3 (Regional Patterns of Influenza Newspaper Coverage) raw data
# Author: Randall Ni, Myra Li, Faustine Fan
# Data: 22 February 2023
# Contact: myra.li@mail.utoronto.ca

library(janitor)
library(tibble)
library(tidyverse)

month_year <- seq(as.Date("1918-09-01"), as.Date("1919-11-01"), by = "month")

# format the dates as "month.year"
date <- format(month_year, "%b.%Y")

simulated_data_3 <- tibble(
  rep(date,4),
  region = c(
    rep("Notheast", 15),
    rep("Midwest", 15),
    rep("South", 15),
    rep("West", 15)
  ),
  death = runif(
    n = 60,
    min = 0,
    max = 200000))

head(simulated_data_3)
