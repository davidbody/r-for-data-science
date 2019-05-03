# Render Xaringan slides as PDF
# https://github.com/yihui/xaringan/wiki/Export-Slides-to-PDF

library(pagedown)
library(purrr)
library(stringr)

slide_files <- list.files("./slides-src/", pattern = "\\d{2}-.*\\.Rmd")

render_pdf <- function(file_name) {
  pdf_name <- str_glue("./slides/", str_replace(file_name, "Rmd", "pdf"))
  file_name <- str_glue("./slides-src/", file_name)
  print(str_glue("Rendering {pdf_name}"))
  chrome_print(file_name, pdf_name)
}

map(slide_files, render_pdf)
