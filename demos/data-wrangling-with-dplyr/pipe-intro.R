library(magrittr)

demo_fun <- function(arg1, ...) {
  cat("demo_fun called with\n")
  cat(paste("arg1 =", arg1, "\n"))
  cat(paste("... =", ..., "\n"))
  invisible(arg1)
}
second_fun <- function(arg1, ...) {
  cat("second_fun called with\n")
  cat(paste("arg1 =", arg1, "\n"))
  cat(paste("... =", ..., "\n"))
  invisible(arg1)
}

# This...

demo_fun(1, 2, 3)

# is the same as this

1 %>%
  demo_fun(2, 3)



# This...

second_fun(demo_fun(1, 2, 3), 4, 5)

# is the same as this

temp <- demo_fun(1, 2, 3)
second_fun(temp, 4, 5)

# which is also the same as this

1 %>%
  demo_fun(2, 3) %>%
  second_fun(4, 5)
