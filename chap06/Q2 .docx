#2.미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의 미성년 인구 백분율을 출력하세요.

library(tidyverse)
library(sqldf)


#sql
sqldf("
      select county, ratio_child from midwest order by ratio_child desc limit 5
      ")

#dplyr

midwest %>% arrange(desc(ratio_child)) %>% select(county, ratio_child) %>%  head(5)

#r syntax

head(midwest[order(-midwest$ratio_child),c("county","ratio_child")],5)
