library(shinydashboard)
library(shiny)

ui <- dashboardPage(
  dashboardHeader(title = "Caixas de valor"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      valueBox(10 * 2, "Novas compras", icon = icon("credit-card")),
      valueBoxOutput("progressBox"),
      valueBoxOutput("approvalBox")
    ),
    fluidRow(
      box(width = 4, actionButton("count", "Incrementar"))
    )
  )
)

server <- function(input, output) {
  
  output$progressBox <- renderValueBox({
    valueBox(paste0(25 + input$count, "%"), "Progresso", icon = icon("list"),color = "purple")
  })
  
  output$approvalBox <- renderValueBox({
    valueBox("80%", "Aprovacao", icon = icon("thumbs-up", lib = "glyphicon"),color = "yellow")
  })
}

shinyApp(ui, server)

### ICONES DISPONIVEIS ###
###https://fontawesome.com/icons?from=io###