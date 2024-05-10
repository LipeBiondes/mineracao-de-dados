install.packages("RSQLite")
library(RSQLite)
library(readr)

imdb <- read_csv("imdb.csv")
con <- dbConnect(RSQLite::SQLite(), "C:/Users/UEPA_07/Documents/Mineracao-de-dados/quinto/aula/imdb.db")

dbWriteTable(con, "imdb_data", imdb, overwrite = TRUE)
