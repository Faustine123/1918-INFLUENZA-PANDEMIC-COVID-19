library(tidyverse)

########Figure 1########
#test for mortality_rate
cleaned_figure1_data$mortality_rate |> min() >= 0
cleaned_figure1_data$mortality_rate |> max() <= 1.6

#test for length of age group
cleaned_figure1_data$age_cat |> 
  unique() |>
  length == 15


########Figure 2########
#test for year
cleaned_figure2_data$year |> min() == 1918
cleaned_figure2_data$year |> max() == 1919

#test for region
cleaned_figure2_data$region |>
  unique() == c(
    "Northe Souths",
    "Misdwest",
    "South",
    "West"
  )

########Figure 3########
#test for year
cleaned_figure3_data$year |> min() == 1900
cleaned_figure3_data$year |> max() == 1940

#test for life expectancy years
cleaned_figure3_data$lifeexpectancyyears |> min() >=25
cleaned_figure3_data$lifeexpectancyyears |> max() <=75


########Figure 4########
#test for adjusted price
cleaned_figure4_data$adjusted_price |> min() >= 75
cleaned_figure4_data$adjusted_price |> max() <= 81

#test for stock markets
cleaned_figure4_data$stock_market |>
  unique() |>
  length() == 2

