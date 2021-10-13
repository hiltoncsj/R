library(shiny)

ui <- fluidPage(
  titlePanel ("Entrada e saída de Dados"),
  sidebarLayout(
    sidebarPanel(
      textInput("idEntradaTexto", "Informe um texto", )
    ),
    mainPanel(
      textOutput("idSaidaTexto")
    )
  )
)

server <- function(input, output) {
  output$idSaidaTexto <- renderText({input$idEntradaTexto})
}

shinyApp (ui, server)