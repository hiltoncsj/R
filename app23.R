ui <- fluidPage(
  
  tags$head(
    tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      
      h1 {
        font-family: 'Lobster', cursive;
        font-weight: 500;
        line-height: 1.1;
        color: #48ca3b;
      }
      
      h3 {
        font-family: 'Lobster', cursive;
        font-weight: 300;
        line-height: 1.1;
        color: blue;
      }
      
      p {
        color:yellow; 
        font-size: 30px;
      }
      
      body {
        background-color: white; 
      }

    "))
  ),
  
  headerPanel(tags$h1("New Application")),
  
  sidebarPanel(
  ),
  
  mainPanel(
    tags$h1("teste h1"),
    tags$h3("teste h3"),
    tags$p("teste P")
  )
)
server <- function(input, output){
  
}

shinyApp(ui, server)