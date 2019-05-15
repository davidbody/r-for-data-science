library(tidyverse)
library(lubridate)

load("demos/data-visualization-with-ggplot2/sales_data.RData")

sales_data %>%
  ggplot(aes(quantity, price)) +
  geom_point() +
  geom_smooth(method = "lm")

sales_data %>%
  ggplot(aes(quantity, price, color = location)) +
  geom_point()

sales_data %>%
  ggplot(aes(quantity, price)) +
  geom_point() +
  facet_wrap(~ location)

sales_data %>%
  ggplot(aes(quantity, price)) +
  geom_point() +
  facet_wrap(~ location) +
  geom_smooth(method = "lm")

sales_data %>%
  filter(location == "Noblesville") %>%
  ggplot(aes(quantity, price)) +
  geom_point() +
  facet_wrap(~ year(date)) +
  geom_smooth(method = "lm")

sales_data %>%
  mutate(year = year(date)) %>%
  filter(year < 2019) %>%
  ggplot(aes(quantity, price)) +
  geom_point(alpha = 0.5) +
  facet_wrap(~ location) +
  geom_smooth(method = "lm") +
  theme_minimal() +
  labs(title = "Lebowski Bowling Ball sales by location",
       subtitle = "2010-2018",
       x = "Quantity Sold",
       y = "Price") +
  scale_y_continuous(labels = scales::dollar)

sales_data %>%
  mutate(year = year(date)) %>%
  filter(location == "Noblesville", year < 2019) %>%
  ggplot(aes(quantity, price)) +
  geom_point(alpha = 0.5) +
  facet_wrap(~ year) +
  geom_smooth(method = "lm") +
  theme_minimal() +
  labs(title = "Lebowski Bowling Ball Noblesville sales by year",
       subtitle = "2010-2018",
       x = "Quantity Sold",
       y = "Price") +
  scale_x_continuous(breaks = c(2000, 2500, 3000, 3500)) +
  scale_y_continuous(labels = scales::dollar)
