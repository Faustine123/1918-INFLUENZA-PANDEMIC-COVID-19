#### Preamble ####
# Purpose: Simulates the figure 4 (Period Life Expectancy by Year in 14 Countries) raw data
# Author: Randall Ni, Myra Li, Faustine Fan
# Data: 22 February 2023
# Contact: myra.li@mail.utoronto.ca/yx.fan@mail.utoronto.ca

library(janitor)
library(tibble)
library(tidyverse)

simulated_data_4 <-
  tibble(
    year = rep(seq(from = 1900, to = 1940, by = 1), 3),
    entity = c(
      rep("Average",41),
      rep("Denmark",41),
      rep("Italy",41)),
    life_expectancy_years = runif(
      n = 123,
      min = 25,
      max = 75
    )
)

head(simulated_data_4)