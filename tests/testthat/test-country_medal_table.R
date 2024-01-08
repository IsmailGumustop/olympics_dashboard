test_that("Medal counts change when the game changed.", {
  library(shiny)
  library(testthat)
  library(dplyr)
  library(tidyr)

  source("../../modules/country_medal_table.R")
  df_x <- read.csv("../../athlete_events.csv", header = TRUE)
  selected_game_x <- reactiveVal()

  testServer(country_medal_tableServer,
             args = list(df = df_x, selected_game = selected_game_x), {
               selected_game_x("1976 Summer")
               session$flushReact()
               expect_equal(head(df_medals()$Gold, 5), c(49, 34, 40, 10, 4))

               selected_game_x("2006 Winter")
               session$flushReact()
               expect_equal(head(df_medals()$Bronze, 5), c(6, 7, 7, 7, 8))
             })
})
