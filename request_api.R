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
