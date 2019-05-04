library(ggplot2)

# Boxplots and jittered plots

p <- ggplot(mpg, aes(drv, hwy))

p + geom_point()

p + geom_jitter()

p + geom_boxplot()

p + geom_violin()

# Histograms and frequency polygons

p <- ggplot(mpg, aes(hwy))

p + geom_histogram()

p + geom_freqpoly()

p + geom_freqpoly(binwidth = 2.5)

p + geom_freqpoly(binwidth = 1)

# Compare distributions of subgroups

ggplot(mpg, aes(displ, color = drv)) + 
  geom_freqpoly(binwidth = 0.5)

ggplot(mpg, aes(displ, fill = drv)) + 
  geom_histogram(binwidth = 0.5) +
  facet_wrap(~drv, ncol = 1)

# Other geoms

df <- data.frame(
  x = c(3, 1, 5),
  y = c(2, 4, 6),
  label = c("a","b","c")
)

p <- ggplot(df, aes(x, y, label = label))

p + geom_point() + ggtitle("point")

p + geom_text() + ggtitle("text")

p + geom_bar(stat = "identity") + ggtitle("bar")

p + geom_line() + ggtitle("line")

p + geom_area() + ggtitle("area")

p + geom_path() + ggtitle("path")

p + geom_step() + ggtitle("step")

p + geom_polygon() + ggtitle("polygon")
