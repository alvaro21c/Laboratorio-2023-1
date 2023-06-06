# TIPOS DE DATOS
# int
x = 1
x<-1

# float
y = 2.5

# variable string
z = 'lunes'

# bool
a=TRUE



# vectores
v = c(98,99,100)
v

w = v[1:2]
w


b=(1:10)
b

b[6:9]

# Modificar datos 

v[3] #es 100

v[3]=110
v[3]
v

# Condicionales

x = 30

if (x>25){
  print ('x es mayor a 25')
} else{
    print ('x es menor o igual a 25')
  }

# iteracion

for(variable in b[1:3]){
  print(variable)
}


x=10
while (x<500){
  x=x+100
}

x

# Funciones basicas

mean(b)

?mean
help(mean)

example(mean)


# Redondear valores
print(sqrt(5),3) # el 3 considera total de caracteres sin el punto
print(sqrt(5),22) # es el maximo valor que se permite
round(sqrt(5),3) # el 3 considera el total de decimales

round(sqrt(5)) # automaticamente redondea sin decimale

# redondear por floor
sqrt(3)
floor(sqrt(3)) # redondea hacia atras, hacia el entero mas prox
sqrt(5)
floor(sqrt(5))

# redondear con ceil
ceiling(sqrt(3))
ceiling(sqrt(5)) # redondea hacia adelante, hacia el entero max prox


# crear funcion
suma = function (a,b,c){
  sum=a+b+c
  return(sum)
}

suma(1,2,3)
rm(suma) # borro la funcion de mi environment

# Matrices

x=(1:12)
x
matrix(x,nrow=4)

matrix(x,nrow=5) # error porque el numero de filas debe ser multiplo de 12

x=(1:10)
matrix(x,nrow=5)

x=(1:12)
matrix(x,ncol=4,byrow=TRUE)
matrix(x,nrow=3,byrow=TRUE)
matrix(x,nrow=3)


# Valores repetidos
matrix(1,nrow=3,ncol=3)

#Operaciones con matrices
U=matrix(1:30,nrow=5)
U

U[2,4] # SACA EL 17
U[,3] # SACA TODA LA COLUMNA 3
U[3,] # SACA TODA LA FILA 3


U[,1:3] # EXTRAE LA COLUMNA 1 A LA COLUMNA 3
U[3,1:3] # EXTRA LO MISMO DE ARRIBA PERO SOLO LA FILA 3

U[4:5,1:3] # EXTRAE LA FILA 4 Y 5 DE LAS COLUmnA 1 A 3

d=diag(U)
d
 
# Otros temas importantes de matrices

a=1:4
b=c(1,3,5,7)
c=rep(0,4)

rbind(a,b,c) # concatenar por filas
cbind(a,b,c) # concatenar por columnas

D=diag(4)
D


rbind(D,a,b,c)
cbind(D,a,b,c)
rbind(a,D,b,c)
cbind(a,b,D,c)


M=cbind(b,c,D,a)
M

colnames(M)=c('COL1','COL2','COL3','COL4','COL5','COL6','COL7')
rownames(M)=c('1','2',
             '3','4')

M

A= matrix(1:30,nrow=5)
nrow(A)
ncol(A)
dim(A)

sum(A)
A

mean(A)
rowSums(A)
colSums(A)
rowMeans(A)
colMeans(A)




genero=c('Animacion','Comedia',
         'Comedia','Animacion','Accion','Drama','Comedia')
genero
genero=as.factor(genero)
summary(genero)
