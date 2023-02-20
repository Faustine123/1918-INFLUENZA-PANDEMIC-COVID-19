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