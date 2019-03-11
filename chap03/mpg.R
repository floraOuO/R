library(ggplot2)
library(sqldf)
x=c("a","a","b","c","d","d")
qplot(x)

mpg
sqldf("
      select distinct manufacturer from mpg
    ")

sqldf("
      select count(*) from mpg
    ")

sqldf("
      select manufacturer,round(avg(cty),2) as cty_avg,round(avg(hwy),2) as hwy_avg  from mpg
    group by manufacturer
    order by avg(cty) desc
    ") ->mpg_ctyhwy_mean

mpg_ctyhwy_mean
qplot(mpg_ctyhwy_mean$manufacturer,mpg_ctyhwy_mean$cty_avg)

qplot(mpg$hwy)
table(mpg$drv)
