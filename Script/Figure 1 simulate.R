library(janitor)
library(tibble)
library(tidyverse)

simulated_data <-
  tibble(
    year = sample(1918:1919, 48, replace = TRUE),
    publication = runif(
      n = 48,
      min = 0,
      max = 6000
    ),
    month = rep(1:12, each = 4),
    region = rep(c("Northea Souths","Midwest","South","West"), each =12 )
  )
head(simulated_data)
