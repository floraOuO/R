library(dplyr)
library(sqldf)
library(ggplot2)

exam = read.csv("Data/csv_exam.csv")

#1.sqldf
sqldf("
      select class, avg(math) as mean_math, sum(math) as sum_math,
                  median(math) as median_math, count(math) as n
        from exam
        group by class
      ")


#2.dplyr
exam %>%
  group_by(class) %>%
  #
  summarise(mean_math = mean(math),
            #
            sum_math = sum(math),
            #
            median_math = median(math), #
            n = n())

#3.r syntx
for (class in unique(exam$class)) {
  print(paste(class,"그룹"))
  #split
  temp = exam[exam$class==class,]
  
  #apply
  mean_math = mean(temp$math)
  sum_math = sum(temp$math)
  median_math = median(temp$math)
  n = length(temp$math)
  group_temp = data.frame(class, mean_math,sum_math,median_math,n)
  
  #combine
  if (which(unique(exam$class)==class) == 1)
    result = group_temp
  else
    result = rbind(result, group_temp)
  
  print(group_temp)
  print("=================")
  print(result)
  }

