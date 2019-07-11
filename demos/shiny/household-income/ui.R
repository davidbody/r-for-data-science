library(shiny)

shinyUI(fluidPage(

    titlePanel("Household Income Growth Comparisons"),

    verticalLayout(
        fluidRow(
            column(6, uiOutput("country_1_selector")),
            column(6, uiOutput("country_2_selector"))
            )
        ),

        fluidRow(
            plotOutput("income_plot")
        )
    )
)
