install.packages("httr")

library(httr)
library(jsonlite)

request_chat_clean <- function(content, url) {
  if (!url) {
    url <- "localhost:3333/texts"
  }
  data_post <- list("title" = "mineracao",
                    "autor" = "anonimo",
                    "content" = content)
  json_dados <- toJSON(data_post, auto_unbox = TRUE)
  
  tryCatch({
    response <- POST(
      url,
      body = json_dados,
      encode = "json",
      add_headers("Content-Type" = "application/json")
    )
    if (response$status_code == 201) {
      raw_content <- rawToChar(response$content)
      parsed_content <- fromJSON(raw_content)
      return(parsed_content)
    }
    
  }, error = function(e) {
    cat("Ocorreu um erro:", conditionMessage(e), "\n")
  })
}
