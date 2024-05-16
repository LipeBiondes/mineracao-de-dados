install.packages("wordcloud")
install.packages("reshape2")
install.packages("syuzhet")
install.packages("RColorBrewer")
install.packages("tm")
install.packages("openxlsx")

library(wordcloud)
library(reshape2)
library(syuzhet)
library(RColorBrewer)
library(tm)
library(openxlsx)
library(rvest)
library(stringr)
library(tidytext)
library(dplyr)
library(ggplot2)
library(tidyr)
library(tm)
library(NLP)
library(wordcloud)
library(wesanderson)
library(knitr)
library(rmarkdown)
library(kableExtra)
library(htmltools)
library(prettydoc)

texto <-
  scan(
    file = 'https://raw.githubusercontent.com/programminghistorian/jekyll/gh-pages/assets/domCasmurro.txt',
    fileEncoding = "UTF-8",
    what = character(),
    sep = "\n",
    allowEscapes = T
  )

texto <- as.data.frame(texto)
paged_table(texto)

transforme_sobre_texto <- tolower(texto)
transforme_sobre_texto <- removePunctuation(transforme_sobre_texto)
transforme_sobre_texto <- removeNumbers(transforme_sobre_texto)
transforme_sobre_texto <- stripWhitespace(transforme_sobre_texto)

transforme_sobre_texto  <- removeWords(transforme_sobre_texto , stopwords_pt)

print(transforme_sobre_texto)

# tratamento
texto_palavras <- get_tokens(texto)

head(texto_palavras)

oracoes_vetor <- get_sentences(texto)

length(oracoes_vetor)

print(texto_palavras)

sentimentos_df <-
  get_nrc_sentiment(texto_palavras, language = "portuguese")

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

summary(sentimentos_df)
