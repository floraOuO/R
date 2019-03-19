library(dplyr)
library(sqldf)
library(ggplot2)

#1.sqldf
sqldf("
      select manufacturer, model, displ, trans, hwy from mpg
      where manufacturer = 'audi' order by hwy desc limit 5
      ")


#2.dplyr

mpg %>% select(manufacturer, model, displ, trans, hwy) %>% 
        filter(manufacturer=='audi') %>% 
        arrange(desc(hwy)) %>% head(5)


#3.r syntx

df_audi = mpg[mpg$manufacturer=='audi',c("manufacturer","model","displ","trans","hwy")]
head(df_audi[order(-df_audi$hwy),],5)
