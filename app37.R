library(shinydashboard)
library(shiny)

body <- dashboardBody(
  fluidRow(
    box(title = "Box", "Conteudo"),
    box(status = "warning", "Conteudo")
  ),
  
  fluidRow(
    box(
      title = "Box 1", width = 4, solidHeader = TRUE, status = "success", "Conteudo"
    ), #primary, success, info, warning, danger.
    box(
      title = "Box 2", width = 4, solidHeader = TRUE, "Conteudo"
    ),
    box(
      title = "Box 3", width = 4, solidHeader = TRUE, status = "warning", "Conteudo"
    )
  ),
  
  fluidRow(
    box(
      width = 4, background = "black",
      "Box sem titulo"
    ),
    box(
      title = "Box 5", width = 4, background = "light-blue"
    ),
    box(
      title = "Conteudo",width = 4
    )
  )
)

ui <- dashboardPage(
  dashboardHeader(title = "Aula Box"),
  dashboardSidebar ( disable = TRUE ),
  body
)


shinyApp(ui = ui, server = function(input, output) { })