library(dplyr)
library(sqldf)
library(ggplot2)

df_mpg = mpg

#1.sqldf
sqldf("
  select  manufacturer, avg((cty+hwy)/2) as mean from mpg
      where class = 'suv'
      group by manufacturer
      order by mean desc limit 5  
      ")


#2.dplyr
mpg %>%
  group_by(manufacturer) %>%
  filter(class == "suv") %>%
  mutate(tot = (cty+hwy)/2) %>%
  summarise(mean_tot = mean(tot)) %>%
  arrange(desc(mean_tot)) %>%
  head(5)

#3.r syntx
