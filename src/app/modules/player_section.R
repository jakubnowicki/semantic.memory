import("shiny")

export("ui")
export("init_server")

ui <- function(id, active = FALSE) {
  ns <- NS(id)
  class <- "ui raised segment"

  if (active) {
    class <- paste0(class, " active")
  }

  div(id = id, class = class,
    div(
      div(class = "ui teal ribbon label", textOutput(ns("name"))),
      h2("Score:"),
      h3(
        textOutput(ns("score"))
      )
    )
  )
}

init_server <- function(id, player) {
  callModule(server, id, player = player)
}

server <- function(input, output, session, player) {
  output$name <- renderText(player$name)

  output$score <- renderText(player$score())
}
