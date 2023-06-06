pelicula = c('Toy Story','El club de la pelea','Argo')
pelicula

# Tipo de datos boolean
pelicula == 'Argo'
pelicula == 'argo'

estreno = c(1995,1999,2015)

pelicula[4]='Magallanes'
pelicula[5]='La ultima tarde'
pelicula[6]='Retablo'

pelicula

estreno=c(1995,1999,2015,2015:2017)
estreno

length(pelicula)

marvel = c('Capitán América: El primer vengador',
           'Capitana Marvel','Iron Man','Iron Man 2',
           'El increible Hulk','Thor','Avengers',
           'Thor:mundo oscuro',
           'Iron Man 3','Capitan america: soldado de invierno',
           'Guardianes de la galaxia','Guardianes de la galaxia vol2','Avengers: Era de Ultron',
           'Ant man','Capitan america:civil war','Spiderman Homecoming','Black Widow','Black Panther','Dr Strange','Thor Ragnarok',
           'Ant man 2','Avengers Infiniy War','Avengers Endgame')

head(marvel)
tail(marvel)

head(marvel,10)
tail(marvel,8)

sort(marvel) #ascendente
marvel

marvel=sort(marvel,decreasing=TRUE) # ordena en forma descendente
marvel


# Asociar elementos
interacciones=c(599948,268782,229547,178552,85844)
min(interacciones)
max(interacciones)


names(interacciones)=c('The Batman','Doctor Strange',
                       'Thor','Spiderman','Black Panther')
interacciones


interacciones[c('The Batman','Spiderman')]

interacciones[5] = interacciones[5]+15000
interacciones

interacciones=interacciones-10000
interacciones

summary(interacciones)

interacciones
interacciones[-5] # saca todos los elementos menos el de posicion 5
interacciones[c(1,3)] # saca los elementos 1 y 3
interacciones[-5:-3] # del 1 al 2.
pelicula
restricciones = c(5,14,14,NA,14,NA)

is.na(restricciones)

pelicula[7]='Volver al futuro'
pelicula[8]='Los intocables'
genero=c('Animacion','Ficcion','Accion','Drama',
         'Drama','Drama','Comedia','Policial')

genero=as.factor(genero)
levels(genero)
summary(genero)

sort(summary(genero),decreasing=TRUE)




calificacion=c('Buenisima','Regular','Buenisima',
               'Mala','Regular','Buena','Buenisima')
factor=factor(calificacion,ordered = TRUE,levels = c('Muy mala',
                                                     'Mala',
                                                     'Regular',
                                                     'Buena',
                                                     'Buenisima'))
factor
summary(factor)

# Listas
lista1=list('Retablo',c('Drama','Ficcion','Historica'),2017)

lista1[2]
lista1[2:3]


equipo = list(name='Universitario de Deportes',year=1924,
              palmares=c(26,22,1))


equipo$name
equipo$year
equipo$palmares

equipo$palmares[3]

peli=list(nombre='Volver al futuro',year=1995,genero=c('Historica',
                                                       'Ficcion',
                                                       'Comedia'))
class(peli$genero)
class(peli$year)
class(peli$nombre)

peli[['restriccion']]=5
peli

peli[['restriccion']]=3
peli


# Concatenar listas
peli1=list(nombre='Gol')
peli2=list(year=2003,genero=c('Ficcion','Drama'))

peli3=c(peli1,peli2)
peli3

# DATAFRAME
pelis=data.frame(pelicula=c('Toy Story','Breakfast club',
                            'Fight Club','Retablo','Pulp fiction',
                            'El padrino','Ciudad de Dios','Ted'),
                 year=c(1995,1985,1999,2017,1991,1980,2005,2017),
                 stringsAsFactors = F)
pelis

pelis[1] # toda la columna
pelis[1,2] # fila 1 y columna 2
pelis[2,1] # fila 2 y columna 1
pelis[2,] # toda la fila 2

head(pelis)
tail(pelis)

seleccion=pelis['pelicula']=='El padrino'
x=pelis[seleccion,'year']
x


pelis['duracion']=c(80,110,120,180,90,130,160,170)
pelis

pelis=rbind(pelis,c(pelicula='El conjunro',year=2013,
            duracion=100))
pelis
