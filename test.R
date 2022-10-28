## Golf Model
library(dplyr)

#Load in datasets
stats_2022 <- read.csv('https://feeds.datagolf.com/historical-raw-data/rounds?tour=pga&event_id=all&year=2022&file_format=csv&key=4cf8d83a16f51050d42f57f7180e')
stats_2021 <- read.csv('https://feeds.datagolf.com/historical-raw-data/rounds?tour=pga&event_id=all&year=2021&file_format=csv&key=4cf8d83a16f51050d42f57f7180e')
stats_2020 <- read.csv('https://feeds.datagolf.com/historical-raw-data/rounds?tour=pga&event_id=all&year=2020&file_format=csv&key=4cf8d83a16f51050d42f57f7180e')

#combine datasets
stats_2020_2022 <- stats_2022 %>% 
  full_join(stats_2021) %>% 
  full_join(stats_2020)

#add in column of end dates as date (allows for subtraction)
stats_with_date <- stats_2020_2022 %>%
  mutate(tournament_end_as_date = as.Date(event_completed))

str(stats_with_date)             

print(stats_with_date$tournament_end_as_date[1000])

test_var <- as.numeric(stats_with_date$tournament_end_as_date[1000] - stats_with_date$tournament_end_as_date[1])

current_date <- Sys.Date()
date_diff <- as.numeric(current_date - stats_with_date$tournament_end_as_date[1])

stats_with_date_and_datediff <- stats_with_date %>%
  mutate(days_ago = as.numeric(current_date - tournament_end_as_date))
