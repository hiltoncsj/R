library(shiny)

ui <- fluidPage(
  titlePanel("Trabalhando com ActionButton"),
  sidebarLayout(
    sidebarPanel(
      actionButton("idButton", "Clique no botão", icon("refresh"))
    ),
    mainPanel(
      textOutput("idSaida")
    )
  )
)

server <- function(input, output){
  observeEvent(input$idButton, {
    output$idSaida <- renderText("Olá Mundo!")
  })
}

shinyApp(ui, server)