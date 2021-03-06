
library(DBI)


con <- dbConnect(RSQLite::SQLite(), "dev/test.sqlite")

# Init
if (FALSE) {
  dbWriteTable(conn = con, name = "mtcars", value = mtcars)
  data("diamonds", package = "ggplot2")
  dbWriteTable(conn = con, name = "diamonds", value = as.data.frame(diamonds))
  # dbDisconnect(con)
}

dbIsValid(dbObj = con)

# List tables
dbListTables(conn = con)

# List fields
dbListFields(conn = con, name = "mtcars")


get_db_infos <- function(conn, schema = NULL) {
  tables <- dbListTables(conn = conn, schema = schema)
  lapply(
    setNames(tables, tables),
    FUN = dbListFields, conn = conn, schema = schema
  )
}
get_db_infos(con)

jsonlite::toJSON(x = get_db_infos(con))


