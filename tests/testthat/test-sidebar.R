test_that("Test the first input of 'games_picker' in sidebar module", {
  library(shinytest2)
  app <- AppDriver$new()
  picker_val <- app$get_values()$input$`sidebar-games_picker`
  expect_equal(picker_val, "2016 Summer")
})
