install.packages("wordcloud")
install.packages("reshape2")
install.packages("syuzhet")
install.packages("RColorBrewer")
install.packages("tm")

library(wordcloud)
library(reshape2)
library(syuzhet)
library(RColorBrewer)
library(tm)

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

print(oracao_1)
dados <- list("title" = "value1",
              "autor" = "value2",
              "content" =)

print(dados)

sentimentos_df <-
  get_nrc_sentiment(texto_palavras, language = "portuguese")

summary(sentimentos_df)

tryCatch({
  con <-
    dbConnect(RSQLite::SQLite(),
              "C:/Users/Alefe/Documents/R/mineracao-de-dados/imdb.db")
  
  dbWriteTable(con, "data_frame_polaridades", sentimentos_df, overwrite = TRUE)
  
  sentimentos_polaridades <- dbReadTable(con, "data_frame_polaridades")
  
  print(sentimentos_polaridades)
  
  on.exit({
    dbDisconnect(con)
  })
}, error = function(e) {
  cat("Erro:", conditionMessage(e), "\n")
})

install.packages("openxlsx")
library(openxlsx)

colnames(sentimentos_df) <- c(
  "raiva",
  "ansiedade",
  "desgosto",
  "medo",
  "alegria",
  "tristeza",
  "surpresa",
  "confianca",
  "negativo",
  "positivo"
)

tryCatch({
  # Nome do arquivo Excel
  output_file <- "C:/Users/Alefe/Documents/R/mineracao-de-dados/sentimentos_polaridades.xlsx"
  
  # Escrever o data frame para o arquivo Excel
  write.xlsx(sentimentos_df, file = output_file, overwrite = TRUE)
  
  # Ler os dados de volta do arquivo Excel (opcional)
  sentimentos_polaridades <- read.xlsx(output_file)
  
  # Imprimir os dados lidos
  print(sentimentos_polaridades)
  
}, error = function(e) {
  cat("Erro:", conditionMessage(e), "\n")
})