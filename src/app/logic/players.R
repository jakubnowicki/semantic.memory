import("R6")
import("shiny")

export("Players")

Player <- R6::R6Class(
    "Player",
    public = list(
      name = "string",
      score = "int",
      initialize = function(name) {
        self$name <- name
        self$score <- 0
      },
      give_point = function() {
        self$score <- self$score + 1
      }
    )
  )

Players <- R6::R6Class(
  "Players",
  public = list(
    players = "list",
    active_player = "integer",
    initialize = function() {
      self$players <- list(
        Player_1 = Player$new("Player_1"),
        Player_2 = Player$new("Player_2")
      )
      self$active_player <- reactiveVal(1)
    },
    add_player = function() {
    },
    give_point = function() {
      self$players[[self$active_player()]]$give_point()
    },
    remove_player = function() {
    },
    next_player = function() {
      if (length(self$players) > self$active_player()) {
        self$active_player(self$active_player() + 1)
      } else {
        self$active_player(1)
      }
    },
    get_scores = function() {
      purrr::map(self$players, ~.x$score)
    }
  )
)
