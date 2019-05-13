# For loops

x <- 100:200

x_sum <- 0
for(i in seq_along(x)) {
  x_sum <- x_sum + x[i]
}


# Map functions

library(tidyverse)

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
df

# Compute mean of each column

output <- vector("double", length(df))
for (i in seq_along(df)) {
  output[i] <- mean(df[[i]])
}
output

# Using purrr::map
map_dbl(df, mean)

df %>% map_dbl(median)
df %>% map_dbl(sd)

?map

mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(summary) %>%
  map("coefficients")
