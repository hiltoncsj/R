#Link: http://shinyapps.dreamrs.fr/shinyWidgets/
library(shiny)
library(shinyWidgets)


ui <- fluidPage(
  
  titlePanel("ShinyWidgets"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput(inputId = "bins",
                  label = "Progresso barra:",
                  min = 1,
                  max = 100,
                  value = 50),
      
      prettySwitch(
        inputId = "Id027",
        label = "Click me!", 
        status = "success",
        fill = TRUE
      ),
      
      prettyRadioButtons(
        inputId = "Id037",
        label = "Pagamento:", 
        choices = c("Cartao !", "Boleto", "Paypal"),
        inline = TRUE, 
        status = "danger",
        fill = TRUE
      ),
      
      prettyCheckbox(
        inputId = "Id023",
        label = "Capturando valor no server", 
        value = TRUE,
        status = "success",
        fill = TRUE
      ),
      
      prettyRadioButtons(
        inputId = "Id038",
        label = "Choose:", 
        choices = c("Opcao 1", "Opcao 2", "Opcao 3"),
        icon = icon("user"), 
        animation = "tada"
      ),
      
      checkboxGroupButtons(
        inputId = "Id052",
        label = "Label",
        choices = c("A", 
                    "B", "C", "D"),
        status = "danger"
      ),
      
      materialSwitch(
        inputId = "Id079",
        label = "Success", 
        value = TRUE,
        status = "info"
      ),
      
      switchInput(
        inputId = "Id011"
      )
      
    ),
    
    mainPanel(
      
      progressBar(id = "pb3", value = 50, status = "danger", striped = TRUE),
      textOutput(outputId = "outTexto"),
      textOutput(outputId = "outTexto2"),
      
    )
  )
)

server <- function(input, output, session) {
  
  opcao <- renderText({ input$Id023 })
  output$outTexto <- opcao
  
  opcao2 <- renderText({ input$Id011 })
  output$outTexto2 <- opcao2
  
  observeEvent(input$bins,{
    updateProgressBar(session = session, id = "pb3", value = input$bins)
  })
  
}

shinyApp(ui,server)