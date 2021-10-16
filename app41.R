library(shiny)
library(shinydashboard)
library(ECharts2Shiny)
library(dplyr)
library(ggplot2)
library(stringr)
library(esquisse)
library(DT)
library(r2d3)

dados <- read.csv(file = "amostra.csv")

#quant de alunos por estado
alunosEstado <- dados %>% group_by(SG_UF_RESIDENCIA) %>% summarise(quantAlunos = n()) %>% arrange(desc(quantAlunos))

#quant de alunos por cidade
alunosCidade <- dados %>% group_by(NO_MUNICIPIO_ESC) %>% summarise(quantAlunos = n()) %>% arrange(desc(quantAlunos)) %>% collect()

#quant de alunos que vão fazer provas em braille
provaBraille <- dados %>% filter(IN_BRAILLE == 1) %>% summarise(quantidade = n()) %>% collect()

#alunos treineiros
treineiros <- dados %>% filter(IN_TREINEIRO == 1) %>% summarise(quantidade = n()) %>% collect()

#cadeira canhoto
canhoto <- dados %>% filter(IN_CADEIRA_CANHOTO == 1) %>% summarise(quantidade = n()) %>% collect()

#presentes
quantPresentes1dia <- as.integer(dados %>% filter(TP_PRESENCA_CH == 1) %>% summarise(quantidade = n()) %>% collect())
quantPresentes2dia <- as.integer(dados %>% filter(TP_PRESENCA_MT == 1) %>% summarise(quantidade = n()) %>% collect())

#idade media dos participantes
idadeMedia <- dados %>% filter(NU_IDADE > 0) %>% summarise(mediaIdade = mean(NU_IDADE)) %>% collect()
idadeMedia <- round(idadeMedia, 2)

#sexo dos participantes
sexo <- dados %>% filter(TP_SEXO %in% c("M", "F")) %>% group_by(TP_SEXO) %>% count() %>% ungroup() %>% mutate(porcentagem = round(n/sum(n),4)*100,  lab.pos = cumsum(porcentagem)-.5*porcentagem)

#quantidade de alunos por lingua estrangeira
#0	Inglês
#1	Espanhol
linguaEstrangeira <- dados %>% group_by(TP_LINGUA) %>% count() %>% ungroup() %>% mutate(porcentagem = round(n/sum(n),4)*100,  lab.pos = cumsum(porcentagem)-.5*porcentagem)
linguaEstrangeira <- as.data.frame(linguaEstrangeira)
linguaEstrangeira$TP_LINGUA <- str_replace(linguaEstrangeira$TP_LINGUA, "1", "Inglês")
linguaEstrangeira$TP_LINGUA <- str_replace(linguaEstrangeira$TP_LINGUA, "0", "Espanhol")

#nacionalidade
#1	Brasileiro(a)
#2	Brasileiro(a) Naturalizado(a)
#3	Estrangeiro(a)
#4	Brasileiro(a) Nato(a), nascido(a) no exterior
quantNacionalidade <- dados %>% filter(TP_NACIONALIDADE != 0) %>% group_by(TP_NACIONALIDADE) %>% summarise(quantidade = n()) %>% arrange(desc(quantidade))
quantNacionalidade$TP_NACIONALIDADE <- str_replace(quantNacionalidade$TP_NACIONALIDADE, "1", "Brasileiro(a)")
quantNacionalidade$TP_NACIONALIDADE <- str_replace(quantNacionalidade$TP_NACIONALIDADE, "2", "Brasileiro(a) Naturalizado(a)")
quantNacionalidade$TP_NACIONALIDADE <- str_replace(quantNacionalidade$TP_NACIONALIDADE, "3", "Estrangeiro(a)")
quantNacionalidade$TP_NACIONALIDADE <- str_replace(quantNacionalidade$TP_NACIONALIDADE, "4", "Brasileiro(a) Nato(a), nascido(a) no exterior")

nacionalidade <- c(rep(as.character(quantNacionalidade[1,1]), as.integer(quantNacionalidade[1,2])),
                   rep(as.character(quantNacionalidade[2,1]), as.integer(quantNacionalidade[2,2])),
                   rep(as.character(quantNacionalidade[3,1]), as.integer(quantNacionalidade[3,2]))
)

#localizacao escola
#1	Urbana
#2	Rural
quantLocalicazao <- dados %>% group_by(TP_LOCALIZACAO_ESC) %>% summarise(quant = n())
quantLocalicazao <- as.data.frame(quantLocalicazao)
quantLocalicazao$TP_LOCALIZACAO_ESC <- str_replace(quantLocalicazao$TP_LOCALIZACAO_ESC, "1", "Urbana")
quantLocalicazao$TP_LOCALIZACAO_ESC <- str_replace(quantLocalicazao$TP_LOCALIZACAO_ESC, "2", "Rural")
quantLocalicazao$TP_LOCALIZACAO_ESC <- str_replace(quantLocalicazao$TP_LOCALIZACAO_ESC, "NA", "Não informado")
quantLocalicazao <- quantLocalicazao[-3,]

localizacao <- c(rep(as.character(quantLocalicazao[1,1]), as.integer(quantLocalicazao[1,2])), rep(as.character(quantLocalicazao[2,1]), as.integer(quantLocalicazao[2,2])))

#situacao de conclusao do EM
#1	Já concluí o Ensino Médio
#2	Estou cursando e concluirei o Ensino Médio em 2015
#3	Estou cursando e concluirei o Ensino Médio após 2015
#4	Não concluí e não estou cursando o Ensino Médio
conclusaoEM <- dados %>% group_by(TP_ST_CONCLUSAO) %>% summarise(quant = n()) %>% arrange(TP_ST_CONCLUSAO) %>% collect()
conclusaoEM <- cbind(c("Já concluí o Ensino Médio", "Estou cursando e concluirei o Ensino Médio em 2015", "Estou cursando e concluirei o Ensino Médio após 2015", "Não concluí e não estou cursando o Ensino Médio"), conclusaoEM)

#media dos alunos por tipo de escola
#1	Não Respondeu
#2	Pública
#3	Privada
#4	Exterior
#dados %>% group_by(TP_ESCOLA) %>% summarise(mediaNotasMT = mean(NU_NOTA_MT), mediaNotasCN = mean(NU_NOTA_CN), mediaNotasCH = mean(NU_NOTA_CH), mediaNotasLC = mean(NU_NOTA_LC)) %>% 
# mutate(mediaAreas = (mediaNotasMT + mediaNotasCN + mediaNotasCH + mediaNotasLC) / 4) %>% arrange(desc(mediaAreas))

#redacao
competenciasRedacao <- dados %>% filter(NU_NOTA_COMP1 > 0 & NU_NOTA_COMP2 > 0 & NU_NOTA_COMP3 > 0 & NU_NOTA_COMP4 > 0 & NU_NOTA_COMP5 > 0) %>% group_by(TP_ESCOLA) %>% summarise(comp1 = mean(NU_NOTA_COMP1), comp2 = mean(NU_NOTA_COMP2), comp3 = mean(NU_NOTA_COMP3), comp4 = mean(NU_NOTA_COMP4), comp5 = mean(NU_NOTA_COMP5)) %>%  arrange(TP_ESCOLA) %>% collect()
competenciasRedacao <- as.data.frame(competenciasRedacao)
competenciasRedacao$TP_ESCOLA <- NULL
competenciasRedacao <- t(competenciasRedacao)
competenciasRedacao <- as.data.frame(competenciasRedacao)
competenciasRedacao <- rbind(0, competenciasRedacao)
names(competenciasRedacao) <- c("Não respondeu", "Pública", "Privada", "Exterior")
row.names(competenciasRedacao) <- c("0","COMP 1", "COMP 2", "COMP 3", "COMP 4", "COMP 5")

#renda
#A	Nenhuma renda.
#B	Até R$ 954,00.
#C	De R$ 954,01 até R$ 1.431,00.
#D	De R$ 1.431,01 até R$ 1.908,00.
#E	De R$ 1.908,01 até R$ 2.385,00.
#F	De R$ 2.385,01 até R$ 2.862,00.
#G	De R$ 2.862,01 até R$ 3.816,00.
#H	De R$ 3.816,01 até R$ 4.770,00.
#I	De R$ 4.770,01 até R$ 5.724,00.
#J	De R$ 5.724,01 até R$ 6.678,00.
#K	De R$ 6.678,01 até R$ 7.632,00.
#L	De R$ 7.632,01 até R$ 8.586,00.
#M	De R$ 8.586,01 até R$ 9.540,00.
#N	De R$ 9.540,01 até R$ 11.448,00.
#O	De R$ 11.448,01 até R$ 14.310,00.
#P	De R$ 14.310,01 até R$ 19.080,00.
#Q	Mais de R$ 19.080,00.

resultado <- dados %>% filter(Q006 != "NA") %>% group_by(Q006) %>% summarise(quantidade = n()) %>% arrange(desc(quantidade)) %>% collect()

#presença
#0 - Faltou à prova
#1 - Presente na prova
#2 - Eliminado na prova
#dados %>% filter(TP_PRESENCA_CH != "NA" && TP_PRESENCA_CN != "NA" && TP_PRESENCA_LC != "NA" && TP_PRESENCA_MT != "NA") %>% 
#group_by(TP_PRESENCA_CH, TP_PRESENCA_CN, TP_PRESENCA_LC, TP_PRESENCA_MT) %>% summarise(quantidade = n()) %>% arrange(desc(quantidade))

#media de notas entre MG e SP
#teste <- dados %>% filter(SG_UF_RESIDENCIA %in% c("MG", "SP") & NU_NOTA_MT > 0 & NU_NOTA_CH > 0) %>% group_by(SG_UF_RESIDENCIA) %>% 
#summarise(mediaNotasMT = mean(NU_NOTA_MT), mediaNotasCN = mean(NU_NOTA_CN), mediaNotasCH = mean(NU_NOTA_CH), mediaNotasLC = mean(NU_NOTA_LC))

#ranking de escolas
consulta <- dados %>% group_by(CO_ESCOLA,NO_MUNICIPIO_ESC,SG_UF_ESC,TP_ESCOLA) %>% 
  summarise(quantParticipantes = n(), mediaNotasMT = round(mean(NU_NOTA_MT),3), mediaNotasCN = round(mean(NU_NOTA_CN),3), mediaNotasCH = round(mean(NU_NOTA_CH),3), mediaNotasLC = round(mean(NU_NOTA_LC),3), mediaNotasRedacao = round(mean(NU_NOTA_REDACAO),3)) %>%  
  mutate(mediaGeral = round(((mediaNotasMT+mediaNotasCN+mediaNotasCH+mediaNotasLC+mediaNotasRedacao)/5),3)) %>% arrange(desc(mediaGeral))

consulta$TP_ESCOLA <- str_replace(consulta$TP_ESCOLA, "1", "Não respondeu")
consulta$TP_ESCOLA <- str_replace(consulta$TP_ESCOLA, "2", "Pública")
consulta$TP_ESCOLA <- str_replace(consulta$TP_ESCOLA, "3", "Privada")
consulta$TP_ESCOLA <- str_replace(consulta$TP_ESCOLA, "4", "Exterior")

colnames(consulta) <- c("Código Escola", "Município", "Estado", "Tipo Escola", "Participantes", "Média MT", "Média CN", "Média CH", "Média LC", "Média Redação", "Média Geral")

notaMediaCH <- round(dados %>% filter(NU_NOTA_CH > 0) %>% summarise(mediaCH = mean(NU_NOTA_CH)),2)
notaMediaLC <- round(dados %>% filter(NU_NOTA_LC > 0) %>% summarise(mediaLC = mean(NU_NOTA_LC)),2)
notaMediaCN <- round(dados %>% filter(NU_NOTA_CN > 0) %>% summarise(mediaCN = mean(NU_NOTA_CN)),2)
notaMediaMT <- round(dados %>% filter(NU_NOTA_MT > 0) %>% summarise(mediaMT = mean(NU_NOTA_MT)),2)

notasMediasTipoEscola <- dados %>% filter(NU_NOTA_MT > 0 & NU_NOTA_CH > 0 & NU_NOTA_CN > 0 & NU_NOTA_LC > 0) %>% group_by(TP_ESCOLA) %>%summarise(mediaNotasMT = round(mean(NU_NOTA_MT),3), mediaNotasCN = round(mean(NU_NOTA_CN),3), mediaNotasCH = round(mean(NU_NOTA_CH),3), mediaNotasLC = round(mean(NU_NOTA_LC),3), mediaNotasRedacao = round(mean(NU_NOTA_REDACAO),3))
notasMediasTipoEscola <- as.data.frame(notasMediasTipoEscola)
notasMediasTipoEscola$TP_ESCOLA <- str_replace(notasMediasTipoEscola$TP_ESCOLA, "1", "Não respondeu")
notasMediasTipoEscola$TP_ESCOLA <- str_replace(notasMediasTipoEscola$TP_ESCOLA, "2", "Pública")
notasMediasTipoEscola$TP_ESCOLA <- str_replace(notasMediasTipoEscola$TP_ESCOLA, "3", "Privada")
notasMediasTipoEscola$TP_ESCOLA <- str_replace(notasMediasTipoEscola$TP_ESCOLA, "4", "Exterior")

ui <- dashboardPage(
  
  dashboardHeader(
    
    title = "ENEM Dashboard",
    titleWidth = 200
  ),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    tags$style(type="text/css", ".alinhamento {color: black;height:40px;display:flex;align-items: center;justify-content: center;}"),
    tags$style(type="text/css", ".cor {background-color: white;"),
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
    tabsetPanel(
      id = "tabs",
      tabPanel(
        title = "Participantes",
        value = "page1",
        fluidRow(
          valueBoxOutput("idadeMedia", width = 3),
          valueBoxOutput("braille", width = 3),
          valueBoxOutput("treineiro", width = 3),
          valueBoxOutput("canhoto", width = 3)
        ),
        fluidRow(
          column(6,
                 plotOutput("test_6")
          ),
          column(6,
                 plotOutput("test_15")    
          )
        ),
        fluidRow(
          column(6,
                 plotOutput("test_11")
          ),
          column(6,
                 plotOutput("test_16")
          )
        ),
        fluidRow(
          column(6,
                 tags$div(id="test_50", style="width:100%;height:300px;"), 
                 deliverChart(div_id = "test_50")
          ),
          column(6,
                 tags$div(id="test_51", style="width:100%;height:300px;"), 
                 deliverChart(div_id = "test_51")
          )
        )
      ),
      tabPanel(
        title = "Resultados",
        fluidRow(
          valueBoxOutput("presentesLC", width = 3),
          valueBoxOutput("presentesCH", width = 3),
          valueBoxOutput("presentesCN", width = 3),
          valueBoxOutput("presentesMT", width = 3)
        ),
        fluidRow(
          tags$h3(class = "alinhamento", "Competências dos alunos na redação do ENEM por tipo de escola")
        ),
        fluidRow(
          column(12,
                 tags$div(id="test_2", style="width:100%;height:300px;"),
                 deliverChart(div_id = "test_2")
          )
        ),
        fluidRow(class = "cor",
                 tags$h3(class = "alinhamento", "Média de notas dos alunos no ENEM por tipo de escola")
        ),
        fluidRow(class = "cor",
                 column(6,
                        plotOutput("test_62") 
                 ),
                 column(6,
                        plotOutput("test_63") 
                 )
        ),
        fluidRow(class = "cor",
                 column(6,
                        plotOutput("test_60") 
                 ),
                 column(6,
                        plotOutput("test_61") 
                 )
        ),
        fluidRow(class = "cor",
                 column(3,
                        fluidRow(
                          tags$h3(class = "alinhamento", "Presentes 1º Dia")
                        ),
                        tags$div(id="test_70", style="width:100%;height:300px;"),
                        deliverChart(div_id = "test_70")
                 ),
                 column(3,
                        fluidRow(
                          tags$h3(class = "alinhamento", "Presentes 2º Dia")
                        ),
                        tags$div(id="test_71", style="width:100%;height:300px;"),
                        deliverChart(div_id = "test_71")
                 ),
                 column(6,
                        fluidRow(
                          tags$h3(class = "alinhamento", "Histograma das notas de redação")
                        ),
                        plotOutput("test_75") 
                 )
        ),
        fluidRow(class = "cor",
                 column(9,
                        plotOutput("test_80")
                 ),
                 column(3,
                        tags$h4(class="alinhamento", "Legenda"),
                        tags$li("A - Nenhuma renda."),
                        tags$li("B - Até R$ 954,00."),
                        tags$li("C - De R$ 954,01 até R$ 1.431,00."),
                        tags$li("D - De R$ 1.431,01 até R$ 1.908,00."),
                        tags$li("E - De R$ 1.908,01 até R$ 2.385,00."),
                        tags$li("F - De R$ 2.385,01 até R$ 2.862,00."),
                        tags$li("G - De R$ 2.862,01 até R$ 3.816,00."),
                        tags$li("H - De R$ 3.816,01 até R$ 4.770,00."),
                        tags$li("I - De R$ 4.770,01 até R$ 5.724,00."),
                        tags$li("J - De R$ 5.724,01 até R$ 6.678,00."),
                        tags$li("K - De R$ 6.678,01 até R$ 7.632,00."),
                        tags$li("L - De R$ 7.632,01 até R$ 8.586,00."),
                        tags$li("M - De R$ 8.586,01 até R$ 9.540,00."),
                        tags$li("N - De R$ 9.540,01 até R$ 11.448,00."),
                        tags$li("O - De R$ 11.448,01 até R$ 14.310,00."),
                        tags$li("P - De R$ 14.310,01 até R$ 19.080,00."),
                        tags$li("Q - Mais de R$ 19.080,00.")
                 )
        )
      ),
      tabPanel(
        title = "Ranking de escolas",
        fluidRow(
          DT::dataTableOutput("tabela")
        )
      )
    )
  )
)

server <- function(input, output, session) {
  
  output$idadeMedia <- renderValueBox({
    valueBox(idadeMedia, "Idade mÃ©dia", icon = icon("users"), color="green")  
  })
  
  output$braille <- renderValueBox({
    valueBox(provaBraille, "Braille", icon = icon("pencil"), color="blue")  
  })
  
  output$treineiro <- renderValueBox({
    valueBox(treineiros, "Alunos treineiros", icon = icon("address-card"), color="yellow")  
  })
  
  output$canhoto <- renderValueBox({
    valueBox(canhoto, "Mesas canhotos", icon = icon("address-book"), color="red")  
  })
  
  output$presentesLC <- renderValueBox({
    valueBox(notaMediaLC, "Nota média LC", icon = icon("pencil"), color="green")  
  })
  
  output$presentesCH <- renderValueBox({
    valueBox(notaMediaCH, "Nota média CH", icon = icon("address-book"), color="blue")  
  })
  
  output$presentesCN <- renderValueBox({
    valueBox(notaMediaCN, "Nota média CN", icon = icon("atom"), color="yellow")  
  })
  
  output$presentesMT <- renderValueBox({
    valueBox(notaMediaMT, "Nota média MT", icon = icon("balance-scale"), color="red")  
  })
  
  output$test_15 <- renderPlot({
    ggplot(data = sexo, 
           aes(x = "", y = porcentagem, fill = TP_SEXO))+
      geom_bar(stat = "identity")+
      coord_polar("y", start = 200) +
      geom_text(aes(y = lab.pos, label = paste(porcentagem,"%", sep = "")), col = "white") +
      theme_minimal() + ggtitle( "Sexo dos participantes" ) +
      scale_fill_brewer(palette = "Paired")
  })
  
  output$test_6 <- renderPlot({ggplot(alunosEstado) +
      aes(x = SG_UF_RESIDENCIA, fill = SG_UF_RESIDENCIA, weight = quantAlunos) +
      geom_bar() +
      scale_fill_hue() +
      labs(x = "Estados", y = "Quantidade", title = "Quantidade de alunos por estado", fill = "Estados") +
      theme_minimal()})
  
  output$test_11 <- renderPlot({ ggplot(conclusaoEM) +
      aes(x = `c("Já concluí o Ensino Médio", "Estou cursando e concluirei o Ensino Médio em 2015", `, fill = TP_ST_CONCLUSAO, weight = quant) +
      geom_bar() +
      scale_fill_gradient() +
      labs(x = "Situação", y = "Quantidade", title = "Conclusão do EM", fill = "Legenda") +
      coord_flip() +
      theme_minimal() })
  
  output$test_16 <- renderPlot({
    ggplot(data = linguaEstrangeira, 
           aes(x = "", y = porcentagem, fill = TP_LINGUA))+
      geom_bar(stat = "identity")+
      coord_polar("y", start = 200) +
      geom_text(aes(y = lab.pos, label = paste(porcentagem,"%", sep = "")), col = "white") +
      theme_void() + ggtitle( "Língua Estrangeira" ) +
      scale_fill_brewer(palette = "Set1")
  })
  
  output$test_62 <- renderPlot({
    ggplot(notasMediasTipoEscola) +
      aes(x = TP_ESCOLA, fill = TP_ESCOLA, weight = mediaNotasLC) +
      geom_bar() +
      scale_fill_viridis_d(option = "cividis") +
      labs(x = "Tipo Escola", y = "Média Notas", title = "Linguagens, Códigos e suas Tecnologias", fill = "Legenda") +
      theme_minimal()
  })
  
  output$test_63 <- renderPlot({
    ggplot(notasMediasTipoEscola) +
      aes(x = TP_ESCOLA, fill = TP_ESCOLA, weight = mediaNotasCH) +
      geom_bar() +
      scale_fill_viridis_d(option = "cividis") +
      labs(x = "Tipo Escola", y = "Média Notas", title = "Ciências Humanas e suas Tecnologias", fill = "Legenda") +
      theme_minimal() +
      ylim(0L, 650L)
  })
  
  output$test_60 <- renderPlot({
    ggplot(notasMediasTipoEscola) +
      aes(x = TP_ESCOLA, fill = TP_ESCOLA, weight = mediaNotasMT) +
      geom_bar() +
      scale_fill_viridis_d(option = "cividis") +
      labs(x = "Tipo Escola", y = "Média Notas", title = "Matemática e suas Tecnologias", fill = "Legenda") +
      theme_minimal()
  })
  
  output$test_61 <- renderPlot({
    ggplot(notasMediasTipoEscola) +
      aes(x = TP_ESCOLA, fill = TP_ESCOLA, weight = mediaNotasCN) +
      geom_bar() +
      scale_fill_viridis_d(option = "cividis") +
      labs(x = "Tipo Escola", y = "Média Notas", title = "Ciências da Natureza e suas Tecnologias", fill = "Legenda") +
      theme_minimal()
  })
  
  output$test_75 <- renderPlot({
    ggplot(dados) +
      aes(x = NU_NOTA_REDACAO, colour = NU_NOTA_REDACAO) +
      geom_histogram(bins = 30L, fill = "#0c4c8a") +
      scale_color_gradient() +
      labs(x = "Nota redação", y = "Quantidade") +
      theme_minimal()
  })
  
  output$test_80 <- renderPlot({
    ggplot(resultado) +
      aes(x = Q006, fill = Q006, weight = quantidade) +
      geom_bar() +
      scale_fill_hue() +
      labs(x = "Grupo", y = "Quantidade", title = "Renda dos participantes do ENEM", fill = "Legenda") +
      theme_minimal()
  })
  
  renderPieChart(div_id = "test_50", data = nacionalidade, theme = "shine", radius = "75%", show.label = FALSE)
  
  renderPieChart(div_id = "test_51", data = localizacao, theme = "shine", radius = "75%")
  
  
  renderLineChart(div_id = "test_2", theme = "shine", data = competenciasRedacao)
  
  porcentagemDia1 <- round(quantPresentes1dia/(nrow(dados)) * 100,1)
  porcentagemDia2 <- round(quantPresentes2dia/(nrow(dados)) * 100,1)
  
  renderGauge(div_id = "test_70", gauge_name = "", rate = porcentagemDia1, theme = "default", animation = TRUE)
  
  renderGauge(div_id = "test_71", gauge_name = "", rate = porcentagemDia2, theme = "default", animation = TRUE, show.tools = TRUE)
  
  output$tabela <- DT::renderDataTable({
    DT::datatable(consulta, options = list(lengthMenu = c(5, 30, 50), pageLength = 15))
  })
}

shinyApp(ui, server)