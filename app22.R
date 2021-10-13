library(shiny)
library("shinymanager")

credentials <- data.frame(
  user = c("hiltoncsj", "user2"),
  password = c("123456", "123456"),
  stringsAsFactors = FALSE
)

ui <- fluidPage(
  titlePanel("Testando shinyManager!"),
  
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      tags$p("Logado!"),
    )
  )
)

server <- function(input, output,  session) {
  
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials),
    timeout = 25
  )
  
}

ui <- secure_app(ui, language="br",
                 tags_top = tags$div(tags$img(src = "hcj.jpg", width = 150)),
                 tags_bottom = tags$div(
                   tags$p(
                     "Problemas no",
                     tags$a(
                       href = "mailto:hiltoncsj@gmail.com?Subject=Problema para acessar o site Datamétrica",
                       target="_top", "acesso")
                   )
                 ),
                 background = "linear-gradient(rgba(0,101,135,0), rgba(0,118,165,0.44))"
)

shinyApp(ui, server)

#https://cssgenerator.org/rgba-and-hex-color-generator.html
#https://cran.r-project.org/web/packages/shinymanager/shinymanager.pdf