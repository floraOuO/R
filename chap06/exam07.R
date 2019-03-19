library(tidyverse)

mpg %>% select(manufacturer,cty,hwy)


#4

library(RSQLite)
library(DBI)

con = dbConnect(SQLite(), "test_db.sqlite")
dbListTables(con)
dbWriteTable(con, "mpg_s",mpg)

dbGetQuery(con,
           "
          select manufacturer, class, count(*) as n
          from mpg_s
          where class = 'compact'
          group by manufacturer
          order by n desc
           ")

dbDisconnect(con)
