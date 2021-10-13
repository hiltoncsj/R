library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      tags$code("if x > 10 then"),
      tags$p("Aqui será um paragrafo"),
      tags$h1("Texto h1"),
      tags$h2("Texto h2"),
      tags$h3("Texto h3"),
      tags$h4("Texto h4"),
      tags$h5("Texto h5"),
      tags$h6("Texto h6"),
      tags$strong("Texto em negrito"),
      tags$br(""),
      tags$em("Texto em Itálico"),
      tags$br(""),
      tags$u("Texto sublinhado"),
      tags$br(""),
      tags$label("Informe um texto")
    )
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)