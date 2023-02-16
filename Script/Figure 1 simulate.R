library(janitor)
library(tibble)
library(tidyverse)

simulated_data <-
  tibble(
     mortality = runif(
      n = 30,
      min = 0,
      max = 1.6
    ),
    gender = rep(c("female","male"), each = 15),
    age_group = rep(c("0-4","5-9","10-14","15-19","20-24","25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74"), each =2 )
  )
head(simulated_data)
tail(simulated_data)