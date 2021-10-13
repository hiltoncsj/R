library(shiny)

ui <- navbarPage(title = "Exemplo NavBar", 
                 
                 tabPanel("Sobre a pagina", 
                          h4("Exemplo de utilizacao da Navbar")
                 ),
                 
                 
                 tabPanel("Dados", tableOutput("data")),
                 
                 
                 tabPanel("Grafico",
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput("b", "Selecione o numero de dados", min = 5, max = 20,value = 10)
                            ),
                            mainPanel(
                              plotOutput("plot")
                            )
                          )
                 ),
                 navbarMenu("Mais opcoes",
                            tabPanel("Menu A", verbatimTextOutput("summary")),
                            tabPanel("Menu B",
                                     tags$h1("DADOS SOBRE A PAGINA")
                            ))
                 
)


server <- function(input, output, session) {
  
  output$data <- renderTable({
    mtcars
  })
  
  output$plot <- renderPlot({
    hist(mtcars$mpg, col ="blue", breaks=input$b )
  })
  
  output$summary <- renderPrint({
    summary(mtcars)
  })
  
}

shinyApp(ui, server)