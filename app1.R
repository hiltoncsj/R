library(shiny)

ui <- fluidPage(
  titlePanel ("Meu Primeiro App com Shiny")
)

server <- function(input, output) {
  
}

shinyApp (ui, server)
