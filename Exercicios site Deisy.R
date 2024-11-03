require(tidyverse)
require(dplyr)
require(tidyr)
require(data.table)
require(magrittr)
require(stringr)
require(lubridate)

## Exercício starwars
banco_de_dados <- starwars

## número total de espécies únicas presentes
banco_de_dados %>% 
  select(species) %>% 
  distinct(species) %>% 
  summarise(especies= n())

## frequência de indivíduos por espécie
por_especie <- banco_de_dados %>% 
  select(species) %>% 
  group_by(species) %>% 
  summarise(count= n())

## Calcule a altura média de personagens masculinos e femininos
altura_media <- banco_de_dados %>% 
  select(height, sex) %>% 
  filter(grepl("female", sex)) %>% 
  summarise(media_f= mean(height, na.rm = T))

#
masc <- "male"
altura_media2 <- banco_de_dados %>% 
  select(height, sex) %>% 
  filter(sex %in% masc) %>% 
  summarise(media_m= mean(height, na.rm = T))

## Qual é a média de idade dos personagens de cada espécie para personagens masculinos
idade <- banco_de_dados %>% 
  select(species,birth_year, sex) %>% 
  filter(sex %in% masc) %>% 
  group_by(species) %>% 
  summarise(media= mean(birth_year, na.rm = T))
  
banco_de_dados %>% 
  select(species, sex) %>% 
  filter(sex %in% masc) %>% 
  distinct(species)


## 4.10 Pivotagem
TB <- fread("TB.csv.gz")
TB1 <- TB %>% 
  pivot_longer(
    cols = -c(1:4), 
    names_to = "chave", 
    values_to = "casos", 
    values_drop_na = TRUE
  )
TB1

TB1 %>% 
  count(chave)
TB1 %<>% filter(chave %like% "^new")

TB2 <- TB1 %>% 
  mutate(chave = stringr::str_replace(chave, "newrel", "new_rel"))
TB2

TB3 <- TB2 %>% 
  separate(chave, c("new", "type", "sexage"), 
           sep = "_")
TB3

TB4 <- TB3 %>% 
  select(-new, -iso2, -iso3)

## o sep 1 quer dizer que separa depois de um caracter
TB5 <- TB4 %>% 
  separate(sexage, c("sexo", "idade"), sep = 1)
TB5

## Exercícios pivotagem 
## Utilizando os dados de TB5, crie uma tabela em formato wide, com a quantidade de casos por país por ano. Cada ano deve ser chamado “Ano_
TB6 <-TB5 %>% 
  select(casos, year, country) %>% 
  group_by(country, year) %>% 
  summarise(casos2 = sum(casos)) %>% 
  mutate(year = stringr :: str_c("Ano_", year)) %>% 
  pivot_wider(names_from = year , values_from = casos2) 


## Utilizando os dados de TB5, crie uma tabela em formato wide, com a quantidade de casos por país, ano, idade e sexo.

TB7 <- TB5 %>% 
  select(!type) %>% 
  group_by(country, year, sexo, idade) %>% 
  summarise(casos2 = sum(casos)) %>% 
  pivot_wider(names_from =year, values_from = casos2, values_fn =sum )



## Volte o banco criado em 1 e 2 para o formato long
TB8 <- TB6 %>% 
  pivot_longer(cols= -(country), 
               names_to = "Ano",
               values_to = "casos")
TB9 <- TB7 %>% 
  pivot_longer(cols= -c(country, sexo, idade), 
               names_to = "Ano",
               values_to = "casos")
 
## Exercício string
dados <- words
words

# Comece com “y”
dados[str_detect(words, "^y")]

#Não comece com “y”
dados[str_detect(words,"^y", negate = TRUE)]

#Termine com “x”.
dados[str_detect(words, "x$")]

#Tenham exatamente três letras.
str_subset(words, "^\\w{3}$")

#Tenham sete letras ou mais.
str_subset(words, "\\w{7,}")

#Contenham um par vogal-consoante.
str_subset(words, "[aeiou][^aeiou]")

#Contenham pelo menos dois pares vogal-consoante consecutivos.
str_subset(words, "([aeiou][^aeiou]){2,}")


## Exercícios 4.7
#Utilizando o banco de dados car_crash formate a coluna data em uma data (dd-mm-yyyy);

#Utilizando o banco de dados car_crash formate a coluna horario para o horário do acidente (hh:mm:ss)

dados <- fread("Brazil Total highway crashes 2010 - 2023 (1).csv")
data <- dados %>% 
  mutate(nova_data=as.Date(data,format= "%d/%m/%Y")) %>% 
  mutate(novo_horario= hms(horario)) %>% 
  mutate(mes= month(nova_data)) %>% 
  mutate(dia= day(nova_data)) %>% 
  mutate(ano= year(nova_data)) 

#Qual o mês com maior quantidade de acidentes?
mes <- data %>% 
  group_by(mes) %>% 
  summarise(nn=n()) %>% 
  filter(nn==max(nn))

#Qual ano ocorreram mais acidentes?
ano <- data %>% 
  group_by(ano) %>% 
  summarise(n=n()) %>% 
  filter(n== max(n))

#Qual horário acontecem menos acidentes?
horario <- data %>% 
  group_by(novo_horario) %>% 
  summarise(n=n()) %>% 
  filter(n== min(n))

#Qual a média, desvio padrão, mediana, Q1 e Q3 para a quantidade de indivíduos classificados como levemente feridos por mês/ano?
feridos <- data %>% 
  select(mes, ano,levemente_feridos) %>% 
  group_by(mes, ano) %>% 
  summarise(media=mean(levemente_feridos, na.rm = T),
            dv =sd(levemente_feridos, na.rm = T),
            mediana = median(levemente_feridos, na.rm = T),
            quartil= quantile(levemente_feridos, na.rm = T))

#Quantos acidentes com vítimas fatais aconteceram, por mês/ano, em mediana entre as 6:00am e 11:59am.
# o .groups exclui os agrupamentos anteriores
vit_fatais <- data %>% 
  select(mortos, mes, ano, novo_horario) %>% 
  filter(novo_horario >="6H-0M-0S" & novo_horario <= "11H-59M-0S") %>% 
  group_by(mes, ano) %>% 
  summarise(num=n(),.groups = "drop") %>% 
  summarise(mediana= median(num))



# Exercícios 4.9
install.packages("nycflights13")
require(nycflights13)
airlines
planes
flights
airports
glimpse(weather)

dados1 = flights %>% 
  inner_join(weather)

atraso <- dados1 %>% 
  select(dep_delay,weather) %>% 
  filter(dep_delay > 24) %>% 
  arrange(dep_delay)
