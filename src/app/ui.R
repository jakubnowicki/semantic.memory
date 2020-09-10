semanticPage(
  title = "shiny.semantic Memory",
  tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = "sass.min.css"
  ),
  shinyjs::useShinyjs(),
  board$ui("board")
)
