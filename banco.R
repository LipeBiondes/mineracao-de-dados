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
  if (!requireNamespace("wordcloud", quietly = TRUE)) {
    install.packages("wordcloud")
    library(wordcloud)
  }
  
  if (!requireNamespace("reshape2", quietly = TRUE)) {
    install.packages("reshape2")
    library(reshape2)
  }
  
  if (!requireNamespace("syuzhet", quietly = TRUE)) {
    install.packages("syuzhet")
    library(syuzhet)
  }
  
  if (!requireNamespace("RColorBrewer", quietly = TRUE)) {
    install.packages("RColorBrewer")
    library(RColorBrewer)
  }
  
  if (!requireNamespace("tm", quietly = TRUE)) {
    install.packages("tm")
    library(tm)
  }
  
},
error = function(e) {
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
library(wordcloud)
library(reshape2)
library(syuzhet)
library(RColorBrewer)
library(tm)

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
},
error = function(e) {
  cat("Erro:", conditionMessage(e), "\n")
})

texto <-
  scan(
    file = 'https://raw.githubusercontent.com/programminghistorian/jekyll/gh-pages/assets/domCasmurro.txt',
    fileEncoding = "UTF-8",
    what = character(),
    sep = "\n",
    allowEscapes = T
  )

texto_palavras <- get_tokens(texto)

head(texto_palavras)

oracoes_vetor <- get_sentences(texto)

length(oracoes_vetor)

install.packages("httr")

library(httr)
library(jsonlite)

# Fazendo uma requisição GET
url <- "localhost:3333/texts"
response <- GET(url = url)

# Verificando o status da resposta
if (status_code(response) == 200) {
  # Convertendo o conteúdo JSON em um dataframe
  data <- fromJSON(content(response, "text"), flatten = TRUE)
  print(data)
} else {
  cat("Erro na requisição:", status_code(response))
}


print(oracao_1)
dados <- list("title" = "value1",
              "autor" = "value2",
              "content" =)

print(dados)

sentimentos_df <-
  get_nrc_sentiment(texto_palavras, language = "portuguese")

summary(sentimentos_df)
