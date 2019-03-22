
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


#명목형자료, 순위형자료
gender = c("male","female","male","male","female")
f_gender = factor(gender,levels = c("male","female"),ordered = T)

f_gender

jumsu = c(1,1,5,5,4,2,3,2,3,3,3,4)
f_jumsu = factor(jumsu,levels = c(5,4,3,2,1))
f_jumsu
sort(jumsu)
sort(f_jumsu)
