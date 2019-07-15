# Atomic vectors

x <- c(1, 2, 3, 4, 5)
x

y <- c("abc", "def", "ghi")
y

typeof(x)
length(x)

typeof(y)
length(y)

z <- c(1, "abc")
typeof(z)
z


# Types of atomic vectors

# Logical

1:10 %% 3 == 0

# Numeric

typeof(1)
typeof(1L)

# https://0.30000000000000004.com/

x <- 0.1 + 0.2
x
x == 0.3
print(x, digits = 18)
dplyr::near(x, 0.3)

# Character

x <- "Supercalifragilisticexpialidocious"
pryr::object_size(x)
y <- rep(x, 1000)
pryr::object_size(y)

# Each element of y is an 8-byte pointer to the same string
# 8 * 1000 + 152 = 8.15 kB

# Using atomic vectors

x <- runif(100)
x

x * 2

x * c(1, 10)

x * c(1, 10, 100)

x <- floor(runif(1000) * 10)

table(x)

# All types of vectors can be named

x_named <- c(x = 1, y = 2, z = 4)
x_named
names(x_named)
names(x_named)[2] <- "new name"
names(x_named)
x_named

# Some handy ways to generate sequential numeric vectors

x <- 1:10
x

x <- seq(2, 20, by = 3)
x

# Subsetting vectors

# We've used dplyr::filter for subsetting, but that doesn't work for vectors or lists

x <- c("one", "two", "three", "four", "five")
x[c(3, 2, 5)]

# positions can be repeated
x[c(3, 2, 5, 2)]

# subsetting with logical vector
x <- 1:10
x[c(TRUE, FALSE, TRUE, FALSE, TRUE)]
x[x %% 2 != 0]

x <- c(10, 3, NA, 5, 8, 1, NA)
x
x[!is.na(x)]

# Lists (recursive vectors)

x <- list(1, 2, 3)
x
str(x)

x_named <- list(a = 1, b = 2, c = 3)
str(x_named)

y <- list("a", 1L, 1.5, TRUE)
str(y)

z <- list(list(1, 2), list(3, 4))
str(z)

# Subsetting lists

a <- list(a = 1:3, b = "a string", c = pi, d = list(-1, -5))
a
str(a)

# [] extracts a sublist (result will always be a list)

a[3:4]

# [[]] extracts a single element of a list

a[[1]]

# $ is shorthand for extracting a named element

a$c

a[["c"]]


# Attributes
# Metadata for vectors

x <- 1:10
attr(x, "greeting")
attr(x, "greeting") = "Hi"
attr(x, "farewell") = "Bye"
attributes(x)
x

# A special attribute "class" controls how generic methods work

# R's first and simplest OO system: S3

as.Date
methods(as.Date)

some_days <- as.Date("2019-07-17") + sample(10, 5)
some_days
mean(some_days)
str(some_days)

# both mean and str are generic methods

attributes(some_days)
unclass(some_days)
mean(unclass(some_days))
str(unclass(some_days))

methods(mean)
methods(str)

methods(print)
methods(`[`)
methods(`[[`)
methods(`$`)


# Augmented vectors
# Vectors with additional attributes including class

# Four important ones:

# Factors
# Datetimes
# Dates
# Tibbles

# We'll look at two

# Factors

x <- factor(c("ab", "cd", "ab"), levels = c("ab", "cd", "ef"))
typeof(x)
attributes(x)
x

# Tibbles
library(tibble)

tb <- tibble(x = 1:5, y = 5:1)
tb
typeof(tb)
attributes(tb)
