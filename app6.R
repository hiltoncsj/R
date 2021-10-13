library(shiny)

ui <- fluidPage(
  titlePanel("Aplicando RadioButton"),
  sidebarLayout(
    sidebarPanel(
      #radioButtons("radioId", "Informe o sexo", choices = c("Masculino", "Feminino"), inline = FALSE)
      radioButtons("radioId", "Informe o sexo", list("Masculino" = 1, "Feminino" = 2, "Outros" = 3), selected = 2, inline = FALSE)
    ),
    mainPanel(
      verbatimTextOutput("radioIdSaida")
    )
  )
)

server <- function(input, output){
  output$radioIdSaida <- renderText({input$radioId})
}

shinyApp(ui, server)