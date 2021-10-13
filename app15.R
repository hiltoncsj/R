library(shiny)
library("shinyWidgets")

ui <- fluidPage(
  column(
    width = 7,
    tags$b("Progresso vinculado ao slider"), br(),
    progressBar("pb1", value = 5),
    sliderInput("up1","Update",min = 0,max = 100,value = 5
    ),
    br(),
    br(),
    progressBar("pb2",value = 0,total = 100,title = "Progresso vinculado ao clique",display_pct = TRUE
    ),
    actionButton("go","Carregar")
  )
)

server <- function(input, output, session) {
  observeEvent(input$up1, {
    updateProgressBar(
      session = session,
      id = "pb1",
      value = input$up1
    )
  })
  observeEvent(input$go, {
    for (i in 1:100) {
      updateProgressBar(
        session = session,
        id = "pb2",
        value = i, total = 100,
        title = paste("Progresso")
      )
      Sys.sleep(0.1)
    }
  })
}

shinyApp(ui = ui, server = server)