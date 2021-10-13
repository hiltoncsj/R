library(shiny)
data(iris)
ui <- fluidPage(
  titlePanel(title = h4("Iris Dataset", align="center")),
  sidebarLayout(
    sidebarPanel(
      selectInput("var", "1. Selecione a variavel do iris dataset", choices =c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width" = 4), selected = 1),
      br(),
      sliderInput("bins", "2. Selecione a quantidade de dados", min=5, max = 25, value=15),
      br(), 
      radioButtons("color", "3. Selecione a cor do histograma", choices=c("Green", "Red", "Yellow"), selected ="Green")
      
    ),
    
    # Main Panel
    mainPanel(
      tabsetPanel(type="tab", 
                  tabPanel("Summary", "texto qualquer"),
                  tabPanel("Structure", "conteudo que vai estar dentro da aba que possui o titulo Structure"),
                  tabPanel("Data", tableOutput("data")),
                  tabPanel("Grafico", plotOutput("myhist"))
                  
      )
      
    )
    
  )
)


server <- function(input, output) {
  
  output$data <- renderTable({
    colm <- as.numeric(input$var)
    iris[colm]
    
  })
  
  output$myhist <- renderPlot({
    colm <- as.numeric(input$var)
    hist(iris[,colm], breaks=seq(0, max(iris[,colm]), l=input$bins+1), col=input$color, main="IRIS", xlab=names(iris[colm]), xlim=c(0,max(iris[,colm])))
    
  })
  
}
shinyApp(ui, server)