library(shiny)
library(RMySQL)

con <- dbConnect(MySQL(), user='root', password='Qazxsw123!', host='127.0.0.1:3325', dbname='bancoaula')

sql <- "SELECT * FROM tbfilme"
res <- dbSendQuery(con, sql)
dados <- dbFetch(res)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      tags$h4("Conectando com BD")
    ),
    mainPanel(
      
      tableOutput("outTableId")
    )
  )
)

server <- function(input, output) {
  output$outTableId <- renderTable({dados})
}
shinyApp(ui,server)