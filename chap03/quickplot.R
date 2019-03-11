library(ggplot2)
library(sqldf)

sample(seq(1,10,length.out = 100),size=1000,replace = T) ->data1

length(data1)
str(data1)
table(data1)
qplot(data1)

sample(c('a','b','c','d'),100,replace = T,prob = c(0.2,0.5,0.9,0.3)) ->data2

table(data2)
qplot(data2)
