library(tidyverse)
library(lubridate)

ggplot(economics,aes(date,psavert)) + geom_line() +
  xlim(c(ymd(20000101),ymd(20160101)))


#1. 반별 과목 점수분포
#2. 과목 반 점수분포
exam = read_csv("Data/csv_exam.csv")


exam_long = gather(exam,"subject","score",`math`,`english`,`science`)

exam_long$class = factor(exam_long$class)

exam %>% ggplot(aes("math",math))+geom_boxplot()

exam_long %>% ggplot(aes(subject,score)) + geom_boxplot()

exam_long %>% ggplot(aes(subject,score,color=class)) + geom_boxplot()

exam_long %>% ggplot(aes(class,score,color=subject)) + geom_boxplot()


