library(shiny)

ui <- fluidPage(
  titlePanel ("Numeric Input"),
  sidebarLayout(
    sidebarPanel(
      numericInput("idEntradaNumerico", "Informe um número", 0, min = 0, max = 100, step = 5)
    ),
    mainPanel(
      verbatimTextOutput("idSaida", placeholder = TRUE)
    )
  )
)

server <- function(input, output) {
  output$idSaida <- renderText({input$idEntradaNumerico})
}

shinyApp (ui, server)