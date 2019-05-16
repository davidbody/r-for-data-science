library(tidyverse)

data("anscombe")
head(anscombe)

anscombe %>%
  summarize_all(c("mean", "sd"))

round(map_dbl(anscombe, mean), digits = 2)

anscombe %>%
  map_dbl(sd) %>%
  round(digits = 2)

lm(y1 ~ x1, data = anscombe)
lm(y2 ~ x2, data = anscombe)
lm(y3 ~ x3, data = anscombe)
lm(y4 ~ x4, data = anscombe)

# cs <- coef(lm(y1 ~ x1, anscombe))
cs <- c(3.0, 0.5)
cs

ggplot() + geom_abline(intercept = cs[1], slope = cs[2]) +
  scale_x_continuous(limits = c(0, 15)) +
  scale_y_continuous(limits = c(0, 10))

anscombe_tidy <- anscombe %>%
  rowid_to_column() %>%
  gather(key, value, -rowid) %>%
  separate(key, c("variable", "set"), 1, convert = TRUE) %>%
  spread(variable, value)

head(anscombe_tidy)

anscombe_tidy %>%
  ggplot(aes(x, y)) +
  geom_point() +
  facet_wrap(~ set) +
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)

ds <- read_csv("demos/exploratory-data-analysis/Datasaurus_data.csv", col_names = c("x", "y"))
summary(ds)
summary(lm(y ~ x, ds))

ds %>%
  ggplot(aes(x)) +
  geom_histogram()

ds %>%
  ggplot(aes(y)) +
  geom_histogram()

p <- ds %>%
  ggplot(aes(x, y)) +
  geom_point()
p

p + geom_smooth(method = "lm", se = FALSE)
