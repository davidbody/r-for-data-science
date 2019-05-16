library(ggplot2)

mpg

ggplot() +
  geom_point(data = mpg,
             mapping = aes(x = displ, y = hwy))

p <- ggplot() +
  geom_point(data = mpg,
             mapping = aes(x = displ, y = hwy))
p

p + geom_smooth(data = mpg,
                mapping = aes(x = displ, y = hwy))

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
  facet_wrap(~ drv)
p

p + geom_smooth(method = "lm", se = FALSE)
