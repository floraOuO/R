english <-c(90,80,60,70)
math <-c(50,60,100,20)

df_midterm <- data.frame(english,math)

df_midterm

data.frame(제품=c("사과","딸기","수박"),
             가격=c(1800,1500,3000),
             판매량=c(24,38,13))  -> ex1


mean(ex1$가격)
mean(ex1$판매량)

library(sqldf)

sqldf("
      select avg(가격) from ex1
      ")

sqldf("
      select avg(판매량) from ex1
      ")
