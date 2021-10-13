library(dplyr)
library(readxl)
library(shiny)
library(shinydashboard)
library(shinythemes)

dados <- read_xlsx(path = "dados.xlsx")

estados <- list("MG - Minas Gerais" = 1, "SP - São Paulo" = 2,"RJ - Rio de Janeiro" = 3)

choices_MG <- list("Belo Horizonte" = 105, "Ouro Preto" = 106, "Diamantina" = 107)
choices_SP <- list("São Paulo " = 205,"Guarulhos" = 206, "Campinas" = 207)
choices_RJ <- list("Rio de Janeiro" = 305, "Mesquita" = 306 , "Nova Friburgo" = 307)

ui <- dashboardPage(skin = "blue",
                    dashboardHeader(
                      title = "Select",
                      titleWidth = 186
                    ),
                    dashboardSidebar(
                      tags$p(),
                      selectInput("selectEstado", label = "Estados", choices = estados),
                      uiOutput("ui"),
                      #Documentacao: https://shiny.rstudio.com/articles/selectCidade-ui.html
                      
                      tags$div(class = "alinhamento",
                               actionButton("filtrar", "Filtrar")
                      )
                    ),
                    dashboardBody(
                      tags$style(type="text/css", ".alinhamento {color: black;height:40px;display:flex;align-items: center;justify-content: center;}"),
                      tabsetPanel(
                        navbarMenu("Dados cidade",
                                   tabPanel(
                                     title = "Dados cidade",
                                     value = "page1",
                                     fluidRow(
                                       column(12,
                                              tags$h3(class = "alinhamento", "Dados"),
                                       )
                                     ),
                                     fluidRow(
                                       column(4,
                                              textOutput("cidade")  
                                       ),
                                       column(4,
                                              textOutput("estado")
                                       ),
                                       column(4,
                                              textOutput("populacao")
                                       )
                                     )
                                   )
                        )
                      )
                    )
)

server <- function(input, output, session) {
  
  output$ui <- renderUI({
    if (is.null(input$selectEstado))
      return()
    
    switch(input$selectEstado,
           "1" = selectInput("selectCidade", label = "Cidade",
                             choices = choices_MG),
           "2" = selectInput("selectCidade", label = "Cidade",
                             choices = choices_SP),
           "3" = selectInput("selectCidade", label = "Cidade",
                             choices = choices_RJ)
    )
    
  })
  
  observeEvent(input$filtrar, {
    
    opcaoSelecionada <- input$selectCidade
    dadosFiltrados <- dados[dados$codigoCidade == opcaoSelecionada, ]
    dadosFiltrados <- as.data.frame(dadosFiltrados)
    
    output$cidade <- renderText({ 
      dadosFiltrados[1,2] 
    })
    
    output$estado <- renderText({ 
      dadosFiltrados[1,3] 
    })
    
    output$populacao <- renderText({ 
      dadosFiltrados[1,4] 
    })
    
  })
}

shinyApp(ui, server)