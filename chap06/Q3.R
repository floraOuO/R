#3.분류표의 기준에 따라 미성년 비율 등급 변수(grade)를 추가하고, 
#각 등급에 몇 개의 지역이 있는지 알아보세요

library(tidyverse)
library(sqldf)

#sql
  sqldf("
        select midwest.*, grade = 
                            CASE ratio_child
                              WHEN ratio_child>=40 THEN 'large'
                              WHEN ratio_child>=30 THEN 'middle'
                              ELSE 'small'
                            END as grade
        from midwest
        ") 
  
  #grade에 원하는 값이 제대로 입력되지 않음

#dplyr

midwest %>% mutate(grade = ifelse(ratio_child >=40,'large',
                                  ifelse(ratio_child >=30, 'middle','small'))) ->midwest
table(midwest$grade)

#r syntax

midwest$grade = ifelse(midwest$ratio_child>=40,'grade',ifelse(midwest$ratio_child>=30,'middle','small')) 

table(midwest$grade)
  
