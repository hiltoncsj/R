library(shiny)

ui <- fluidPage(
  titlePanel ("Aula de Estruturação"),
  sidebarLayout(
    position = "right",
    sidebarPanel(
      h2("Dados de Input")
    ),
    mainPanel(
      h2("Saída de dados")
    )
  )
)

server <- function(input, output) {
  
}

shinyApp (ui, server)