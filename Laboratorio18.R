# Laboratorio 18
data()

install.packages('ggplot2') # instala solo 1 vez
library(ggplot2) # esto si es necesario para cada vez que se inicie R

mtcars
?mtcars

recuento = table(mtcars$cyl)
recuento
data("mtcars")
barplot(recuento)



summary(mtcars)

# qplot
qplot(data=mtcars,x=cyl,geom='bar')

ggplot(mtcars,aes(x=hp,y=mpg,color=factor(cyl),
                  shape=factor(cyl)))+geom_point()

cyl_f=as.factor(mtcars$cyl)

#qplot
qplot(data=mtcars,x=cyl,geom='bar')
qplot(mtcars$cyl,fill=I('blue'),geom='bar')
qplot(mtcars$cyl,colour=I('blue'), geom='bar')
qplot(mtcars$cyl,fill=I('white'),colour=I('blue'),geom='bar')


qplot(mtcars$cyl,geom='bar', fill=I('steelblue'),xlab='Cilindros',
      ylab='Total de carros')


qplot(mtcars$cyl,geom='bar',fill=I('steelblue'),colour=I('white'),
      xlab = 'Cilindros',ylab = 'Total',main = 'Grafico1')



# Graficos pastel y variaciones del graficos de barras
install.packages('tidyverse')
library(tidyverse)

# operador pip %>%

mtcars= mtcars %>%
  mutate(cyl_f=as.factor(cyl))
  
mtcars$cyl_f=as.factor(mtcars$cyl)


ggplot(data=mtcars,aes(x=cyl_f,fill=cyl_f))+
  geom_bar()


ggplot(data=mtcars,aes(x=cyl_f,
                       fill=cyl_f))+
                       geom_bar(position='stack')+
                      coord_polar(theta='y')

ggplot(data=mtcars,aes(x='',
                       fill=cyl_f))+
  geom_bar(position='stack') # agrupa todo en una barra


ggplot(data=mtcars,aes(x='',fill=cyl_f))+
  geom_bar(position='stack')+
  coord_polar(theta='y')+
  scale_fill_brewer(palette='Dark2')+
  theme_minimal()

# Grafico de histogramas
qplot(mtcars$hp,geom='histogram')
qplot(mtcars$hp,geom='histogram',binwidth=25)
qplot(mtcars$hp,geom='histogram',binwidth=25,
      colour=I('black'))
qplot(mtcars$hp,geom='histogram',binwidth=2,
      colour=I('black'),xlim=c(80,200))


# Grafico de dispersion
qplot(mpg,hp,data=mtcars)
ggplot(mtcars,aes(x=mpg,y=hp))+geom_point()

ggplot(mtcars,aes(x=mpg,y=hp))+geom_point(shape=25)
# El shape es la indicacion numerica para el tipo de forma del punto

ggplot(mtcars,aes(x=mpg,y=hp,shape=cyl_f,
                  colour=cyl_f))+geom_point()
ggplot(mtcars,aes(x=mpg,y=hp,shape=cyl_f))+
  geom_point(color='steelblue')



ggplot(mtcars,aes(x=mpg,y=hp,color=cyl_f))+
  geom_point()+
  xlab('Millas por galon')+
  ylab('Caballos de fuerza')+
  labs(colour='Tipo de auto x Cilindros')+
  ggtitle('Comparacion entre MPG Y HP')

# Grafico de linea
?EuStockMarkets
data("EuStockMarkets")


ggplot(EuStockMarkets,aes(x='DATE',y='DAX')) + geom_line()

df=as.data.frame(EuStockMarkets)
df$date = as.numeric(time(EuStockMarkets))
df1$Fecha=as.date
ggplot(df,aes(x=date,y=DAX))+geom_line()
ggplot(df,aes(x=date,y=DAX))+geom_line(size=0.5,color='steelblue')

library(tidyverse)
ggplot(df,aes(x=date))+
  geom_line(aes(y=DAX),color='blue')+
  geom_line(aes(y=SMI),color='red')+
  scale_color_manual(name='Series',
                     values=c('DAX'='darkblue','SMI'='red'))





# Grafico de cajas/boxplot/bigote
install.packages('plotly')
library(plotly)

x=ggplot(mtcars,aes(y=mpg))+geom_boxplot()
ggplotly(x)


ggplot(mtcars,aes(y=mpg))+geom_boxplot()

ggplot(mtcars,aes(x=cyl_f,y=mpg)) + geom_boxplot()
