library(shiny)
library(ECharts2Shiny)

ui <- fluidPage(
  
  loadEChartsLibrary(),
  loadEChartsTheme('shine'),
  loadEChartsTheme('vintage'),
  loadEChartsTheme('dark-digerati'),
  loadEChartsTheme('roma'),
  loadEChartsTheme('infographic'),
  loadEChartsTheme('macarons'),
  loadEChartsTheme('caravan'),
  loadEChartsTheme('jazz'),
  loadEChartsTheme('london'),
  
  
  fluidRow(
    column(6,
           tags$div(id="test_1", style="width:100%;height:300px;"),  # Specify the div for the chart.
           deliverChart(div_id = "test_1")  # Deliver the plotting
    ),
    column(6,
           tags$div(id="test_2", style="width:100%;height:300px;"),
           deliverChart(div_id = "test_2")
    )
  ),
  
  fluidRow(
    column(6,
           tags$div(id="test_3", style="width:100%;height:300px;"),
           deliverChart(div_id = "test_3")
    ),
    column(6,
           tags$div(id="test_4", style="width:100%;height:300px;"),
           deliverChart(div_id = "test_4")
    )
  ),
  
  fluidRow(
    column(6,
           tags$div(id="test_5", style="width:100%;height:300px;"),
           deliverChart(div_id = "test_5")
    ),
    column(6,
           tags$div(id="test_6", style="width:100%;height:300px;"),
           deliverChart(div_id = "test_6")
    )
  )
  
)

dat_1 <- c(rep("Tipo A", 8),
           rep("Tipo B", 5),
           rep("Tipo C", 1))


dat_2 <- data.frame(c(1, 2, 3, 1),
                    c(2, 4, 6, 6),
                    c(3, 2, 7, 5))

names(dat_2) <- c("Tipo A", "Tipo B", "Tipo C")
row.names(dat_2) <- c("Tempo 1", "Tempo 2", "Tempo 3", "Tempo 4")


palavras <- c(rep("R", 200), rep("Python", 100), rep("SAS", 90), rep("VBA", 50))

server <- function(input, output) {
  
  renderPieChart(div_id = "test_1", data = dat_1, theme = "roma", radius = "90%")
  
  renderLineChart(div_id = "test_2", theme = "shine", data = dat_2)
  
  renderBarChart(div_id = "test_3", grid_left = '3%', data = dat_2, font.size.legend=15)
  
  #grid_right, padrao eh 4% #grid_top padrao eh 16% #grid_bottom 3% #,show.tools=FALSE,show.legend = FALSE
  
  renderBarChart(div_id = "test_4", theme = "infographic", direction = "vertical", grid_left = "10%", data = dat_2)
  
  renderGauge(div_id = "test_5", gauge_name = "Meta de vendas", rate = 78.5, theme = "infographic")
  
  renderWordcloud("test_6", data = palavras, grid_size = 10, sizeRange = c(20, 100))
  
}

shinyApp(ui, server)