#### Preamble ####
# Purpose: Data cleaning for figure 4 (Period Life Expectancy by Year in 14 Countries) raw data
# Author: Randall Ni, Myra Li, Faustine Fan
# Data: 16 February 2023
# Contact: randall.ni@mail.utoronto.ca/myra.li@mail.utoronto.ca/yx.fan@mail.utoronto.ca

#############Figure 4 ###########
# Loading in relevant libraries
library(tidyverse)
library(dplyr, warn.conflicts = FALSE)
library(tidyr)
library(readxl)
library(data.table)
library(lubridate)
library(haven)
library(readxl)
library(ggplot2)
# Input raw data
raw_data_fig4<-read_dta(here::here("Input/Data/fig4_raw_data.dta"))

### Clean data ###
# Select only certain columns
cleaned_figure4_data <-
  raw_data_fig4 |>
  select(
    entity,
    year,
    lifeexpectancyyears
  )
cleaned_figure4_data <- cleaned_figure4_data %>%
  filter(year >= 1900, year <= 1940)
# Calculate the mean of life expectanacy years
calculate_mean<- cleaned_figure4_data %>%
  group_by(year) %>%
  summarize(average_life_expectancy = mean(lifeexpectancyyears)) %>%
  ungroup()
# Add lines for calculating average
add_number <- calculate_mean %>% 
  select(year) %>% 
  n_distinct()
added_data <- data.frame(
  year = rep(1900:1940, each = 1),
  entity = rep("average", add_number),
  lifeexpectancyyears = numeric(add_number)
)
# Combine table together
final_figure4_data <- rbind(cleaned_figure4_data, added_data)
# Replaced the average life expectancy years
final_figure4_data$lifeexpectancyyears[
  final_figure4_data$entity == "average"] <- 
  calculate_mean$average_life_expectancy[
    calculate_mean$year == final_figure4_data$year[
      final_figure4_data$entity == "average"]]
# Store cleaned data for figure 4
write.csv(final_figure4_data, file = here::here("Output/Data/cleaned_figure4_data.csv"), row.names = FALSE)