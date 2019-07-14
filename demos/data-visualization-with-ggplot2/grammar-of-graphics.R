library(ggplot2)

mpg

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg,
       mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

ggplot(mpg, aes(displ, hwy)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, shape = drv)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, size = cyl)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, color = class, shape = drv, size = cyl)) +
  geom_point()

p <- ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(vars(drv))
p

p + geom_smooth(method = "lm", se = FALSE)
