library(tidyverse)

diamonds
?diamonds

# Cut is categorical (ordered factor)

diamonds %>%
  ggplot() +
  geom_bar(aes(x = cut))

diamonds %>%
  count(cut)

# note

diamonds %>%
  count(cut) %>%
  ggplot() +
  geom_col(aes(x = cut, y = n))

# Carat is continuous

diamonds %>%
  ggplot() +
  geom_histogram(aes(x = carat), binwidth = 0.5)

diamonds %>%
  count(cut_width(carat, 0.5))

# Always try various binwidths

diamonds %>%
  ggplot() +
  geom_histogram(aes(x = carat), binwidth = 1)

diamonds %>%
  ggplot() +
  geom_histogram(aes(x = carat), binwidth = 0.1)

diamonds %>%
  ggplot() +
  geom_histogram(aes(x = carat), binwidth = 0.01)
