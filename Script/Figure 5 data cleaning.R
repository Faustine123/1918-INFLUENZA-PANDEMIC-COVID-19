#### Preamble ####
# Purpose: Data cleaning for figure 5 (Stock Market Indices by year in London and U.S.)
# Author: Randall Ni, Myra Li, Faustine Fan
# Data: 16 February 2023
# Contact: randall.ni@mail.utoronto.ca/myra.li@mail.utoronto.ca/yx.fan@mail.utoronto.ca

#########Figure 5###########
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
raw_data_fig5_1<-read.table(here::here("output/data/processed_figure4_data/m110112.txt"))
raw_data_fig5_2<-read.table(here::here("output/data/processed_figure4_data/m11009b.dat2.txt"))

### Raw data preparation ###
# Add one column to show the stock market
raw_data_fig5_1$stock_market <- "London Stock Exchange"
raw_data_fig5_2$stock_market <- "U.S., Dow−Jones"
# Combine two txt files together
figure5_data <- rbind(raw_data_fig5_1, raw_data_fig5_2)
# Rename the column
colnames(figure5_data) <- c("year", "month", "price","stock_market")
# Rewrite the data
figure5_data$month_year <- paste(month.abb[figure5_data$month], figure5_data$year, sep=".")
# Set year range from 1915 to 1924
cleaned_figure5_data <- figure5_data %>%
  filter(between(month_year, "Jan.1915", "Jan.1924")) %>%
  # Select what we want
  select(
    price,
    stock_market,
    month_year
  )
# Calculate adjusted index
index1 <- cleaned_figure5_data[
  cleaned_figure5_data$stock_market == "London Stock Exchange" & cleaned_figure5_data$month_year == "Jan.1915",
  "price"
]
index2 <- cleaned_figure5_data[
  cleaned_figure5_data$stock_market == "U.S., Dow−Jones" & cleaned_figure5_data$month_year == "Jan.1915", 
  "price"
]
index1 <- as.numeric(index1)
index2 <- as.numeric(index2)
index_london <- 100/index1
index_us <- 100/index2
# Convert the column to numeric
cleaned_figure5_data$price <- as.numeric(cleaned_figure5_data$price)
# Adjusted price
cleaned_figure5_data$adjusted_price <- ifelse(
  cleaned_figure5_data$stock_market == "London Stock Exchange",
  cleaned_figure5_data$price * index_london,
  ifelse(cleaned_figure5_data$stock_market == "U.S., Dow−Jones",
         cleaned_figure5_data$price * index_us,
         cleaned_figure5_data$price))
# Store cleaned data for figure 5
write.csv(cleaned_figure5_data, file = here::here("Output/Data/cleaned_figure5_data.csv"), row.names = FALSE)