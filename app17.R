library(shiny)
library("shinyalert")

ui = fluidPage(
  useShinyalert(),  # Set up shinyalert
  actionButton("btn", "Mostrar mensagem")
)

server = function(input, output) {
  observeEvent(input$btn, {
    shinyalert(title = "Mensagem de Erro", type="error") #error #default #warning
  })
}


shinyApp(ui, server)