library(tidyverse)

exam_df = read.csv("Data/csv_exam.csv")

exam_tbl = read_csv("Data/csv_exam.csv")


exam_df = as_tibble(exam_df)
exam_df

exam_tbl


qplot(factor(fl,levels=c("p","r","c","e","d")),hwy,data = mpg,geom = "boxplot")

boxplot(hwy~fl,data = mpg)

boxplot(mpg$hwy)$stats
