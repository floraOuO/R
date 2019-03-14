read.csv("Data/welfare_utf8.csv") -> welfare


str(welfare)
View(welfare)

head(welfare)
head(welfare,20)
tail(welfare)
summary(welfare)

min(welfare$age)
quantile(welfare$age,1/4)
median(welfare$age)
mean(welfare$age)
quantile(welfare$age,3/4)
max(welfare$age)

IQR(welfare$age) #Q3 - Q1

library(ggplot2)

qplot(age,data=welfare)
qplot(age,data=welfare,geom="boxplot")

boxplot(welfare$age)
