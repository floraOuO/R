library(ggplot2)
library(sqldf)
library(readxl)

excel_exam <- readxl::read_excel("Data/excel_exam.xlsx")

str(excel_exam)

sqldf("
      select class, max(math),max(english),max(science)
      from excel_exam group by class
      ")
