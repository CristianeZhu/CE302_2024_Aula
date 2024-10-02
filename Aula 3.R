#### AULA 3
# Números aleatórios ---------------------------------------
# 5 Números aleatórios entre 0 e 1
runif(5)
runif(10, min= 0, max=100)
set.seed(123)
runif(10)

# gerando valores de uma normal
rnorm(10)
rnorm(10, mean=6, sd=1)
rpois(10,2)
rpois(10, lambda=2) #poasson

#amostra aleatória
x <- c("Thiago","Alex", "Lucas")
x
sample(x)
sample(x, size=2) ## escolher o numero de sorteados
sample(x, size=10, replace= TRUE) #COM REPOSIÇÃO

y <- rnorm(100)
sample(y)
sample(y, size=2)

## OPERADORES RELACIONAIS EM VETORES -----------------------
# Comparação entre vetores
vetor1 <- c(1, 2, 6, 4)
vetor2 <- c(4, 5, 6, 2)

# Igualdade
vetores_iguais <- vetor1 == vetor2  
vetores_iguais

# Diferença
vetores_diferentes <- vetor1 != vetor2
vetores_diferentes

# Maior que
vetores_maior_que <- vetor1 > vetor2
vetores_maior_que

## SELEÇÃO POSICIONAL ----------------------------------------------------
alturas <- c("João" = 1.82, 
             "Bianca" = 1.68,
             "Carlos" = 1.75, 
             "Ana" = 1.70)

# Seleciona o primeiro elemento
alturas[1]
alturas["João"]

# Seleciona até o terceiro elemento
alturas[1:3]

# Seleciona elementos 1, 3 e 4
alturas[c(1, 3, 4)]

# remove o segundo elemento
alturas[-2]

##SELEÇÃO CONDICIONAL -----------------------------------------------------
# Seleciona alturas maiores que 1.70
mascara_logica <- alturas > 1.70
mascara_logica ## retorna como TRUE/FALSE
alturas[mascara_logica]

alturas[alturas > 1.70] ## equivalente á anterior

altura_joao <- alturas["João"]
alturas[alturas > altura_joao]
# SELEÇÃO POR  NOME -------------------------------------------------------
# Seleciona a altura de João
alturas["João"]

# Seleciona a altura de João e Ana
alturas

# Modifica a altura de João
alturas["João"] <- 1.85 ## só atribuir o novo valor
alturas

# Atribui altura desconhecida a Bianca
alturas["Bianca"] <- NA
alturas

# Remove a altura de Carlos
alturas = alturas[-3] ## colocar a posição dele

#substituir a altura da bianca pela media
media <- mean(alturas, na.rm= TRUE,)
alturas[is.na(alturas)] <- media
alturas

## ADICIONAR -----------------------------------------
# Adiciona a altura de Ivete
alturas <- append(alturas, 
       value = c("Ivete"= 1.60))

# Adiciona a altura de Anderson no inicio
alturas <- append(alturas,
       value = c("Anderson"= 1.75), 
       after = 0)

alturas <- append(alturas,
                  value = c("Anderson"= 1.75), 
                  after = 3)
alturas

alturas <- alturas[!names(alturas)== "Anderson"]

### ordenando por ordem alfabética
nomes= names(alturas)
nomes[order(nomes)]


## ORDEM DE EXECUÇÃO ------------------------------------------
b <- 3
invisible( b+5)

### FUNÇÕES ÚTEIS PARA VETORES ------------------------------------------------
vetor1
sum(vetor1)
mean(vetor1)
median(vetor1)
max(vetor1)
min(vetor1)
sqrt(vetor1)

## MANIPULAÇÃO DE DADOS --------------------------------------------------------
vetor3 = c(4,7,2,4,1,5)
length(vetor3)
sort(vetor3)
rev(vetor3) ## inverte a ordem dos elementos
unique(vetor3) # retorna os elementos únicos
quantile(vetor3)

# Tabela de Frequência
table(vetor3)
prop.table(table(vetor3))

## GRÁFICOS --------------------------
vetor4 = c(1:100)
vetor5 = sqrt(vetor4)

plot(x = vetor4, 
     y = vetor5, 
     las = 1, 
     pch = 15,
     col= "aquamarine"
)

hist(vetor4,
     main= "histograma",
     las = 1)

x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
plot(x, y, type = "b")  # Cria um gráfico de linhas e pontos
plot(x, y, type = "p")
plot(x, y, type = "l")

### MANIPULAÇAO DE STRING ---------------------------------------------------------
nomes = c("Maria", "Ana", "Rafaela")
paste(nomes[1], "e", nomes[2], "são minhas amigas.")

paste(nomes[1], nomes[2], nomes[3], sep = "|") ## SEPARADOR

paste0(nomes[1], "e", nomes[2], "são minhas amigas.")

paste(nomes, collapse = " ")
toupper(nomes) #tudo p letra maiuscula
tolower(nomes) #letra minuscula


substr(x = nomes[1], start = 1,stop = 3) #subcadeia de uma string
gsub(pattern = "G", 
     replacement = "R",
     x = "Gato")


#### MATRIZES ----------------------------------------------
vetor_a = c(1,2,3,4)
vetor_b = c(5,6,7,8)
#pela linha
matriz_linha = rbind(vetor_a, 
                     vetor_b)
matriz_linha

class(matriz_linha)
class(vetor_a)
is.matrix(matriz_linha) # ver se é matriz ou n
#pela coluna
matriz_coluna= cbind(vetor_a, 
                     vetor_b)
matriz_coluna

# criar matriz com matrix
A <- matrix(c(1:9), 
            ncol = 3,
            nrow = 3,
            byrow = TRUE)
A
dim(A) # VERIFICAR A DIMENSÃO 

A[1,2] # linha 1 coluna 2
A[1,] # todos elementos da primeira linha

B <- matrix(c(1:9), 
            ncol = 3, 
            byrow = FALSE)
B

elementos_maior_que_3 <- B[which(B > 3)]
elementos_maior_que_3

## Exemplo 2: Seleção de Elementos Ímpares
elementos_impares <- B[which(B %% 2 != 0)]
elementos_impares

## REMOVER LINHAS E COLUNAS ------------------------------------
A_sem_terceira_coluna <- A[, -3]  # Remove a terceira coluna da matriz
A_sem_terceira_coluna

A_sem_primeiras_duas_linhas <- A[-(1:2), ]  # Remove as duas primeiras linhas da matriz
A_sem_primeiras_duas_linhas

## SOMA E SUBTRAÇÃO DE MATRIZES
A <- matrix(c(4, -3, 7, 
              10, 1, 1, 
              -5, 2, 3), 
            ncol = 3, 
            byrow = TRUE)
A
B <- matrix(c(2, -1, 3,
              1, 4, 1, 
              5, -2, 7), 
            ncol = 3, 
            byrow = TRUE)
B

soma <- A + B
soma

subtracao <- A - B
subtracao

## SOMA DE LINHAS E COLUNAS
soma_colunas_A <- colSums(A)
soma_colunas_A

soma_linhas_A <- rowSums(A)
soma_linhas_A

colMeans(A) #MEDIA DE CADA COLUNA
rowMeans(B) #media de cada linha

## MULTIPLICAÇÃO POR ESCALAR------------------------------------------
k <- 2
A
multiplicacao_escalar <- k * A
multiplicacao_escalar

#PRODUTO ELEMENTO A ELEMENT
produto_elemento_a_elemento <- A * B ## multiplica cada um dos elementos
produto_elemento_a_elemento

#PRODUTO MATRICIAL
produto_matricial <- A %*% B
produto_matricial

# TRANSPOSTA
transposta_A <- t(A)
transposta_A

# DETERMINANTE
determinante_A <- det(A)
determinante_A

# INVERSA
inversa_A <- solve(A)
inversa_A

# DIAGONAL
diagonal_A <- diag(A)
diagonal_A # resulta num vetor

# AUTOVALORES E AUTOVETORES
autovalores_autovetores_A <- eigen(A)
autovalores_autovetores_A

# PRODUTO MATRICIAL TRANSPOSTO
# A^T. B
produto_transposto <- crossprod(A, B)
produto_transposto

# A. B^T
produto_transposto_t <- tcrossprod(A, B)
produto_transposto_t

### NOMES DE LINHAS E COLUNAS
rownames(A) <- c("Linha1", "Linha2", "Linha3")
colnames(A) <- c("Coluna1", "Coluna2", "Coluna3")
A

## MATRIZES TRIANGULARES
A <- matrix(1:9, nrow = 3)
upper_elements <- upper.tri(A)
upper_elements

A[upper.tri(A)] # MOSTRA os elementos
A[upper.tri(A)] <- 90
A

lower_elements <- lower.tri(A, diag = T)
lower_elements
A[lower.tri(A)]

## ARRAYS ------------------------------------------------------------
# Criando um array 2x3x4
arr <- array(1:24, dim = c(2, 3, 4)) # 2 POR 3 e 4 matrizes( dimenções)
arr

elemento <- arr[2, 3, 4]
elemento
arr[, , 1] # todos elementos da primeira dimensão

# Criando dois arrays
arr1 <- array(1:12, dim = c(3, 2, 2))
arr2 <- array(13:24, dim = c(3, 2, 2))

# Soma de arrays
soma <- arr1 + arr2

# Produto element-wise
produto <- arr1 * arr2

# Média ao longo da terceira dimensão
media <- mean(arr1, dim = 3)
media
