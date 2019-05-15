library(tidyverse)

# Categorical and continous variable (cut and carat)

diamonds %>%
  ggplot(aes(x = carat, fill = cut)) +
  geom_histogram()

# better choice is geom_freqpoly

diamonds %>%
  ggplot(aes(x = carat, color = cut)) +
  geom_freqpoly()

# In this case, there groups are of very different sizes

diamonds %>%
  count(cut)

diamonds %>%
  ggplot() +
  geom_bar(aes(x = cut))

# One solution is density plots

diamonds %>%
  ggplot(aes(x = carat, y = ..density.., color = cut)) +
  geom_freqpoly()

# Alternative visualization: box plot

diamonds %>%
  ggplot(aes(x = cut, y = carat)) +
  geom_boxplot()

# Two categorical variables

# In the exercises earlier you made a plot of class vs drv that wasn't very useful.

mpg %>%
  ggplot(aes(class, drv)) +
  geom_point()

# We see the same thing with color and cut in the diamonds data

diamonds %>%
  ggplot(aes(color, cut)) +
  geom_point()

# One solution is geom_count()

diamonds %>%
  ggplot(aes(color, cut)) +
  geom_count()

# Another is geom_jitter() [add alpha]

diamonds %>%
  ggplot(aes(color, cut)) +
  geom_jitter(alpha = 0.1)

# Another is compute the counts ourselves and plot a heatmap

diamonds %>%
  count(color, cut)

diamonds %>%
  count(color, cut) %>%
  ggplot(aes(color, cut)) +
  geom_tile(aes(fill = n))

# Experiment with color palettes

library(RColorBrewer)
display.brewer.all()

colors = colorRampPalette(brewer.pal(9, "YlOrBr"))(50)

diamonds %>%
  count(color, cut) %>%
  ggplot(aes(color, cut)) +
  geom_tile(aes(fill = as_factor(n))) +
  scale_fill_manual(values = rev(colors))

diamonds %>%
  count(color, cut) %>%
  ggplot(aes(color, cut)) +
  geom_tile(aes(fill = n)) +
  scale_fill_continuous(low = "red", high = "yellow")


# Two continuous variables

# ordinary scatterplot, points are overplotted

diamonds %>%
  ggplot(aes(carat, price)) +
  geom_point()

# one solution is alpha transparency

diamonds %>%
  ggplot(aes(carat, price)) +
  geom_point(alpha = 1/100)

# Another solution is binning, like with histograms

diamonds %>%
  filter(carat < 3) %>%
  ggplot(aes(carat, price)) +
  geom_bin2d()

# Or we can manually bin one variable

diamonds %>%
  filter(carat < 3) %>%
  ggplot(aes(carat, price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.1)))

# again, with same number of points in each bin

diamonds %>%
  filter(carat < 3) %>%
  ggplot(aes(carat, price)) +
  geom_boxplot(aes(group = cut_number(carat, 20)))
