#Pacotes

tryCatch({
  if (!requireNamespace("RSQLite", quietly = TRUE)) {
    install.packages("RSQLite")
    library(RSQLite)
  }
  
  if (!requireNamespace("readr", quietly = TRUE)) {
    install.packages("readr")
    library(readr)
  }
  
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    install.packages("dplyr")
    library(dplyr)
  }
  
  if (!requireNamespace("tidytext", quietly = TRUE)) {
    install.packages("tidytext")
    library(tidytext)
  }
  if (!requireNamespace("stringr", quietly = TRUE)) {
    install.packages("stringr")
    library(stringr)
  }
  
  if (!requireNamespace("lexiconPT", quietly = TRUE)) {
    install.packages("lexiconPT")
    library(lexiconPT)
  }
  if (!requireNamespace("tm", quietly = TRUE)) {
    install.packages("tm")
    library(tm)
  }
  
  if (!requireNamespace("rtweet", quietly = TRUE)) {
    install.packages("rtweet")
    library(rtweet)
  }
  
}, error = function(e) {
  cat("Erro:", conditionMessage(e), "\n")
})

library(RSQLite)
library(readr)
library(dplyr)
library(tidytext)
library(stringr)
library(lexiconPT)
library(tm)
library(rtweet)

#Criando tabelas no banco

install.packages("RSQLite")
install.packages("DBI")

library(RSQLite)
library(DBI)

con <-
  dbConnect(
    RSQLite::SQLite(),
    "C:/Users/UEPA_07/Documents/api-mineracao-texts-main/prisma/dev.db"
  )

tryCatch({
  imdb <- read_csv("imdb.csv")
  
  dbWriteTable(con, "imdb_data", imdb, overwrite = TRUE)
  
  dados_tabela <- dbReadTable(con, "imdb_data")
  
  print(dados_tabela)
  
  on.exit({
    dbDisconnect(con)
  })
}, error = function(e) {
  cat("Erro:", conditionMessage(e), "\n")
})

tryCatch({
  # Nome da tabela no banco de dados
  table_name <- "texts"
  
  # Ler a tabela
  dados_tabela_texts <- dbReadTable(con, table_name)
  
  # Exibir os dados
  print(dados_tabela_texts[4])
  dados_tabela_texts[,dados_tabela_texts$content]

  texto_tratado <- dados_tabela_texts$content[3]
  
  print(texto_tratado)
  }, error = function(e) {
  cat("Ocorreu um erro:", conditionMessage(e), "\n")
}, finally = {
  # Fechar a conexão com o banco de dados
  dbDisconnect(con)
  cat("Conexão com o banco de dados fechada.\n")
})