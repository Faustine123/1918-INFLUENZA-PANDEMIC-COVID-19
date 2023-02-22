#### Preamble ####
# Purpose: Data cleaning for figure 2 (Covid-19 Death by Age in United States) raw data
# Author: Randall Ni, Myra Li, Faustine Fan
# Data: 16 February 2023
# Contact: randall.ni@mail.utoronto.ca/myra.li@mail.utoronto.ca/yx.fan@mail.utoronto.ca

#############Figure 2 ###########
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
raw_data_fig2<-read.csv(here::here("Input/Data/fig2_raw_data.csv"))

### Clean data ###
cleaned_figure2_data <-
  raw_data_fig2 |>
  # Select only certain columns
  select(
    Group,
    State,
    Sex,
    Age.Group,
    COVID.19.Deaths
  )
# Remove the total and select the united states
cleaned_figure2_data <- 
  cleaned_figure2_data %>%
  filter(Group == "By Total")|>
  filter(Sex != "All Sexes")|>
  filter(Age.Group != "All Ages")|>
  filter(State == "United States")

# Remove the wrong age group
cleaned_figure2_data <- 
  cleaned_figure2_data %>%
  filter(Age.Group != "0-17 years")|>
  filter(Age.Group != "18-29 years")|>
  filter(Age.Group != "30-39 years")|>
  filter(Age.Group != "40-49 years")|>
  filter(Age.Group != "50-64 years")
# Make sure the order of the age group is the order we wanted
age_reorder <- c("Under 1 year", "1-4 years", "5-14 years", "15-24 years", "25-34 years", "35-44 years", "45-54 years", "55-64 years", "65-74 years", "75-84 years", "85 years and over")
cleaned_figure2_data$Age.Group <- 
  factor(cleaned_figure2_data$Age.Group, 
         levels = age_reorder)
#rename the column to keep consistent with figure 1
cleaned_figure2_data <-
  cleaned_figure2_data |>
  rename(
    Gender = Sex
  )
# Store cleaned data
write.csv(cleaned_figure2_data, file = here::here("Output/Data/cleaned_figure2_data.csv"), row.names = FALSE)