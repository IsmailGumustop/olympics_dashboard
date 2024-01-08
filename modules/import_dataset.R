# import_datasetServer <- function(id) {
#   moduleServer(
#     id,
#     function(input, output, session) {
#       df <- reactive(
#         read.csv("athlete_events.csv", header = TRUE)
#       )
# 
#       df
# 
#     }
#   )
# }