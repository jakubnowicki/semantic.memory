import("shiny")
import("shiny.semantic")
import("purrr")

export("ui")
export("init_server")

card <- use("logic/card.R")

ui <- function(id) {
  ns <- NS(id)

  ncol <- 4
  nrow <- 3

  available_hexes <- c(
    "shiny_semantic",
    "semantic_dashboard",
    "shiny_info",
    "shiny_i18n",
    "shiny_worker",
    "shiny_router"
  )

  hexes <- sample(rep(available_hexes, times = 2), size = 12)

  areas <- cross2(1:ncol, 1:nrow) %>% map(~paste0("card_", .x[[1]], "_", .x[[2]]))

  grid_template <- shiny.semantic::grid_template(
      default = list(
        areas = areas %>% matrix(ncol = ncol),
        cols_width = c("200px 200px 200px"),
        rows_height = c("205px 205px 205px 205px")
      )
    )

  cards <- purrr::map2(areas, hexes, ~card$card(ns(.x), .y, ns))
  args <- c(grid_template = list(grid_template), cards)
  args <- set_names(args, c("grid_template", areas))

  do.call(shiny.semantic::grid, args)
}

init_server <- function(id) {
  callModule(server, id)
}

server <- function(input, output, session) {
  first_card_hex <- reactiveVal(NULL)
  first_card_id <- reactiveVal(NULL)

  observeEvent(input$card_revealed, {
    if (is.null(first_card_hex())) {
      first_card_id(input$card_revealed[1])
      first_card_hex(input$card_revealed[2])
    } else {
      if (first_card_hex() == input$card_revealed[2]) {
        session$userData$players$give_point()
        Sys.sleep(1)
        shinyjs::runjs(glue::glue("$('#{first_card_id()}').css('display', 'none');"))
        shinyjs::runjs(glue::glue("$('#{input$card_revealed[1]}').css('display', 'none');"))
        if (sum(unlist(session$userData$players$get_scores())) == 6) {
          print(session$userData$players$get_scores())
        }
      } else {
        session$userData$players$next_player()
        Sys.sleep(1)
        shinyjs::runjs(glue::glue("$('.ui.fade.reveal.image').addClass('disabled');"))
        shinyjs::runjs(glue::glue("$('.ui.fade.reveal.image').removeClass('active');"))
      }
      first_card_hex(NULL)
      first_card_id(NULL)
    }
  })
}
