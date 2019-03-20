#1.popadults는 해당 지역의 성인인구, poptotal은 전체 인구를 나타냅니다.
#midwest 데이터에 '전체 인구 대비 미성년 인구 백분율'(ratio_child)변수를 추가하세요

library(tidyverse)
library(sqldf)


#sql
sqldf("
      select *,(poptotal-popadults)/poptotal*100 as ratio_child from midwest limit 5
      ") 

#ratio_child에 값이 제대로 입력되지 않음

#dplyr
midwest %>% mutate(ratio_child = (poptotal-popadults)/poptotal*100) -> midwest

#r syntax

midwest$ratio_child = (midwest$poptotal-midwest$popadults)/midwest$poptotal*100
