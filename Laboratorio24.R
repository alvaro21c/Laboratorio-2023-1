# VIERNES 23 SE CUELGA EL TRABAJO GRUPAL

# MARTES 27 A LAS 11:59 PM VENCE PLAZO DEL TRABAJO GRUPAL

# SABADO 24/06 LABORATORIO PENDIENTE: 
#MITAD ASESORIA/MITADA PLICACIONES CON SHINY PARTE

# LUNES 26 CLASE SE DIVIDE EN 2: APLICACIONES CON SHINY2, REPASO GENERAL

# MIERCOLES 28/06 TRABAJO/EXAMEN FINAL DE R

# OPCIONES LABORATORIO PENDIENTE: SABADO DE 12-2 PM, SABADO DE 2-4, 4-6


#MAPA COROPLETICO

install.packages('rgdal')
install.packages('rgeos')
install.packages('sp')
install.packages('tmap')
install.packages('leaflet')
library(dplyr)

library (rgdal)
library(rgeos)
library(sp)
library(dplyr)
library(tmap)
library(leaflet)
library(readxl)

mapa = readOGR("C:/Users/alvar/Documents/MAPA/dp.shp")

df= read_excel("C:/Users/alvar/Downloads/proyectos (1).xlsx")


names(mapa)
names(df)

names(mapa)[2]='DEPARTAMENTO'
names(df)[2]='DEPARTAMENTO'


library(tidyverse)
view(df)

df1= df%>%
  group_by(DEPARTAMENTO) %>%
  summarise(Total=n())

grafico = merge(mapa,df1,by='DEPARTAMENTO')

tmap_options(check.and.fix = TRUE)

qtm(grafico,fill='Total',col='col_blind')


qtm(grafico, fill = 'Total', palette='Bugn',
    scale=0.7, fill.title='Proyectos',
    title.font=1,stil.style='fixed', title.fontface=2,
    fill.breaks=round(c(seq(0,200,length.out=4),Inf)),0)


# Regresion
getwd()
df2= read_csv('C:/Users/alvar/Documents/vuelos.csv',
              col_types = cols('DivDistance'=col_number(),
                               'DivArrDelay'=col_number()))

# Crear un nuevo df

rm(final)

UA = df2%>%
  filter(CarrierDelay!='NA', Reporting_Airline=='UA')

regresion = lm(ArrDelayMinutes ~ DepDelayMinutes, data=UA)
summary(regresion)

regresion$coefficients

# y'=21.69 + 0.81*DepDelayMinutes

# crear valores para predecir
valores= data.frame(DepDelayMinutes=c(10,15,20))

#predecir
pred = predict(regresion,newdata = valores, interval='confidence')
pred


# Regresion con mas variables
regresion2= lm(ArrDelayMinutes~DepDelayMinutes+WeatherDelay,data=UA)
summary(regresion2)


# Representacion grafica
library(ggplot2)

ggplot(UA,aes(x=DepDelayMinutes,y=ArrDelayMinutes))+
  geom_point()+
  stat_smooth(method='lm',col='blue')

# Grafico de residuos
prediccion= lm(ArrDelayMinutes~DepDelayMinutes, data=UA)
UA$pred=predict(prediccion)


ggplot(UA,aes(x=DepDelayMinutes,y=ArrDelayMinutes))+
  geom_smooth(method='lm',
              se=FALSE,color='red')+
  geom_segment(aes(xend=DepDelayMinutes,yend=
                     pred), alpha=.2)+
  geom_point()+
  geom_point(aes(y=pred),shape=1)+
  theme_bw()

ggplot(lm(ArrDelayMinutes~DepDelayMinutes, data= UA))+
  geom_point(aes(x=DepDelayMinutes,y=.resid))


summary(regresion)$r.squared
summary(regresion2)$r.squared


# ERROR CUADRADO PROMEDIO

x=mean(regresion$residuals^2)
x


y=mean(regresion2$residuals^2)
y
