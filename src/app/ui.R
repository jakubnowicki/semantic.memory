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
  )
)
