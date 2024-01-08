test_that("Test the x and y axis in medal_plot", {
  library(shinytest2)
  library(rjson)
  
  app <- AppDriver$new("../../")
  plotly_data <- app$get_values()
  plotly_data <- fromJSON(plotly_data$output$`medal_plot-plotly1`)
  plotly_x <- plotly_data$x$data[[1]]$x
  plotly_y <- plotly_data$x$data[[1]]$y
  expect_equal(plotly_x,
               c(12, 141, 15, 6, 6, 51, 49, 54, 24, 18, 30, 6, 6, 42, 6, 6,
                 56, 6, 6, 42, 6, 30, 45, 104, 6, 12, 32, 15, 6, 6, 6, 6, 45,
                 72))
  expect_equal(plotly_y,
               c("Archery", "Athletics", "Badminton", "Basketball",
                 "Beach Volleyball", "Boxing", "Canoeing", "Cycling",
                 "Diving", "Equestrianism", "Fencing", "Football", "Golf",
                 "Gymnastics", "Handball", "Hockey", "Judo",
                 "Modern Pentathlon", "Rhythmic Gymnastics", "Rowing",
                 "Rugby Sevens", "Sailing", "Shooting", "Swimming",
                 "Synchronized Swimming", "Table Tennis", "Taekwondo",
                 "Tennis", "Trampolining", "Triathlon", "Volleyball",
                 "Water Polo", "Weightlifting", "Wrestling"))
})
