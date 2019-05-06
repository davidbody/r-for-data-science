library(nycflights13)
library(tidyverse)

flights

# Filter rows with filter()

filter(flights, month == 1, day == 1)

jan1 <- filter(flights, month == 1, day == 1)
View(jan1)

filter(flights, month == 11 | month == 12)

filter(flights, month %in% c(11, 12))

# Arrange rows with arrange()

arrange(flights, year, month, day)

arrange(flights, desc(arr_delay))

# Select columns with select()

select(flights, year, month, day)

select(flights, -(year:day))

select(flights, starts_with("dep_"))

select(flights, carrier, matches("^(arr_|dep_)"))

# Note: select can be used to rename variables, but it drops all the other variables
# Use rename(), instead

rename(flights, tail_num = tailnum)

# To reorder columns
select(flights, time_hour, air_time, everything())

# Add new variables with mutate()

flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time
                      )

mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60)

# Many operators and functions can be used, as long as they operate on vectors

# Grouped summaries with summarize()

summarize(flights, delay = mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year, month, day)
summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))

# summarize(by_day, delay = mean(dep_delay))
