library(ggplot2)
df_mpg = mpg

#in place
names(df_mpg)[8] = "city" 
names(df_mpg)[9] = "highway" 
names(df_mpg)[10] = "fuel"

names(df_mpg)[8:10] = c("city","highway","fuel") 
names(df_mpg)[c(8,9,10)] =  c("city","highway","fuel")


library(dplyr)
df_mpg2 = mpg
#out place
rename(df_mpg2, city=cty, highway=hwy, fuel=fl) -> df_mpg3

