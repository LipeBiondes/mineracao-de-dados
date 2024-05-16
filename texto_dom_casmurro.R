install.packages("rvest")
install.packages("stringr")
install.packages("tidytext")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("tm")
install.packages("NLP")
install.packages("wordcloud")
install.packages("wesanderson")
install.packages("knitr")
install.packages("rmarkdown")
install.packages("kableExtra")
install.packages("htmltools")
install.packagesa("prettydoc")
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

sentimentos_df_dom_casmurro <-
  get_nrc_sentiment(texto_palavras, language = "portuguese")

colnames(sentimentos_df_dom_casmurro) <- c(
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

wordcloud(
  transforme_sobre_texto,
  scale = c(6, 0.8),
  max.words = 20,
  color = wes_palette("Royal1")
)

texto_df <- data_frame(text = transforme_sobre_texto)

texto_token <- texto_df %>%
  unnest_tokens(word, text)

stopwords_portu_df <- data.frame(word = transforme_sobre_texto)


texto_token <- texto_token %>%
  anti_join(stopwords_portu_df, by = "word")

texto_token %>%
  count(word, sort = TRUE)

texto_token %>%
  count(word, sort = TRUE) %>%
  filter(n > 90) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  
  geom_col(fill = "#245968") +
  xlab(NULL) +
  coord_flip() +
  labs(y = "Frequência Termos")

barplot(
  colSums(prop.table(sentimentos_df_dom_casmurro[, 1:8])),
  space = 0.2,
  horiz = FALSE,
  las = 1,
  cex.names = 0.7,
  col = brewer.pal(n = 8, name = "Set3"),
  main = "'Dom Casmurro' de Machado de Assis",
  sub = "Análise realizado por Alefe Filipe",
  xlab = "emoções",
  ylab = NULL
)
