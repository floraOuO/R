library(ggplot2)

View(mpg)
str(mpg)
attach(mpg)
sort(manufacturer,decreasing = T)
head(sort(manufacturer))
table(manufacturer)
length(table(manufacturer))
mpg[,c("manufacturer","model")] ->mpg_model
as.data.frame(mpg_model)->x

mpg_model[order(-rank(manufacturer),-rank(model)),] ->mpg_model_sort
View(mpg_model_sort)

sort(c(10,5,9,20,1))

library(sqldf)
sqldf("
      select manufacturer, model
      from mpg_model
      order by manufacturer desc, model
      ")

df_mpg = as.data.frame(mpg)
names(df_mpg)[8] <- "city" 
names(df_mpg)[9] <- "highway" 

v1 = c(10,5,9,200,79)
sort(v1,decreasing = T)
order(v1)
order(v1,decreasing = T)
rank(v1)
rank(-v1)

