function(input, output, session) {
  session$userData$players <- players$Players$new()

  board$init_server("board")
}
