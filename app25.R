#ui <- ui = fluidPage(theme = shinytheme("united"),
#theme = "mytheme.css",
library("shinythemes")
library(shiny)
ui = fluidPage(
  #shinythemes::themeSelector(),
  theme = shinytheme("slate"),
  sidebarPanel(
    textInput("txt", "Text input:", "text here"),
    sliderInput("slider", "Slider input:", 1, 100, 30),
    actionButton("action", "Salvar"),
    actionButton("action2", "Cancelar", class = "btn-primary")
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Tab 1"),
      tabPanel("Tab 2")
    )
  )
)

server = function(input, output) {}

shinyApp(ui, server)