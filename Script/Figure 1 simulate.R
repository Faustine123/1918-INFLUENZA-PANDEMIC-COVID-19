#### Preamble ####
# Purpose: Simulates the figure 1 (Median Excess Mortality Rate by Age and Sex in 13 Countries) raw data
# Author: Randall Ni, Myra Li, Faustine Fan
# Data: 22 February 2023
# Contact: myra.li@mail.utoronto.ca

library(janitor)
library(tibble)
library(tidyverse)

simulated_data_1 <-
  tibble(
    gender = c(
      rep("female", 15),
      rep("male", 15)
    ),
    age_group = rep(c("0-4","5-9","10-14","15-19","20-24","25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74"),2 ),
     mortality = runif(
      n = 30,
      min = 0,
      max = 1.6
    ))

head(simulated_data_1)