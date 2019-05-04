# https://milosvil.github.io/2017-12-17/ggplot2-hexbin

library(ggplot2)

x <- 1.1 * c(0, -0.5, -0.5, 0, 0.5, 0.5, 0)
y <- 1.1 * sqrt(3) * c(-1, -0.5, 0.5, 1, 0.5, -0.5, -1)

hex <- data.frame(x, y)
hex2 <- data.frame(x = 1.4*x, y = 1.4*y)

line_points <- data.frame(lpx = c(-0.5, -0.3, -0.05, 0.05, 0.3, 0.5),
                          lpy = c(0, 0.4, 0.9, 0.30, 0.7, 1))

bg_col <- c("#F2F2F2")
l_col <- c("#424242")
p_col <- c("#A8D6FF", "#51A7F9", "#0365C0", "#164F86", "#002452", "#000643")

ggplot(hex, aes(x, y)) +
  geom_line(aes(x = lpx, y = lpy), data = line_points, size = 4, color = l_col) +
  geom_point(aes(x = lpx, y = lpy), data = line_points, size = 23, color = p_col) +
  geom_path(size = 10, color = l_col, lineend = "square") +
  geom_text(aes(x = 0, y = -0.5), label = "ggplot2", size = 33, color = l_col) +
  geom_text(aes(x = 0.15, y = -1.45, angle = 30),
            color = l_col, size = 6, label = "www.rstudio.com") +
  geom_path(aes(x, y), data = hex2, size = 75, color = "white", lineend = "square") +
  coord_cartesian(xlim = c(-0.55, 0.55), ylim = c(-2, 2)) +
  theme(aspect.ratio = 1.2,
        panel.background = element_rect(fill = bg_col),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 1.5),
        legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank())
