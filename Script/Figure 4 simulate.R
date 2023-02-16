library(janitor)
library(tibble)
library(tidyverse)

simulated_data <-
  tibble(
    price = runif(
      n = 240,
      min = 80,
      max = 200
    ),
    stock_market = rep(c("US","London"), each = 120),
    year = sample(1915:1924, 240, replace = TRUE),
    month = rep(1:12, each =20)
  )
head(simulated_data)
tail(simulated_data)