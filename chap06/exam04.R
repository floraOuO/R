library(dplyr)
library(sqldf)
library(ggplot2)

df_mpg = mpg

#1.sqldf
sqldf("
    select df_mpg.*, cty+hwy as total, (cty+hwy)/2. as mean from df_mpg
      order by mean desc limit 3
      ")


#2.dplyr
df_mpg %>% mutate(total = cty + hwy) ->df_mpg
df_mpg %>% mutate(mean = total/2) -> df_mpg
df_mpg %>% arrange(desc(mean)) %>% head(3)

df_mpg %>%
  mutate(total = cty + hwy,
         mean = total/2) %>%
  arrange(desc(mean)) %>% head(3)

#3.r syntx
df_mpg$total = df_mpg$cty + df_mpg$hwy
df_mpg$mean = df_mpg$total/2
head(df_mpg[order(-df_mpg$mean),],3)
