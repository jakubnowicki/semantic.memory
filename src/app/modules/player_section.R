import("shiny")

export("ui")
export("init_server")

ui <- function(id) {
  ns <- NS(id)
  div(class = "ui raised segment",
    div(
      div(class="ui green ribbon label", textOutput(ns("name"))),
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
