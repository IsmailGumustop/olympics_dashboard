test_that("{shinytest2} recording: olympics_dashboard_3", {
  app <- AppDriver$new(variant = platform_variant(), name = "olympics_dashboard_3", 
      height = 873, width = 1392)
  Sys.sleep(5)
  app$set_window_size(width = 1392, height = 873)
  app$set_inputs(`sidebar-games_picker` = "1956 Summer")
  app$set_window_size(width = 1392, height = 873)
  app$set_inputs(`sidebar-games_picker` = "2010 Winter")
  app$set_window_size(width = 1392, height = 873)
  app$expect_values()
  app$expect_screenshot()
})
