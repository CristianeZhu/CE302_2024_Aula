# Exemplo de manipulação de expressões
x <- 5
y<-10 # Não recomendado, espaços são mais legíveis
z <- (x +
        y) # Continuando o comando em outra linha

rm(x) ## excluir variáveis
ls()


### Operadores aritmétricos
a <- 1
b <- 2
##soma
a + b

## subtração
a - b

## Divisão 
a / b

##multiplicação
a * b 

## exponenciação
a ^ b

##módulo 
modulo <- a %% b
modulo

## Divisão inteira
divisao_inteira <- a %/% b
divisao_inteira
 
### OPeradores relacionais

## Verificar se dois valores são iguais
igual_a <- a == b
igual_a

1==2

## diferentes
diferente_de <- a != b
diferente_de

##maior e menor que
maior_que <- a > b
maior_que

menor_que <- a < b
menor_que

## Maior/menor ou igual a
maior_ou_igual_a <- a >= b
maior_ou_igual_a

menor_ou_igual_a <- a <= b
menor_ou_igual_a

##resumo
1 + 1 # Adição
2 - 1 # Subtração
3 * 2 # Multiplicação
4 / 2 # Divisão
5 ^ 2 # Potenciação
5 %% 2 # Resto da divisão
5 %/% 2 # Divisão inteira

### LOG
log(10) # log natural
log(10, base = 10)
log10(10) ## igual o de cima

### exp
exp(4)

### FUNÇÕES TRIGONOMÉTRICAS (em radianos)
sin(0) # Seno
cos(0) # Cosseno
tan(0) # Tangente
asin(0) # Arco seno
acos(0) # Arco cosseno
atan(0) # Arco tangente

### FUNÇÕES DE ARREDONDAMENTO
round(pi, digits = 2) # Arredondamento
ceiling(pi) # Teto arredonda p cima
floor(pi) # Piso arredonda p baixo
trunc(pi) # Truncamento

sqrt(4) # raiz quadrada

### OPERADORES LÓGICOS
(1 == 1) & (2 == 2) # E / AND
(1 == 1) | (2 == 3) # OU / OR
!(1 == 2) # NÃO / NOT

### TIPOS ESPECIAIS
NA + 5 # sempre retorna NA
NULL + 10 # atribui uma classe
NaN +10 # SEMPRE RETORNA NaN

### STRINGS
"R" == "r" # Comparação de strings
"a" < "b" # Ordem Alfanumérica
"1" < "2" # Ordem Alfanumérica
"a" < "1" # os números vem primeiro

### VETORES
vetor_numerico <- c(1,2,3,4,5)
vetor_numerico
vetor_char <- c("a","b", "c")
vetor_char
vetor_logicos <- c(TRUE, FALSE, TRUE, FALSE)
vetor_logicos

vetor_numerico[1] #acessar elementos pela posição
vetor_char[1]
vetor_char[1:2]
vetor_char[length(vetor_char)] ## última elemento da posição
vetor_char[-c(1)] ## remover elemento

vetor_numerico * 3 ## multiplica todos os elementos

c(vetor_numerico,vetor_logicos,vetor_char)

# -----------------------------------------------------------------------
### OPERAÇÕES ARITMÉTRICAS
# Operações aritméticas com vetores
vetor1 <- c(1, 2, 3)
vetor2 <- c(4, 5, 6)

# Soma 
soma_vetores <- vetor1 + vetor2 # se os vetores forem de tamanghos diferentes, vai ocorrer a regra da reciclagem
soma_vetores

# Subtração
subtracao_vetores <- vetor1 - vetor2
subtracao_vetores

# Multiplicação
multiplicacao_vetores <- vetor1 * vetor2
multiplicacao_vetores

# Divisão
divisao_vetores <- vetor1 / vetor2
divisao_vetores

### TIPOS, CLASSES, MÉTODOS EM VETORES
is.character((vetor2)) # perguntar se é character
as.character(vetor2) #converter a classe 
class(vetor2) #descobrir a classe

datas <- c("2021-01-01", "2021-01-02", "2021-01-03")
# Converte para data
as.Date(datas) 

### METODOS
methods(class = "numeric")
methods(class = "character")

###VETOR NOMEADO
## Podemos ter um vetor numérico com nomes
altura <- c("João" = 1.82,
            "Bianca" = 1.68,
            "Eduarda" = 1.62)
class(altura)

altura["Bianca"]
altura[max(altura)]
names(altura) ## só os nomes/labels
names(altura[max(altura)])


sequencia_10_100 <- seq(from = 10,
                        to = 100, 
                        by = 5)
sequencia_10_100

# Sequência de 10 a 1, de 2 em 2
seq2 <- seq(10, 1, by = -2)
seq2