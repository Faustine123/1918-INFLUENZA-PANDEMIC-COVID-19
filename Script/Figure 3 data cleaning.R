
#############Figure 3 ###########
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
raw_data_fig3<-read_dta(here::here("Input/Data/fig3_raw_data.dta"))

### Clean data ###
cleaned_figure3_data <-
  raw_data_fig3 |>
  # Select only certain columns
  select(
    flu_sep1_1918_dec31_1919,
    year,
    month,
    region
  )
# Rename column
cleaned_figure3_data <-
  cleaned_figure3_data |>
  rename(
    influence = flu_sep1_1918_dec31_1919
  )
# Group by year, month, and region
cleaned_figure3_data<- cleaned_figure3_data %>%
  group_by(year, month, region) %>%
  summarize(total_influence = sum(influence)) %>%
  ungroup()
# Create a new column to store date in month.year format
cleaned_figure3_data$date_label <- format(as.Date(paste(cleaned_figure3_data$year, cleaned_figure3_data$month, "01", sep = "-")), "%b.%Y")
cleaned_figure3_data$date_label <- factor(cleaned_figure3_data$date_label, levels = unique(cleaned_figure3_data$date_label))
# Change the region name
cleaned_figure3_data <- cleaned_figure3_data %>%
  mutate(region = case_when(
    region == 1 ~ "Northeast",
    region == 2 ~ "Midwest",
    region == 3 ~ "South",
    region == 4 ~ "West"
  ))
# Store cleaned data for figure 3
write.csv(cleaned_figure3_data, file = here::here("Output/Data/cleaned_figure3_data.csv"), row.names = FALSE)