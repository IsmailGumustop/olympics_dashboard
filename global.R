df <- read.csv("athlete_events.csv", header = TRUE)
games <- sort(unique(df$Games), decreasing = TRUE)