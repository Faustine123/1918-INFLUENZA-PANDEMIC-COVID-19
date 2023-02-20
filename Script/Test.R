library(tidyverse)

########Input data ########
cleaned_figure1_data<-read.csv(here::here("output/data/cleaned_figure1_data.csv"))
cleaned_figure2_data<-read.csv(here::here("output/data/cleaned_figure2_data.csv"))
cleaned_figure3_data<-read.csv(here::here("output/data/cleaned_figure3_data.csv"))
cleaned_figure4_data<-read.csv(here::here("output/data/cleaned_figure4_data.csv"))
cleaned_figure5_data<-read.csv(here::here("output/data/cleaned_figure5_data.csv"))


########Figure 1########
#test for mortality_rate
cleaned_figure1_data$mortality_rate |> min() >= 0
cleaned_figure1_data$mortality_rate |> max() <= 1.6

#test for age group
cleaned_figure1_data$age_cat |> 
  unique() == c("0 to 4", "5 to 9", "10 to 14", "15 to 19", "20 to 24", "25 to 29",
"30 to 34", "35 to 39", "40 to 44", "45 to 49", "50 to 54", "55 to 59"
, "60 to 64", "65 to 69", "70 to 74")

#test for gender
cleaned_figure1_data$gender |> 
  unique() == c("female", "male")


########Figure 2########
#test for only united states
cleaned_figure2_data$State |>
  unique() == "United States"

#test for only total group
cleaned_figure2_data$Group |>
  unique() == "By Total"

#test for gender
cleaned_figure2_data$gender |> 
  unique() == c("Male", "Female")

#test for age group
cleaned_figure2_data$Age.Group |> 
  unique() == c("Under 1 year", "1-4 years", "5-14 years", "15-24 years", 
                "25-34 years", "35-44 years","45-54 years", "55-64 years", 
                "65-74 years", "75-84 years", "85 years and over")


########Figure 3########
#test for year
cleaned_figure3_data$year |> min() == 1918
cleaned_figure3_data$year |> max() == 1919

#test for name of region
cleaned_figure3_data$region |>
  unique() == c(
    "Northeast",
    "Midwest",
    "South",
    "West"
  )

#test for number of region
cleaned_figure3_data$region |>
  unique() |>
  length() == 4

#test for number of date_label
cleaned_figure3_data$date_label |>
  unique() |>
  length() == 16


########Figure 4########
#test for year
cleaned_figure4_data$year |> min() == 1900
cleaned_figure4_data$year |> max() == 1940

#test for life expectancy years
cleaned_figure4_data$lifeexpectancyyears |> min() >=25
cleaned_figure4_data$lifeexpectancyyears |> max() <=75


########Figure 5########
#test for number of stock markets
cleaned_figure5_data$stock_market |>
  unique() |>
  length() == 2

#test for name of stock markets
cleaned_figure5_data$stock_market |>
  unique() == c(
    "London Stock Exchange",
    "U.S., Dow−Jones"
  )

#test for number of month_year
cleaned_figure5_data$month_year |>
  unique() |>
  length() == 10