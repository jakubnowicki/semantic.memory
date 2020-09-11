library(shiny)
library(shiny.semantic)
library(modules)
library(shinyjs)
library(sass)

board <- use("modules/board.R")
players <- use("logic/players.R")

sass(
  sass::sass_file("styles/main.scss"),
  cache_options = sass_cache_options(FALSE),
  options = sass_options(output_style = "compressed"),
  output = "www/sass.min.css"
)
