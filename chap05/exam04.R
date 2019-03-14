library(ggplot2)
library(dplyr)

df_mpg = mpg

df_mpg$total = (df_mpg$cty+df_mpg$hwy)/2

mutate(mpg, total=(cty+hwy)/2) -> df_mpg2

summary(df_mpg$total)

hist(df_mpg$total)

df_mpg$test = ifelse(df_mpg$total >= 20, "pass", "fail") 
df_mpg$grade = ifelse(df_mpg$total>=30,"A", 
                      ifelse(df_mpg$total>=25,"B",
                             ifelse(df_mpg$total>=20,"C","D")))

table(df_mpg$grade)

table(df_mpg$test)
qplot(df_mpg$test)
