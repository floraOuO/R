library(dplyr)
library(sqldf)

csv = read.csv("Data/csv_exam.csv")

csv %>% head(10) %>% tail(3) %>% head(2)

csv[csv$class==2,c("math","english","science")] ->csv_temp
mean(csv_temp$math) -> m_avg
mean(csv_temp$english) -> e_avg
mean(csv_temp$science) -> s_avg
data.frame(m_avg,e_avg,s_avg)

colMeans(csv_temp)
csv$id = NULL

csv %>% filter(class==2) %>% 
        summarise(m_avg=mean(math),
                  e_avg=mean(english),
                  s_avg=mean(science))

sqldf("
      select avg(math), avg(english), avg(science) from csv where class=2
      ")

csv %>% filter(class !=1)
csv %>% filter(math>50)
csv %>% filter(math<50)
csv %>% filter(english>=80)
csv %>% filter(english<=80)
csv %>% filter(class==1,math>=50)
csv %>% filter(class==2,english>=80)
csv %>% filter(math>=90 | english>=90)
csv %>% filter(english<90 | science<50)
csv %>% filter(class==1 | class==3 | class==5)
csv %>% filter(class %in% c(1,3,5))
class1 <- csv %>% filter(class==1) 
class2 <- csv %>% filter(class==2)

mean(class1$math)
mean(class2$math)

library(ggplot2)
df_mpg = mpg
df_mpg %>% filter(displ<=4) -> f_under
df_mpg %>% filter(displ>=5) -> f_over

mean(f_under$hwy)
mean(f_over$hwy)

df_mpg %>% filter(manufacturer=="audi") -> audi
df_mpg %>% filter(manufacturer=="toyota") -> toyota

mean(audi$cty)
mean(toyota$cty)

df_mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda')) -> ex1 
mean(ex1$hwy)
