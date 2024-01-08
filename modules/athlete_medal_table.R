athlete_medal_tableUI <- function(id) {
  ns <- NS(id)
  tagList(
    dataTableOutput(outputId = ns("athlete_medal_dt"))
  )
}

athlete_medal_tableServer <- function(id, df, selected_game) {
  moduleServer(
    id,
    function(input, output, session) {
      df_medals <- reactive({
        # df() %>%
        df %>%
          filter(Games %in% selected_game()) %>%
          distinct(ID, Event, Medal,
                   .keep_all = TRUE
          ) %>%
          mutate(
            Medal = factor(
              Medal,
              levels = c("Bronze", "Silver", "Gold")
            )
          ) %>%
          group_by(Name, Medal) %>%
          count(Medal, .drop = FALSE) %>%
          na.omit() %>%
          pivot_wider(
            names_from = Medal,
            values_from = n
          ) %>%
          mutate(Total = sum(Bronze, Silver, Gold)) %>%
          arrange(-Total, -Gold, -Silver, -Bronze)
      })
      
      output$athlete_medal_dt <- renderDataTable(
        datatable(
          df_medals(),
          options = list(
            pageLength = 5
          )
        )
      )
    }
  )
}