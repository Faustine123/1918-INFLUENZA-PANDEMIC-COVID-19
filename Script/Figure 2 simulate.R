#### Preamble ####
# Purpose: Simulates the figure 2 (Covid-19 Death by Age in United States) raw data
# Author: Randall Ni, Myra Li, Faustine Fan
# Data: 22 February 2023
# Contact: randall.ni@mail.utoronto.ca/myra.li@mail.utoronto.ca/yx.fan@mail.utoronto.ca

library(janitor)
library(tibble)
library(tidyverse)

simulated_data_2 <-
  tibble(
    gender = c(
      rep("female", 11),
      rep("male", 11)
    ),
    age_group = rep(c("Under 1 year", "1-4 years", "5-14 years", "15-24 years", "25-34 years", "35-44 years",
                      "45-54 years", "55-64 years", "65-74 years", "75-84 years", "85 years and over"),2 ),
    death = runif(
      n = 22,
      min = 0,
      max = 200000
    ))

head(simulated_data_2)