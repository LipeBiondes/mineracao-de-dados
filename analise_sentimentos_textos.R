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

texto_4 <- "O verão daquele ano trouxe consigo um encontro que mudaria minha vida de maneiras que eu jamais poderia imaginar.
Conheci uma garota encantadora, com olhos que brilhavam como estrelas e um sorriso capaz de iluminar até mesmo os dias mais sombrios.
Ela era baixinha, com cabelos castanhos claros que dançavam ao vento, e sua inteligência era tão cativante quanto sua beleza.
Desde o momento em que a vi, meu coração pareceu bater mais forte, como se soubesse que ali estava alguém especial.
Em questão de dias, me vi profundamente apaixonado, e a coragem me impeliu a convidá-la para sair, revelando minhas intenções
sinceras de querer namorá-la. No entanto, o destino tinha outros planos, e ela, gentilmente, explicou que não podia comprometer-se
naquele momento.Apesar de sua resposta, mantive a esperança de que talvez, com o tempo, as coisas pudessem mudar. Mas conforme as
semanas se transformaram em meses, percebi que estava apenas me iludindo. Cada momento investido na esperança de um futuro juntos
pareceu um desperdício de tempo precioso, e a dor da rejeição se transformou em resignação.Hoje, olho para trás e vejo essa
experiência como uma lição valiosa sobre o amor e a importância de aceitar quando as coisas simplesmente não funcionam.
Embora não nos falemos mais, guardo as lembranças daquele verão com carinho, lembrando-me dela como alguém que cruzou meu
caminho e deixou uma marca indelével em meu coração."

texto_4 <- as.data.frame(texto_4)
paged_table(texto_4)

transforme_sobre_texto_delevel <- tolower(texto_4)
transforme_sobre_texto_delevel <- removePunctuation(transforme_sobre_texto_delevel)
transforme_sobre_texto_delevel <- removeNumbers(transforme_sobre_texto_delevel)
transforme_sobre_texto_delevel <- stripWhitespace(transforme_sobre_texto_delevel)

transforme_sobre_texto_delevel  <- removeWords(transforme_sobre_texto_delevel , stopwords_pt)

print(transforme_sobre_texto_delevel)

wordcloud(
  transforme_sobre_texto_delevel,
  scale = c(8, 0.8),
  max.words = 20,
  color = wes_palette("Royal1")
)

texto_palavras_4 <- get_tokens(transforme_sobre_texto_delevel)

sentimentos_texto_4 <-
  get_nrc_sentiment(texto_palavras_4, language = "portuguese")

colnames(sentimentos_texto_4) <- c(
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

barplot(
  colSums(prop.table(sentimentos_texto_4[, 1:8])),
  space = 0.2,
  horiz = FALSE,
  las = 1,
  cex.names = 0.7,
  col = brewer.pal(n = 8, name = "Set3"),
  main = "Texto 4",
  sub = "Análise realizado por: Alefe Filipe",
  xlab = "emoções",
  ylab = NULL
)

texto_df_4 <- data_frame(text = transforme_sobre_texto_delevel)

texto_token <- texto_df_4 %>%
  unnest_tokens(word, text)

stopwords_portu_df_4 <- data.frame(word = transforme_sobre_texto_delevel)

texto_token_4 <- texto_token %>%
  anti_join(stopwords_portu_df_4, by = "word")

texto_token_4 %>%
  count(word, sort = TRUE)

texto_token_4 %>%
  count(word, sort = TRUE) %>%
  filter(n > 1) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  
  geom_col(fill = "#245968") +
  xlab(NULL) +
  coord_flip() +
  labs(y = "Frequência Termos")

texto_9 <- "Lembro-me vividamente de uma das primeiras vezes que nos reencontramos;
foi um momento único que decidi expressar meus sentimentos através da música, entoando uma canção de Bethânia.
Queria ver sua reação, entender como ele se sentiria diante desse gesto, pois sua presença sempre foi capaz de me transformar,
de me fazer sentir de uma maneira que eu não sabia explicar: talvez melhor, talvez pior. Ainda guardo uma camisa que foi dele por
quatro anos, mesmo após todos os estragos que ele causou. É curioso como esse objeto se tornou um símbolo, um fragmento tangível
de um amor que foi intenso, mas ao mesmo tempo tumultuado. Não sei ao certo se era amor ou apenas uma conexão profunda, mas sem
dúvida era algo significativo, algo que deixou marcas profundas em mim. O processo de deixá-lo foi uma das coisas mais dolorosas
que já enfrentei, mesmo após ter me perdoado. Por um tempo, alimentar a ideia de que jamais daríamos certo foi reconfortante, pois
me dava uma sensação de controle, uma sensação de domínio sobre meus próprios sentimentos. Eu desisti de amá-lo tanto, e isso me
tornou dona de algo, mesmo que fosse o fim da nossa história. Mas mesmo assim, mesmo com todas as dificuldades e desilusões, não
consigo dizer que outros homens me amaram melhor que ele. Poderia mentir para mim, mas ele saberia. Porque, no fundo, nenhum deles
foi capaz de me tocar da mesma maneira que ele fez. A verdade dolorosa que me incomodou foi perceber que toda a energia que investi
nele, todo o amor que dediquei, só o beneficiou. Amá-lo não me levou a lugar algum; na verdade, só cheguei tão longe porque, no final
das contas, estava só nessa jornada. partiu meu coração de muitas maneiras, mas também me ensinou lições valiosas sobre o amor, sobre
o perdão e sobre a importância de valorizar a jornada, mesmo que isso signifique deixar para trás um grande amor do passado."

texto_9 <- as.data.frame(texto_9)
paged_table(texto_9)

transforme_sobre_texto_camisa <- tolower(texto_9)
transforme_sobre_texto_camisa <- removePunctuation(transforme_sobre_texto_camisa)
transforme_sobre_texto_camisa <- removeNumbers(transforme_sobre_texto_camisa)
transforme_sobre_texto_camisa <- stripWhitespace(transforme_sobre_texto_camisa)

transforme_sobre_texto_camisa  <- removeWords(transforme_sobre_texto_camisa , stopwords_pt)

print(transforme_sobre_texto_camisa)

wordcloud(
  transforme_sobre_texto_camisa,
  scale = c(8, 0.8),
  max.words = 20,
  color = wes_palette("Royal1")
)

texto_palavras_9 <- get_tokens(transforme_sobre_texto_camisa)

sentimentos_texto_9 <-
  get_nrc_sentiment(texto_palavras_9, language = "portuguese")

colnames(sentimentos_texto_9) <- c(
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

barplot(
  colSums(prop.table(sentimentos_texto_9[, 1:8])),
  space = 0.2,
  horiz = FALSE,
  las = 1,
  cex.names = 0.7,
  col = brewer.pal(n = 8, name = "Set3"),
  main = "Texto 4",
  sub = "Análise realizado por: Alefe Filipe",
  xlab = "emoções",
  ylab = NULL
)

texto_df_9 <- data_frame(text = transforme_sobre_texto_camisa)

texto_token <- texto_df_9 %>%
  unnest_tokens(word, text)

stopwords_portu_df_9 <- data.frame(word = transforme_sobre_texto_camisa)

texto_token_9 <- texto_token %>%
  anti_join(stopwords_portu_df_9, by = "word")

texto_token_9 %>%
  count(word, sort = TRUE)

texto_token_9 %>%
  count(word, sort = TRUE) %>%
  filter(n > 1) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  
  geom_col(fill = "#245968") +
  xlab(NULL) +
  coord_flip() +
  labs(y = "Frequência Termos")
