library(tidyverse)
library(sparklyr)


sc = spark_connect("local")
mpg_tbl = copy_to(sc,mpg, overwrite = T)
midwest_tbl = copy_to(sc,midwest, overwrite = T)

exam_tbl = spark_read_csv(sc,"exam",path = "Data/csv_exam.csv")

exam_tbl %>% print(n=3)

mpg_tbl

spark_disconnect(sc)
