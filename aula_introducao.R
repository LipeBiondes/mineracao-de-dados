#install.packages(c("tidyverse", "rmarkdown", "devtools"))

library(tidyverse)

x <- 1
class(x)

y <- "a"
class(y)

class(mtcars)

vetor1 <- c(1, 5, 3,-10)
vetor2 <- c("a", "b", "c")

vetor1
vetor2

1:10
10:1
- 3:3

vetor <- c("a", "b", "c", "d")

vetor[c(1, 4)]

class(vetor1)
class(vetor2)

vetor <- c(1, 2, "a")
vetor

class(vetor)

vetor <- c(0, 5, 20, -3)
vetor + 1

vetor1 <- c(1, 2, 3)
vetor2 <- c(10, 20, 30)

vetor1 + vetor2

vetor

vetor1 <- c(1, 2)
vetor2 <- c(10, 20, 30, 40)

vetor1 + vetor2

vetor1 <- c(1, 2, 3)
vetor2 <- c(10, 20, 30, 40, 50)

vetor1 + vetor2

class(TRUE)

class(FALSE)

1 == 1

1 == 23

"a" == 1

"a" == "2"

"a" == "b"

1 != 2

1 != 1

"a" != "b"

2 > 3

3 > 2

3 > 4

3 <= 3

4 < 3

2 < 4

3 %in% c(1, 2, 3)

"A" %in% c("b", "c")

minha_coluna <- c(1, 3, 0, 10, -1, 5, 20)

minha_coluna > 3

minha_coluna[minha_coluna > 3]

mtcars

mtcars$mpg

mtcars$cyl

mtcars$wt

class(mtcars)

dim(mtcars)

mtcars[30, "hp"]

mtcars[, 10]

mtcars[1, ]

mtcars[, c(1, 10)]

mtcars[, c("mpg", "am", "gear")]

mtcars$cyl == 4

mtcars[mtcars$carb == 2 & mtcars$gear == 4,]

c(1, 3, 5)

sum(1, 4, 5)

sum(c(1, 3))

mean(1, 3)

mean(c(1, 3))

seq(from = 4, to = 10, by = 2)

seq(0, 100, 2)

#mostra as primeiras 6 linhas.
head(mtcars)

#mosta as ultimas 6 linhas.
tail(mtcars)

#Número de linhas e colunas.
dim(mtcars)

#Os nomes das colunas (váriaveis)
names(mtcars)

#Estrutura do datraframe. Mostra, entre outras coisas, as classes de cada coluna
str(mtcars)

#Acopla duas tabelas lado a lado
cbind(mtcars)

#Empilha duas tabelas.
rbind(mtcars, mtcars)

#Criando a sua própia função

nome_da_funcao <- function() {
  seq(1, 10, 2)
}

nome_da_funcao()

minha_soma <- function(x, y) {
  soma <- x + y
  soma
}

minha_soma(12, 40)

minha_nova_soma <- function(x, y) {
  soma <- x + y
  print(soma)
}

minha_nova_soma(1, 1)

resultado <- minha_nova_soma(1, 1)

resultado

filter(mtcars, gear == 4)
