library(janitor)
library(tibble)
library(tidyverse)

simulated_data <-
  tibble(
    year = sample(1900:1940, 120, replace = TRUE),
    life_expectancy_years = runif(
      n = 120,
      min = 25,
      max = 75
    ),
    entity = rep(c("Average","Denmark","Italy"), each =40 )
  )
head(simulated_data)
