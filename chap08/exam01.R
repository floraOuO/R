library(tidyverse)

ggplot(data = mpg,mapping = aes(x=cty,y=hwy)) + geom_point()

ggplot(data = mpg,mapping = aes(x=cty,y=hwy)) + geom_jitter()


ggplot(mpg,aes(cty,hwy)) +geom_point(aes(colour=drv)) +labs(x="고속도로연비",y="도시연비")

mpg %>% ggplot(aes(cty,hwy,shape=drv))+geom_point()

test = read.csv("Data/csv_exam.csv")

ggplot(data=test,mapping = aes(x=math,y=english,color=class)) + geom_point()

ggplot(test,aes(math,english)) + geom_point(aes(colour=class))

test %>% ggplot(aes(math,english,shape=factor(class)))+geom_point()
