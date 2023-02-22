
###########Figure 1 ##########
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
raw_data_fig1<-read_excel(here::here("Input/Data/fig1_raw_data.xlsx"))

### Data clean ###
process_data_fig1 <- raw_data_fig1 %>% 
  pivot_longer(
    cols = c("female", "male"), 
    names_to = "gender", 
    values_to = "mortality_rate"
  )
cleaned_figure1_data <- process_data_fig1[, c(1, 3, 2)]
# Make sure the order of the age group is the order we wanted
age_cat_order <- c("0 to 4", "5 to 9", "10 to 14", "15 to 19", "20 to 24", "25 to 29",
                   "30 to 34", "35 to 39", "40 to 44", "45 to 49", "50 to 54", "55 to 59"
                   , "60 to 64", "65 to 69", "70 to 74")
cleaned_figure1_data$age_cat <- 
  factor(cleaned_figure1_data$age_cat, 
         levels = age_cat_order)
# Rename the column
cleaned_figure1_data <-
  cleaned_figure1_data |>
  rename(
    Gender = gender
  )
# Replace "female" with "Female" and "male" with "Male"
cleaned_figure1_data$Gender <- 
  ifelse(cleaned_figure1_data$Gender == "female", "Female", "Male")
# Store cleaned data
write.csv(cleaned_figure1_data, file = here::here("Output/Data/cleaned_figure1_data.csv"), row.names = FALSE)