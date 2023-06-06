data(mtcars)
mtcars$cyl_f=as.factor(mtcars$cyl)


library(tidyverse)
library(ggplot2)

ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point(aes(color=cyl_f))+
  geom_text(aes(label=rownames(mtcars)))


ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point(aes(color=cyl_f))+
  geom_text(aes(label=rownames(mtcars)),
            check_overlap = TRUE, hjust=0.5)

# Poner texto en el grafico
x=median(mtcars$mpg)

ggplot(mtcars,aes(x=mpg))+
  geom_histogram(bins=10)+
  labs(x='Millas x galon',
       y='Total',
       title='Grafico con anotacion')+
  geom_vline(aes(xintercept=19.2),
             color='blue')+
  annotate(geom='text',
           label='Mediana 19.2',
           x=21,
           y=10,
           hjust=0,
           color='red')

# Dividir graficos x tipo de variable
ggplot(mtcars,aes(x=mpg))+
  geom_histogram()+
  facet_wrap(.~cyl_f)

ggplot(mtcars,aes(cyl_f))+geom_bar()+theme_dark()
ggplot(mtcars,aes(cyl_f))+geom_bar()+theme_gray()
ggplot(mtcars,aes(cyl_f))+geom_bar()+theme_void()
ggplot(mtcars,aes(cyl_f))+geom_bar()+theme_linedraw()
ggplot(mtcars,aes(cyl_f))+geom_bar()+theme_bw()
# minimal, light, classic

# Paletas de colores
#ACCENT, SET1, DARK2,Greys,BLUES,BuGn,Greens,PAIRED


ggplot(mtcars,aes(x=cyl_f,fill=cyl_f))+
  geom_bar()+
  scale_fill_brewer(palette = 'Accent')


ggplot(mtcars,aes(x=cyl_f,fill=cyl_f))+
  geom_bar()+
  scale_fill_brewer(palette = 'Set1')


ggplot(mtcars,aes(x=cyl_f,fill=cyl_f))+
  geom_bar()+
  scale_fill_brewer(palette = 'Dark2')

ggplot(mtcars,aes(x=cyl_f,fill=cyl_f))+
  geom_bar()+
  scale_fill_brewer(palette = 'Greys')

ggplot(mtcars,aes(x=cyl_f,fill=cyl_f))+
  geom_bar()+
  scale_fill_brewer(palette = 'Blues')

ggplot(mtcars,aes(x=cyl_f,fill=cyl_f))+
  geom_bar()+
  scale_fill_brewer(palette = 'BuGn')


ggplot(mtcars,aes(x=cyl_f,fill=cyl_f))+
  geom_bar()+
  scale_fill_brewer(palette = 'Greens')

install.packages('ggthemes')
library(ggthemes)

x=ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point()+
  xlab('Caballos de fuerza')+
  ylab('Millas x galon')+
  ggtitle('Grafico de dispersion')

?ggthemes
x+theme_economist()+scale_color_economist()
x+theme_clean()+scale_color_colorblind()
x+theme_economist_white()+scale_color_brewer()



# Correlacion
install.packages('corrplot')
library(corrplot)
data(mtcars)
df=mtcars[,-c(8,9,12)] #quitamos las variables dicotomicas

corrplot(cor(df)) # grafico de correlacion

heatmap(cor(df),Rowv=NA, Colv=NA,revC = TRUE)


# Grafico de barras horizontales
mtcars=mtcars%>%
mutate(cyl_f=as.factor(cyl))  

ggplot(mtcars,aes(x=cyl_f))+
  geom_bar()+
  coord_flip()


# Crear valores
x= c('U','AL','SC','U','AL','SC')
y=c(rep('SI',3),rep('NO',3))
z=c(1,3,2,3,2,4)
x
y
z

df=data.frame(equipo=x,resp=y,result=z)
df

ggplot()+
  geom_bar(data=df,aes(x=equipo,y=result,fill=resp),
           stat='identity',position='dodge')+
  coord_flip()
  
df


# Grafico de alfiler
x=factor(c('U','AL','SC'))
y=c('26','25','20')

df1=data.frame(equipo=x,total=y)
df1

ggplot()+
  geom_point(data=df1,aes(x=total,y=equipo,color=equipo),size=4)+
  geom_segment(data=df1,aes(x=0,y=equipo,xend=total,
                            yend=equipo,color=equipo),size=1)+
  theme(legend.position ='none',
        axis.text.x=element_text(angle=0,vjust = 0.5,hjust=0.5))+
  labs(x='Titulos',
       y='Equipos',
       title='Grafico alfiler de equipos')


# Grafico de burbuja
personajes=c('Batman','Spiderman','Ironman','Superman','Thor',
             'Flash','Capitan America','Lintena Verde')
x=rnorm(8,25,10)
y=rnorm(8,25,10)
size=rnorm(8,25,10)


?rnorm

color=c(rep('blue',2),rep('orange',2),rep('green',2),rep('yellow',2))
df2=data.frame(personaje=personajes,x=x,y=y,tamaño=size,color=color)
df2
ggplot(df2,aes(x=x,y=y,label=personaje))+
  geom_point(aes(size=tamaño,colour=color))+
  geom_text(hjust=1,size=2)


# Grafico de area

equipo=c(rep('U',5),rep('AL',5),rep('SC',5))
year=c(2000:2004,2000:2004,2000:2004)
total=rnorm(15,25,10)


df3=data.frame(equipo=equipo,year=year,total=total)

ggplot(df3,aes(x=year,y=total))+
  geom_area(aes(fill=equipo))
