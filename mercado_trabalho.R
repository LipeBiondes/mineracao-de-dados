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

texto <- read_html(
  c(
    "https://www.baguete.com.br/noticias/30/10/2020/ciencia-de-dados-continuara-sendo-a-grande-profissao-do-futuro"
  )
)
texto1 <-  texto %>%
  html_nodes("p") %>%
  html_text()

texto1 <- as.data.frame(texto1)
paged_table(texto1)

transforme_sobre_texto <- tolower(texto1)
transforme_sobre_texto <- removePunctuation(transforme_sobre_texto)
transforme_sobre_texto <- removeNumbers(transforme_sobre_texto)
transforme_sobre_texto <- stripWhitespace(transforme_sobre_texto)

stopwords_pt <- c(
  "de",
  "a",
  "o",
  "que",
  "e",
  "do",
  "da",
  "em",
  "um",
  "para",
  "com",
  "não",
  "uma",
  "os",
  "no",
  "se",
  "na",
  "por",
  "mais",
  "as",
  "dos",
  "como",
  "mas",
  "foi",
  "ao",
  "ele",
  "das",
  "tem",
  "à",
  "seu",
  "sua",
  "ou",
  "ser",
  "quando",
  "muito",
  "há",
  "nos",
  "já",
  "está",
  "eu",
  "também",
  "só",
  "pelo",
  "pela",
  "até",
  "isso",
  "ela",
  "entre",
  "depois",
  "sem",
  "mesmo",
  "aos",
  "ter",
  "seus",
  "quem",
  "nas",
  "me",
  "esse",
  "eles",
  "estão",
  "você",
  "tinha",
  "foram",
  "essa",
  "num",
  "nem",
  "suas",
  "meu",
  "às",
  "minha",
  "têm",
  "numa",
  "pelos",
  "elas",
  "havia",
  "seja",
  "qual",
  "será",
  "nós",
  "tenho",
  "lhe",
  "deles",
  "essas",
  "esses",
  "pelas",
  "este",
  "fosse",
  "dele",
  "tu",
  "te",
  "vocês",
  "vos",
  "lhes",
  "meus",
  "minhas",
  "teu",
  "tua",
  "teus",
  "tuas",
  "nosso",
  "nossa",
  "nossos",
  "nossas",
  "dela",
  "delas",
  "esta",
  "estes",
  "estas",
  "aquele",
  "aquela",
  "aqueles",
  "aquelas",
  "isto",
  "aquilo",
  "estou",
  "está",
  "estamos",
  "estão",
  "estive",
  "esteve",
  "estivemos",
  "estiveram",
  "estava",
  "estávamos",
  "estavam",
  "estivera",
  "estivéramos",
  "esteja",
  "estejamos",
  "estejam",
  "estivesse",
  "estivéssemos",
  "estivessem",
  "estiver",
  "estivermos",
  "estiverem",
  "hei",
  "há",
  "havemos",
  "hão",
  "houve",
  "houvemos",
  "houveram",
  "houvera",
  "houvéramos",
  "haja",
  "hajamos",
  "hajam",
  "houvesse",
  "houvéssemos",
  "houvessem",
  "houver",
  "houvermos",
  "houverem",
  "houverei",
  "houverá",
  "houveremos",
  "houverão",
  "houveria",
  "houveríamos",
  "houveriam"
)


transforme_sobre_texto  <- removeWords(transforme_sobre_texto , stopwords_pt)

print(transforme_sobre_texto)

wordcloud(
  transforme_sobre_texto,
  scale = c(6, 0.5),
  max.words = 40,
  color = wes_palette("Royal1")
)

texto_c <- read_html(
  c(
    "https://www.baguete.com.br/noticias/30/10/2020/ciencia-de-dados-continuara-sendo-a-grande-profissao-do-futuro"
  )
)
texto_corpus <-  texto_c %>%
  html_nodes("p") %>%
  html_text()

corpus_texto <- VCorpus(VectorSource(texto_corpus))

corpus_texto <- tm_map(corpus_texto, removePunctuation)
corpus_texto <- tm_map(corpus_texto, removeNumbers)
corpus_texto <- tm_map(corpus_texto, removeWords, stopwords("pt"))

dtm_texto <- DocumentTermMatrix(texto_tratado)
dtm_texto

texto_t <- read_html(
  c(
    "https://www.baguete.com.br/noticias/30/10/2020/ciencia-de-dados-continuara-sendo-a-grande-profissao-do-futuro"
  )
)
texto_tidy <-  texto_t %>%
  html_nodes("p") %>%
  html_text()

texto_df <- data_frame(text = texto_tidy)

texto_token <- texto_df %>%
  unnest_tokens(word, text)

stopwords_portu_df <- data.frame(word = texto_tratado)

texto_token <- texto_token %>%
  anti_join(stopwords_portu_df, by = "word")

texto_token %>%
  count(word, sort = TRUE)

texto_token %>%
  count(word, sort = TRUE) %>%
  filter(n > 3) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col(fill = "#245968") +
  xlab(NULL) +
  coord_flip() +
  labs(y = "Frequência Termos")
