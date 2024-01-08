country_medal_tableUI <- function(id) {
  ns <- NS(id)
  tagList(
    dataTableOutput(outputId = ns("country_medal_dt"))
  )
}

country_medal_tableServer <- function(id, df, selected_game) {
  moduleServer(
    id,
    function(input, output, session) {
      # ---------- Render Medal table of Countries ----------
      df_medals <- reactive({
        # df() %>%
        df %>%
          filter(Games %in% selected_game()) %>%
          distinct(NOC, Event, Medal) %>%
          mutate(
            Medal = factor(
              Medal,
              levels = c("Bronze", "Silver", "Gold")
            )
          ) %>%
          group_by(NOC, Medal) %>%
          count(Medal, .drop = FALSE) %>%
          na.omit() %>%
          pivot_wider(
            names_from = Medal,
            values_from = n
          ) %>%
          mutate(Total = sum(Bronze, Silver, Gold)) %>%
          arrange(-Total, -Gold, -Silver, -Bronze)
      })
      
      output$country_medal_dt <- renderDataTable({
        datatable(
          df_medals(),
          options = list(
            pageLength = 5
          )
        )
      })
    }
  )
}