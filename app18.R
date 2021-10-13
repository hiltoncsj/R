library(shiny)

ui <- fluidPage(
  
  fluidRow(
    column(style="border: 1px solid black", width = 4, "Linha 1 - Coluna 1"),
    column(style="border: 1px solid black", width = 4, "Linha 1 - Coluna 2"),
    column(style="border: 1px solid black", width = 4, "Linha 1 - Coluna 3")
  ),
  
  fluidRow(
    column(style="border: 1px solid black", width = 4, "Linha 2 - Coluna 1"),
    column(style="border: 1px solid black", width = 4, "Linha 2 - Coluna 2"),
    column(style="border: 1px solid black", width = 4, "Linha 2 - Coluna 3")
  )
)

shinyApp(ui, server <- function(input, output) { 
  
})