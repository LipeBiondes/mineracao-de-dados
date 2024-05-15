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

tryCatch({
  imdb <- read_csv("imdb.csv")
  
  con <-
    dbConnect(
      RSQLite::SQLite(),
      "C:/Users/UEPA_07/Documents/Mineracao-de-dados/quinto/aula/imdb.db"
    )
  
  dbWriteTable(con, "imdb_data", imdb, overwrite = TRUE)
  
  dados_tabela <- dbReadTable(con, "imdb_data")
  
  print(dados_tabela)
  
  on.exit({
    dbDisconnect(con)
  })
}, error = function(e) {
  cat("Erro:", conditionMessage(e), "\n")
})
