library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      tags$p("TEXTO COM STYLE", style="color:blue;"),
      HTML("<p><h1>Estilo HTML</h1></p>"),
      tags$div(
        style="background-color:gray; color:white; text-align:center",
        tags$p("Texto com div>p")
      ),
      tags$label("Informe seu problema:"),
      tags$br(),
      tags$textarea("Escreva aqui", rows=3, cols=10)
    )
  )
)

server <- function(input, output){}
shinyApp(ui, server)