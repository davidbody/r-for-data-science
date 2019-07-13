library(tidyverse)

# https://ourworldindata.org/income-inequality#how-are-the-incomes-of-the-rich-changing-relative-to-the-incomes-of-the-poor
household_income_raw <- read_csv("demos/data/real-disposable-household-income-indexed.csv",
                                 col_types = cols(
                                   Entity = col_character(),
                                   Code = col_character(),
                                   Year = col_integer(),
                                  .default = col_double()
                                 ))

household_income <- 
  household_income_raw %>%
  rename(Country = Entity) %>%
  gather(Decile, Index, matches("\\d+"))

household_income %>%
  filter(Country %in% c("United Kingdom", "United States")) %>%
  ggplot(aes(Year, Index, group = Decile, color = Decile)) +
  geom_point() +
  geom_line() +
  geom_hline(yintercept = 100, linetype = 3) +
  scale_x_continuous(breaks = c(1980, 1990, 2000, 2010)) +
  scale_y_continuous(breaks = c(90, 100, 120, 150, 180)) +
  facet_wrap(vars(Country)) +
  labs(title = "Growth of Real Disposable Household Income by Decile",
       subtitle = "Source: Our World in Data")
