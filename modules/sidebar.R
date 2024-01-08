sidebarUI <- function(id) {
  ns <- NS(id)
  tagList(
    pickerInput(
      inputId = ns("games_picker"),
      label = "Games",
      choices = games,
      selected = "2016 Summer"
      )
  )
}


sidebarServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # games <- reactive(sort(unique(df$Games), decreasing = TRUE))
      # 
      # output$picker_ui <- renderUI({
      #   ns <- session$ns
      #   pickerInput(
      #     inputId = ns("games_picker"),
      #     label = "Games",
      #     # choices = sort(unique(df()$Games), decreasing = TRUE),
      #     choices = games(),
      #     selected = "2016 Summer"
      #     )
      # })
      # 
      reactive(input$games_picker)
    }
  )
}
