library(shiny)

shinyUI(fluidPage(

    titlePanel("Household Income Growth Comparisons"),

    verticalLayout(
        fluidRow(
            flowLayout(
                uiOutput("country_1_selector"),
                uiOutput("country_2_selector")
            )
        ),

        fluidRow(
            plotOutput("income_plot")
        )
    )
))
