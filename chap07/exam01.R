
#1. Missing Value(빠진 데이터/없는 데이터) -> NA, NaN
#2. Outlier(이상치)                        -> NA
#3. Extreme Value(극단치)                  -> NA
#  
# 데이터 
# 1. 양적자료(수치)
#   -연속형 자료(실수)
#   -이산형 자료(정수)
# 2. 질적자료(문자)
#   -순위형 자료
#   -명목형 자료(범주형)

library(tidyverse)
exam = read_csv("Data/csv_exam.csv")
is.na(exam)
table(is.na(exam))

exam[exam$math >50,]$math = NA

mean(exam$math, na.rm = T)

mpg <- as.data.frame(mpg)

mpg[c(65,124,131,153,212),"hwy"] <- NA

table(is.na(mpg$drv))
table(is.na(mpg$hwy))

mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean_hwy=mean(hwy))

mpg %>% group_by(drv) %>% summarise(mean_hwy=mean(hwy,na.rm = T))
