semanticPage(
  title = "shiny.semantic Memory",
  header("shiny.semantic Memory", ""),
  tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = "sass.min.css"
  ),
  shinyjs::useShinyjs(),
  shiny.semantic::grid(
    grid_template(
      default = list(
        areas = cbind("board", "players"),
        cols_width = c("4fr", "1fr")
      )
    ),
    board = div(
      class = "board",
      board$ui("board")
    ),
    players = uiOutput("players_section")
  ),
  shiny.info::display(
    span(
      "Created by Jakub Nowicki",
      tags$a(href = "https://twitter.com/q_nowicki", icon("twitter")),
      tags$a(href = "https://www.linkedin.com/in/jakub-nowicki/", icon("linkedin")),
      tags$a(href = "https://github.com/jakubnowicki", icon("github"))
    ),
    position = "bottom right"
  )
)
