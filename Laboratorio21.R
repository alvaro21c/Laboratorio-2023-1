# Grafico de alfiler
library(readxl)
df=read_excel("C:/Users/alvar/Downloads/OXI.xlsx")
library(tidyverse)
library(ggplot2)
view(df)

colnames(df)
agrupado=df%>%
  group_by(departamento)%>%
  summarise(total=sum(proyectos_oxl))

view(agrupado)

ggplot(agrupado,aes(x=total,y=departamento,label=total))+
  geom_segment(aes(x=0,y=departamento,xend=total,yend=departamento),
               color='blue',size=3)+
  geom_point(color='steelblue',size=15)+
  geom_text(nudge_x = 0,color='white')+
  theme(legend.position = 'none',axis.text.x=element_text(angle=0,
                                                          vjust=0.5,
                                                          hjust=0.5))+
  labs(
    x='Total de proyectos via OxI',
    y='Departamento',
    title='Grafico de Alfiler v2',
    subtitulo= 'Informacion extraida de ProInversion')
  )

agrupado = subset(agrupado,departamento != 'Nacional')
view(agrupado)

ggplot(agrupado,aes(x=total,y=departamento,label=total))+
  geom_segment(aes(x=0,y=departamento,xend=total,yend=departamento),
               color='blue',size=3)+
  geom_point(color='steelblue',size=15)+
  geom_text(nudge_x = 0,color='white')+
  theme(legend.position = 'none',axis.text.x=element_text(angle=0,
                                                          vjust=0.5,
                                                          hjust=0.5))+
  labs(
    x='Total de proyectos via OxI',
    y='Departamento',
    title='Grafico de Alfiler v2',
    subtitulo= 'Informacion extraida de ProInversion')
)


# Para trabajar con valores en proporciones
suma = sum(agrupado$total)
agrupado$prop=(agrupado$total/suma)*100
agrupado$prop=round(agrupado$prop,0)
view(agrupado)

ggplot(agrupado,aes(x=total,y=departamento,label=prop))+
  geom_segment(aes(x=0,y=departamento,xend=total,yend=departamento),
               color='blue',size=3)+
  geom_point(color='steelblue',size=15)+
  geom_text(nudge_x = 0,color='white')+
  theme(legend.position = 'none',axis.text.x=element_text(angle=0,
                                                          vjust=0.5,
                                                          hjust=0.5))+
  labs(
    x='Total de proyectos via OxI',
    y='Departamento',
    title='Grafico de Alfiler v2',
    subtitulo= 'Informacion extraida de ProInversion')
)

df2= head(agrupado,5)

ggplot(df2,aes(x=total,y=departamento,label=prop))+
  geom_segment(aes(x=0,y=departamento,xend=total,yend=departamento),
               color='blue',size=3)+
  geom_point(color='steelblue',size=15)+
  geom_text(nudge_x = 0,color='white')+
  theme(legend.position = 'none',axis.text.x=element_text(angle=0,
                                                          vjust=0.5,
                                                          hjust=0.5))+
  labs(
    x='Total de proyectos via OxI',
    y='Departamento',
    title='Grafico de Alfiler v2',
    subtitulo= 'Informacion extraida de ProInversion')
)


df2023=read_excel("C:/Users/alvar/Downloads/Dato2023.xlsx")
view(df2023)


df2023=read_excel("C:/Users/alvar/Downloads/Dato2023.xlsx",
                  range='A12:I16')
df2023=df2023[-1,]
view(df2023)

df2023$year=2023
install.packages('writexl')

library(writexl)
write_xlsx(df2023,"C:/Users/alvar/Downloads/df2023.xlsx")

df2022=read_excel("C:/Users/alvar/Downloads/Dato2022.xlsx",
                  range='A12:I16')
df2022$year=2022


df2022=df2022[-1,]
view(df2022)
write_xlsx(df2022,"C:/Users/alvar/Downloads/df2022.xlsx")


df2021=read_excel("C:/Users/alvar/Downloads/Datos2021.xlsx",
                  range='A12:I16')


df2021=df2021[-1,]
df2021$year=2021
view(df2021)

final=rbind(df2023,df2022,df2021)
view(final)


colnames(final)
final=final%>%
  rename(Avance=`Avance % `,NG=`Nivel de Gobierno`)
colnames(final)

ggplot(final,aes(x=year,y=Avance,group=NG,colour=NG))+
  geom_line()+
  geom_point(size=2,shape=21,fill='white')+
  theme_minimal()
  


# Corrplot
data(mtcars)
library(corrplot)
corrplot(cor(mtcars),method='number')
