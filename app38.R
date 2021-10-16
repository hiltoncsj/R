library(shiny)
library(shinydashboard)
ui <- dashboardPage(
  dashboardHeader(title = "Aula Box"),
  dashboardSidebar(
    sidebarMenu(
      menuItemOutput("menuitem"),
      menuItemOutput("menuitem2"),
      textInput("idValor", "Informe o valor")
    )
  ),
  dashboardBody(
    box(
      title = "Histograma", status = "primary", solidHeader = TRUE,
      collapsible = TRUE,
      plotOutput("plot", height = 250)
    ),
    
    box(
      title = "Inputs", status = "warning", solidHeader = TRUE,
      sliderInput("sliderId", "Selecione o valor:", 1, 100, 50),
      textInput("idTaxa", "Informe a taxa:")
    )
  )
)

server <- function(input, output) {
  output$menuitem <- renderMenu({
    menuItem("Menu item", icon = icon("calendar"))
  })
  output$menuitem2 <- renderMenu({
    menuItem("Menu item", icon = icon("refresh"))
  })
  numeros <- c(1,2,5,7,8,8,8,1,2,4)
  output$plot <- renderPlot(hist(numeros, main="Histograma"))
}

shinyApp(ui, server)