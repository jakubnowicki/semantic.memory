function(input, output, session) {
  session$userData$players <- players$Players$new()

  board$init_server("board")

  output$players_section <- renderUI(
    purrr::map(session$userData$players$players, ~player_section$ui(.x$name))
  )

  purrr::walk(session$userData$players$players, ~player_section$init_server(.x$name, .x))
}
