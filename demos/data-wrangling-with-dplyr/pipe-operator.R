library(nycflights13)
library(tidyverse)

by_dest <- group_by(flights, dest)

delays <- summarize(by_dest,
                    count = n(),
                    dist = mean(distance, na.rm = TRUE),
                    delay = mean(arr_delay, na.rm = TRUE)
)

# delays <- filter(delays, count > 20, dest != "HNL")

# It looks like delays increase with distance up to ~750 miles 
# and then decrease. Maybe as flights get longer there's more 
# ability to make up delays in the air?
ggplot(data = delays, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

# Eliminate intermediate variables by nesting function calls:

delays <- filter(
  summarize(
    group_by(flights, dest), # <- logic starts here
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)),
  count > 20, dest != "HNL")

# Using the %>% operator instead:

delays <- flights %>% 
  group_by(dest) %>% 
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")

delays %>%
  ggplot(aes(dist, delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

# This is idiomatic Tidyverse style R ↑↑↑
