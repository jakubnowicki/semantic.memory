function(input, output, session) {
  session$userData$players <- players$Players$new()

  board$init_server("board")

  active_player <- c("TRUE", "FALSE")

  output$players_section <- renderUI(
    purrr::map2(session$userData$players$players, active_player, ~player_section$ui(.x$name, .y))
  )

  purrr::walk(session$userData$players$players, ~player_section$init_server(.x$name, .x))

  observeEvent(session$userData$players$active_player(), {
    shinyjs::runjs("$('#players_section .ui.raised.segment').removeClass('active');")
    shinyjs::runjs(glue::glue("$('#Player_{session$userData$players$active_player()}').addClass('active');"))
  }, ignoreInit = TRUE)
}
