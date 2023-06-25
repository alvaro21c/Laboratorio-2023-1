# APP 1

install.packages("shiny")
library(shiny)

ui = fluidPage(
  titlePanel("Gastos mensuales"),
  sidebarLayout(
    sidebarPanel(
      numericInput("alquiler","Alquiler:", value=0,min=0),
      numericInput('alimentos','Alimentos:',value=0, min=0),
      numericInput('transporte','Transporte:',value=0,min=0),
      numericInput('estudios','Estudios:',value=0,min=0),
      numericInput('killa','Killa:',value=0,min=0)
    ),
    mainPanel(
      h4('Gastos mensuales:'),
      verbatimTextOutput('total')
    )
  )
)




server = function(input,output) {
  output$total= renderText({
    gastos = input$alquiler + input$alimentos + input$transporte + input$estudios + input$killa
    paste('S/', round(gastos,2))
  })
  
}

shinyApp(ui=ui,server=server)

# APP 2
library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)

ui = fluidPage(
  titlePanel('Gastos mensuales'),
  sidebarLayout(
    sidebarPanel(
      selectInput('mes','Seleccionar mes:', choices = month.name),
      numericInput('Comida','Comida:', value=0, min=0),
      numericInput('killa','Killa:',value=0,min=0),
      numericInput('estudios','Estudios:',value=0,min=0),
      numericInput('plataformas','Plataformas:',value=0,min=0),
      actionButton('grabar','Grabar'),
      actionButton('reset','Limpiar')
    ),
    mainPanel (
      h4('Gastos mensuales:'),
      verbatimTextOutput('total'),
      plotOutput('Grafico1'),
      tableOutput('Tabla1')
    )
  )
)

server = function(input,output, session){
  gastos=reactiveVal(data.frame(mes=character(), 
                                comida = numeric(), 
                                killa = numeric(), 
                                estudios= numeric(), 
                                plataformas=numeric()))
  
  observeEvent(input$grabar,{
    nuevo = data.frame(
      mes=input$mes,
      comida=input$Comida,
      killa=input$killa,
      estudios=input$estudios,
      plataformas=input$plataformas
    )
    
    gastos_data = gastos()
    gastos_data=bind_rows(gastos_data,nuevo)
    gastos_data=gastos_data %>%
      arrange(mes)
    gastos(gastos_data)
  })
  
  observeEvent(input$reset, {
    gastos(data.frame(mes=character(), 
                      comida = numeric(), 
                      killa = numeric(), 
                      estudios= numeric(), 
                      plataformas=numeric()))
  })
  
  output$total= renderText({
    suma= sum(gastos()%>% 
               select(-mes) %>% 
               unlist())
    paste('S/',round(suma,2))
  })
  
  output$Grafico1=renderPlot({
    x=gastos() %>%
      pivot_longer(cols = comida:plataformas, names_to = 'Tipo', values_to = 'gastos')%>%
      mutate(mes=factor(mes,levels=month.name))
    ggplot(x,aes(x=mes,y=gastos, fill=Tipo))+
      geom_col()+
      labs(x='Mes',y='Gastos', title = 'Grafico1')+
      theme_minimal()
  })
  
}

shinyApp(ui=ui,server=server)

# WEB Scrapping
install.packages('rvest')
library(rvest)

link = 'https://www.marathon.store/pe/productos/equipos/equipos-nacionales/universitario/c/43?q=%3Arelevance&device=DESKTOP'
pagina = read_html(link)

promocion = pagina %>%
  html_nodes('.price-promotion') %>%
  html_text()

promocion

df = data.frame(promocion)
head(df)

df = df%>%
  separate(promocion,sep='/', into = c('x','Promocion'))

head(df)


nombre = pagina %>%
  html_nodes('.name') %>%
  html_text()

nombre

df1 = data.frame(nombre)
head(nombre)

df1 = df1%>%
  separate(nombre,sep='\n', into = c('x','nombre'))

df1
