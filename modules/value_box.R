sport_icon_set <- icon_set("www/images/")
placeholder_icon <- icon_set("www/images/summer_olympics_sports.svg")

value_boxUI <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(
        width = 4,
        value_box(
          title = h4("Athletes"),
          textOutput(ns("total_participation")),
          span(
            bs_icon("gender-male"),
            textOutput(ns("male_participation"), inline = TRUE),
          ),
          span(
            bs_icon("gender-female"),
            textOutput(ns("female_participation"), inline = TRUE)
          ),
          showcase = bs_icon("person-arms-up"),
          theme = "blue"
        )
      ),
      column(
        width = 4,
        value_box(
          title = h4("Sports and Events"),
          span(
            textOutput(ns("sports")),
            textOutput(ns("events"))
          ),
          showcase = uiOutput(ns("sports_ui")),
          class = "bg-success",
          theme = "teal"
        )
      ),
      column(
        width = 4,
        value_box(
          title = h4("Host City"),
          span(
            textOutput(ns("city1")),
            textOutput(ns("city2"))
          ),
          showcase = bs_icon("pin-map"),
          theme = "orange"
        )
      )
    )
  )
}

value_boxServer <- function(id, df, selected_game) {
  moduleServer(
    id,
    function(input, output, session) {
      # ---- The first value_box ----
      df_athlete_sex <- reactive({
        # df() %>% 
        df %>%
          filter(Games %in% selected_game()) %>%
          distinct(ID, Sex) %>%
          summarise(
            Male = sum(Sex == "M"),
            Female = sum(Sex == "F")
            )
        })
      
      output$total_participation <- renderText({
        paste0("Total: ", sum(df_athlete_sex()))
      })
      output$male_participation <- renderText({
        paste0(df_athlete_sex()$Male)
      })
      output$female_participation <- renderText({
        paste0(df_athlete_sex()$Female)
      })
      
      # ---- The second value_box ----
      output$sports <- renderText({
        df_sports_count <- df %>% #df() %>%
          filter(Games %in% selected_game()) %>%
          select(Sport) %>%
          unique() %>%
          nrow()
        
          paste0("Sports: ", df_sports_count)
          })

      output$events <- renderText({
        df_events_count <- df %>% #df() %>%
          filter(Games %in% selected_game()) %>%
          select(Event) %>%
          unique() %>%
          nrow()
        
          paste0("Events: ", df_events_count)
          })

      output$sports_ui <- renderUI({
        if (grepl("summer", selected_game(), ignore.case = TRUE)) {
          sport_icon_set$summer_olympics_sports
          } else {
            sport_icon_set$winter_olympics_sports
            }
        })
      
      # ---- The third value_box ----
      host_city <- reactive({
        # df() %>%
        df %>%
          filter(Games %in% selected_game()) %>%
          select(City) %>%
          unique()
      })
      
      # observe(
        output$city1 <- renderText({
          host_city()[1,1]
          })
          
          output$city2 <- renderText({
            ifelse(nrow(host_city()) > 1, host_city()[2,1], "")
          })
        
      # )
    }
  )
}