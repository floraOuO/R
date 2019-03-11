library(ggplot2)
library(sqldf)

read.csv("Data/csv_exam.csv") -> csv_exam

sqldf("
      select * from csv_exam
      ")

sqldf("
      select class, count(*), avg(math),
                              avg(english),
                              avg(science)
        from csv_exam
        group by class
      ")
