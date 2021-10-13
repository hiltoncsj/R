library(shiny)

ui <- fluidPage(
  titlePanel("Trabalhando com Imagens"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      tags$img(src="perfil-masculino.jpg", width=200, height=200)
    )
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)