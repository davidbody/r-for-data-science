library(tidyverse)
library(lubridate)
library(readxl)

file_name <- "./demos/data-wrangling-with-dplyr/combined_sales.xlsx"

locations <- read_excel(file_name, sheet = "2016", n_max = 0) %>%
  names() %>%
  str_subset("^\\.{3}", negate = TRUE)

loc_index <- function(n) {
  floor((n-1)/2)
}

new_name <- function(columns) {
  num <- as.integer(str_extract(columns, "\\d+"))
  location <- locations[loc_index(num)]
  str_replace(columns, paste0("...", num), paste0("_", location))
}

data_2016 <- read_excel(file_name, sheet = "2016", skip = 1) %>%
  rename_at(vars(contains("...")), new_name)

step1 <- data_2016 %>%
  gather(-month, -day, key = "label", value = "value")

step2 <- step1 %>%
  separate(label, into = c("type", "location"), sep = "_")

step3 <- step2 %>%
  spread(key = "type", value = "value")

step3 %>%
  filter(!is.na(price) | !is.na(quantity)) %>%
  mutate(year = 2016, date = make_date(year, month, day)) %>%
  select(date, location, price, quantity)
