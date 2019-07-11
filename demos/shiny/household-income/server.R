library(shiny)
library(tidyverse)

shinyServer(function(input, output) {
    load("./household_income.RData")

    countries <- unique(household_income$Country)

    output$country_1_selector <- renderUI({
        selectInput("country_1", "Country 1", countries, selected = "United Kingdom")
    })

    output$country_2_selector <- renderUI({
        selectInput("country_2", "Country 2", countries, selected = "United States")
    })

    plot_income_comparison <- function(country_1, country_2) {
        if (is.null(country_1) || is.null(country_2)) {
            return()
        }
        household_income %>%
            filter(Country %in% c(country_1, country_2)) %>%
            ggplot(aes(Year, Index, group = Decile, color = Decile)) +
            geom_point() +
            geom_line() +
            geom_hline(yintercept = 100, linetype = 3) +
            scale_x_continuous(breaks = c(1980, 1990, 2000, 2010)) +
            scale_y_continuous(breaks = c(90, 100, 120, 150, 180)) +
            facet_wrap(vars(Country)) +
            labs(title = "Growth of Real Disposable Household Income by Decile",
                 subtitle = "Source: Our World in Data")
    }

    output$income_plot <- renderPlot({
        plot_income_comparison(input$country_1, input$country_2)
    })
})
