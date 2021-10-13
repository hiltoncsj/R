library(shiny)

ui <- fluidPage(
  titlePanel("Trabalhando com Gráficos"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slideId", "Selecione o número", min = 100, max = 1000, value = 200)
    ),
    mainPanel(
      plotOutput("graficoHist")
    )
  )
)

server <- function(input, output){
  output$graficoHist <- renderPlot({hist(sample(input$slideId))})
}

shinyApp(ui, server)