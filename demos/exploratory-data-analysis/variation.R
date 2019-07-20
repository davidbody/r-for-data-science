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
  geom_histogram(aes(x = carat), binwidth = 0.5, boundary = 0)

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

# Empirical cumulative distribution functions (ECDF)

# Consider normal distribution

df <- tibble(x = seq(-4, 4, length.out = 200), df = dnorm(x)) %>%
  ggplot(aes(x, df)) +
  geom_line()

cdf <- tibble(x = seq(-4, 4, length.out = 200), cdf = pnorm(x)) %>%
  ggplot(aes(x, cdf)) +
  geom_line()

gridExtra::grid.arrange(df, cdf, ncol = 1)

# ECDF

diamonds %>%
  ggplot(aes(carat)) +
  geom_line(stat = "ecdf")
