

library(readxl)
getwd()

library(tidyverse)
df=read_csv("C:/Users/alvar/Documents/vuelos.csv",
            col_types=cols('DivDistance'=col_number(),
                          'DivArrDelay'= col_number()))
            



view(df)

# operador pipe
df %>%
  filter (Month==2) %>%
  summarize(promedio=mean(CarrierDelay))

# Missing/NA
df%>%
  summarize(NAs=sum(is.na(CarrierDelay)))



df%>%
  filter(Month==2) %>%
  summarize(promedio=mean(CarrierDelay,na.rm=TRUE))


df %>%
  filter (Month==2) %>%
  group_by(Reporting_Airline) %>%
  summarize(promedio=mean(CarrierDelay,na.rm=TRUE))
  

df1=df%>%
  group_by(Reporting_Airline) %>%
  summarize(Promediom = mean(CarrierDelay, na.rm=TRUE))

view(df1)


df2=df%>%
  filter(Reporting_Airline=='HP')

df2=df%>%
  filter(Reporting_Airline=='TW')



# Calcular para todas las NA

df%>%
  group_by(Reporting_Airline)%>%
  summarize(total=sum(is.na(WeatherDelay)))



df%>%
  group_by(Reporting_Airline)%>%
  summarize(promedio=mean(WeatherDelay,na.rm = TRUE))


map(df,~sum(is.na(.))) # calcula las NAN para todas las columnas


# Eliminar datos (columnas)
df3= df%>%
  select(-CarrierDelay,-WeatherDelay)


# Eliminar filas (NA)
 df4= df%>%
   drop_na(CarrierDelay)

 
 # Reeemplazar los NAN
df5=df%>%
  replace_na(list(CarrierDelay=0,WeatherDelay=0))

df5%>%
  summarise(total=sum(is.na(CarrierDelay)))

df5%>%
  summarise(total=sum(is.na(WeatherDelay)))

# Separar una variable
df6= df%>%
  separate(FlightDate,sep='-',into=c('year','mes','dia'))

view(df6)

