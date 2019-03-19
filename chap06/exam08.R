library(tidyverse)
library(RSQLite)
library(DBI)
library(sqldf)

test1 <- data.frame(id = c(1,2,3,4,5,6),midterm= c(60,80,70,90,85,70))

test2 <- data.frame(id=c(1,2,3,4,5,7),final=c(70,83,65,95,80,85))

left_join(test1,test2,by='id')
right_join(test1,test2,by='id')
full_join(test1,test2,by='id')
inner_join(test1,test2,by='id')

#inner
sqldf("
      select t1.id, midterm, final from test1 t1 inner join test2 t2 on t1.id = t2.id
      ")
#left
sqldf("
      select t1.id, midterm, final from test1 t1 left join test2 t2 on t1.id = t2.id
      ")
#right
sqldf("
      select t2.id, midterm, final from test2 t2 left join test1 t1 on t1.id = t2.id
      ")
#full
sqldf("
      select t1.id, midterm, final from test1 t1 left join test2 t2 on t1.id = t2.id
      union
      select t2.id, midterm, final from test2 t2 left join test1 t1 on t1.id = t2.id
      ")

exam = read.csv("Data/csv_exam.csv")

name <- data.frame(class=c(1,2,3,4,5), teacher=c("kim","lee","park","choi","jung"))

exam_new <- left_join(exam, name, by = "class")
exam_new

sqldf("
      select id, e.class, math, english, science, teacher from exam e left join name n on e.class = n.class
      ")


group_a <-data.frame(id=c(1,2,3,4,5,11),
                     test=c(60,80,70,90,85,100))

group_b <-data.frame(id=c(6,7,8,9,10,11),
                     test=c(70,83,65,95,80,100))

group_a %>% bind_rows(group_b) %>%  distinct()

sqldf("
        select * from group_a
        union
        select * from group_b
      ")

group_a %>% bind_rows(group_b)

sqldf("
        select * from group_a
        union all
        select * from group_b
      ")

mpg->df_mpg

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)

sqldf("
      select model, m.fl, price_fl from mpg m left join fuel f on m.fl = f.fl limit 5
      ")

mpg <- left_join(mpg, fuel, by = "fl")
mpg %>% select(model, fl, price_fl) %>% head(5)

View(midwest)

midwest <- as.data.frame(midwest)

midwest <- midwest %>%
  mutate(ratio_child = (poptotal-popadults)/poptotal*100)

midwest %>%
  arrange(desc(ratio_child)) %>%
  select(county, ratio_child) %>%
  head(5)

midwest <- midwest %>%
  mutate(grade = ifelse(ratio_child >= 40, "large",
                        ifelse(ratio_child >= 30, "middle", "small")))

table(midwest$grade)


midwest %>%
  mutate(ratio_asian = (popasian/poptotal)*100) %>%
  arrange(ratio_asian) %>%
  select(state, county, ratio_asian) %>%
  head(10)
