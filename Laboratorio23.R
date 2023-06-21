# Laboratorio 23

library(readxl)
df = read
library (tidyverse)

view(df)

df = df[-1:-3,] # eliminado filas
view(df)

df=df[,c(-1,-24)] # eliminado columnas
view(df)


colnames(df)

df=df%>%
  rename(region=dpto)

colnames(df)
view (df)

df=df%>%
  rename(IRGP= `Indice Regional`)

df$Grupo = ifelse(df$IRGP >= 0.7, "Grupo1",
                  ifelse(df$IRGP>= 0.55, 'Grupo2', 'Grupo3'))

view(df)

# posicionar una columna en otro lugar

df1 = df[,24:1]
view (df1)


df1=df[,c(23,10,1:20)]
view(df1)

df$Grupo = as.factor(df$Grupo)


# Agrupar
promedio = df%>%
  group_by(Grupo) %>%
  summarise(promedio=mean(IRGP))

promedio

# Ordenar
df1= df%>%
  arrange(desc(IRGP))
view(df1)


df1 = df1[,c(24,1:23)]
view (df1)


# Relacion entre variables
library (ggplot2)

colnames(df)

df=df%>%
  rename(Cobertura1 = `Cobertura de agua`, cobertura2= `Cobertura de desagüe`)


ggplot(data=df, aes(x=Cobertura1, y= cobertura2))+
  geom_point()+
  geom_smooth(method='lm',na.rm = TRUE)

view(df)
colnames(df)
# Correlacion
df %>%
  select(`PROMEDIO SA`, `PROMEDIO ED`,`PROMEDIO IS`, `PROMEDIO IF`,IRGP) %>%
  cor(method='pearson')


# Correlacion con p value
df %>%
  cor.test(~IRGP+ `PROMEDIO ED`,data=.)


library(corrplot)

df2=df%>%
  select(`PROMEDIO SA`, `PROMEDIO ED`,`PROMEDIO IS`, `PROMEDIO IF`,IRGP)
  
correlacion=cor(df2,method = 'pearson', use='pairwise.complete.obs')

colores= colorRampPalette(c('#BB4444','#EE9988','#FFFFFF',
                            '#77AADD','#4477AA'))

corrplot(correlacion,method='color',type='upper',
         addCoef.col = 'black',tl.col = 'black',
         tl.srt = 45)

# PRUEBA ANOVA
?aov

df3= df%>%
  select(`PROMEDIO SA`, `PROMEDIO ED`,`PROMEDIO IS`, `PROMEDIO IF`,Grupo)%>%
  filter(Grupo== 'Grupo1' | Grupo =='Grupo2')
view(df3)

anova= aov(`PROMEDIO SA`~`PROMEDIO ED`, data=df3)
summary(anova)


# Regresion lineal
# SOLO SI SE TIENE NA EN EL DATASET
df4%>%
  filter(IRGP != 'NA', REGION != 'NA')

map(df,~sum(is.na(.))) # NO HAY MISSING

df=df%>%
  rename(Instituciones=`PROMEDIO IS`, Salud = `PROMEDIO SA`,
         Educacion=`PROMEDIO ED`, Conect=`PROMEDIO IF`)


view(df)
rl=lm(Instituciones~IRGP, data=df)
summary(rl)


rl2= lm(Educacion~IRGP, data=df)
summary(rl2)
