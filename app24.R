ui <- fluidPage(
  
  includeCSS("style.css"),
  #o arquivo style.css precisa estar na mesma pasta que o ser script do R, alem disso precisamos configurar o R para buscar o arquivo na pasta correta.
  #Basta ir no menu Session -> Set working directory -> To Source file location
  
  headerPanel("New Application"),
  
  sidebarPanel(
    sliderInput("obs", "Number of observations:", 
                min = 1, max = 1000, value = 500)
  ),
  
  mainPanel(plotOutput("distPlot"))
)

server <- function(input, output){
  
}

shinyApp(ui, server)