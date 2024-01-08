library(shiny)
library(icons)
library(shinyWidgets)
library(DT)
library(dplyr)
library(tidyr)
library(bslib)
library(bsicons)
library(plotly)

source("global.R")
modules <- dir("modules", full.names = TRUE, recursive = TRUE)
for (filepath in modules) {
  source(filepath)
}

options(shiny.host = "0.0.0.0")
options(shiny.port = 8180)


ui <- page_fluid(
  includeCSS("www/style.css"),
  includeScript("www/script.js"),
  fluidRow(
    column(
      width = 3,
      sidebarUI("sidebar")
    ),
    column(
      width = 9,
      value_boxUI("value_box")
    )
  ),
  br(),
  fluidRow(
    column(
      width = 6,
      country_medal_tableUI("country_medal_table")
    ),
    column(
      width = 6,
      athlete_medal_tableUI("athlete_medal_table")
    )
  ),
  br(),
  fluidRow(
    medal_plotUI("medal_plot")
  )
)

server <- function(input, output, session) {
  selected_game <- sidebarServer("sidebar")
  value_boxServer("value_box", df, selected_game)
  country_medal_tableServer("country_medal_table", df, selected_game)
  athlete_medal_tableServer("athlete_medal_table", df, selected_game)
  medal_plotServer("medal_plot", df, selected_game)
}

shinyApp(ui, server)