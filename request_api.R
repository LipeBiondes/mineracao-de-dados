install.packages("httr")

library(httr)
library(jsonlite)

url <- "localhost:3333/texts"

dados_post <- list("title" = "mineracao",
                   "autor" = "blog",
                   "content" = transforme_sobre_texto)

json_dados <- toJSON(dados_post, auto_unbox = TRUE)

response <- POST(
  url,
  body = json_dados,
  encode = "json",
  add_headers("Content-Type" = "application/json")
)
