medal_plotUI <- function(id) {
  ns <- NS(id)
  tagList(
    plotlyOutput(ns("plotly1")),
    uiOutput(ns("back"))
  )
}

medal_plotServer <- function(id, df, selected_game) {
  moduleServer(
    id,
    function(input, output, session) {
      # drilss reactiveValues ----
      drills <- reactiveValues(
        Sport = NULL#,
        # NOC = NULL
        )
      
      # plotly_data ----
      plotly_data <- reactive({
        df_medals <- df %>% #df() %>%
          filter(Games %in% selected_game()) %>%
          distinct(Team, Event, Medal,
                   .keep_all = TRUE) %>%
          mutate(
            Medal = factor(
              Medal,
              levels = c("Bronze", "Silver", "Gold")
              )
            ) %>%
          group_by(NOC, Sport, Medal) %>%
          count(Medal, .drop = FALSE) %>%
          na.omit() %>%
          pivot_wider(
            names_from = Medal,
            values_from = n
            ) %>%
          group_by(NOC, Sport) %>%
          mutate(Total = sum(Bronze, Silver, Gold))
        
        if (!length(drills$Sport)) {
          medals_by_sport_df <- df_medals %>%
            group_by(Sport) %>%
            summarise(Total = sum(Total))
          return(medals_by_sport_df)
          } #else if (!length(drills$NOC)) {
        medals_by_NOC_df <- df_medals %>%
          filter(
            Sport == drills$Sport,
            Total != 0
            ) %>%
          arrange(-Total, -Bronze, -Silver, -Gold, -desc(NOC))
        return(medals_by_NOC_df)
        })
      
      # render_plotly (source 1) ----
      output$plotly1 <- renderPlotly({
  dat1 <- plotly_data()
  if (!length(drills$Sport)) {
    p1 <- plot_ly(
      data = dat1,
      x = ~Total,
      y = ~Sport,
      type = "bar",
      source = "source1"
    ) %>%
      layout(
        yaxis = list(
          categoryorder = "total ascending"
        )
      )
    } else { # else if (!length(drills$NOC)) {
      p1 <- plot_ly(
        data = dat1,
      # x = ~ Total,
      y = ~NOC,
      source = "source1"
    ) %>%
      add_bars(
        x = ~Bronze,
        name = "Bronze",
        color = I("#CD7F32")
      ) %>%
      add_bars(
        x = ~Silver,
        name = "Silver",
        color = I("#C0C0C0")
      ) %>%
      add_bars(
        x = ~Gold,
        name = "Gold",
        color = I("#FFD700")
      ) %>%
      layout(
        yaxis = list(
          categoryorder = "total ascending"
        ),
        barmode = "stack"
      )
  }
  p1
})
      
      # observeEvent - observe the ploltly_clicks ----
      observeEvent(event_data("plotly_click", source = "source1"), {
        y_val <- event_data("plotly_click", source = "source1")$y
        
        if(!length(drills$Sport)) {
          drills$Sport <- y_val
        } #else {
        #   drills$NOC <- y_val
        # }
      })
      
      output$back <- renderUI({
        ns <- session$ns
        if (!is.null(drills$Sport)) {
          actionButton(ns("clear"), "Back", icon("chevron-left"))
        }
      })
      
      observeEvent(
        input$clear,
        handlerExpr = {
          drills$Sport <- NULL
        }
      )
    }
  )
}