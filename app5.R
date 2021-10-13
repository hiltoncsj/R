library(shiny)

ui <- fluidPage(
  titlePanel("Input com Datas"),
  sidebarLayout(
    sidebarPanel(
      dateInput("idDate", "Informe a data", format = "dd-mm-yyyy", language = "pt", autoclose = TRUE)
    ),
    mainPanel(
      verbatimTextOutput("idSaida")
    )
  )
)

server <- function(input, output) {
  output$idSaida <- renderText({as.character(input$idDate)})
}

shinyApp(ui, server)