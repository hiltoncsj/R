library(shiny)

ui <- fluidPage(
  titlePanel("Trabalhando com CheckBox"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("checkboxId", "Selecione o produto", list("TV" = 1, "Celular" = 2, "Notebook" = 3, "Som" = 4))
    ),
    mainPanel(
      actionButton("salvarProduto", "Clique no produto")
    )
  )
)

server <- function(input, output){
  observeEvent(input$salvarProduto, {
    opcaoSelecionada <- as.data.frame(input$checkboxId)
    print(opcaoSelecionada)
  })
}

shinyApp(ui, server)