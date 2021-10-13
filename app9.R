library(shiny)

ui <- fluidPage(
  titlePanel("Trabalhando com SlideInput"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("idSlide", "Informe a quantidade de dados", min = 0, max = 1000, step = 10, value = 0)
    ),
    mainPanel(
      textOutput("idSaida")
    )
  )
)

server <- function(input, output){
  output$idSaida <- renderText({input$idSlide})
}

shinyApp(ui, server)