#### Preamble ####
# Purpose: Simulates the figure 5 (Stock Market Indices by year in London and U.S.) raw data
# Author: Randall Ni, Myra Li, Faustine Fan
# Data: 22 February 2023
# Contact: randall.ni@mail.utoronto.ca/myra.li@mail.utoronto.ca/yx.fan@mail.utoronto.ca

library(janitor)
library(tibble)
library(tidyverse)

month_year <- seq(as.Date("1915-01-01"), as.Date("1924-01-01"), by = "month")

# format the dates as "month.year"
date <- format(month_year, "%b.%Y")

simulated_data_5 <- tibble(
  rep(date,2),
  stock_market = c(
    rep("US",109),
    rep("London",109)),
  price = runif(
    n = 218,
    min = 75,
    max = 200
  )
)
head(simulated_data_5)  