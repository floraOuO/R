library(tidyverse)
print(midwest,length=Inf)

table(midwest$state)

midwest %>% group_by(state) %>% summarise(state_total=sum(poptotal))

economics

ggplot(economics,aes(date,pop)) +geom_line()

options(scipen = 99)
ggplot(midwest,aes(poptotal,popasian))+
            geom_point() + lims(x=c(1,5*10**5),y=c(1,10**4))

welfare = read_csv("Data/welfare_utf8.csv")
welfare_r = read.csv("Data/welfare_utf8.csv")


str(welfare)
str(welfare_r)
table(welfare$sex)
table(is.na(welfare$income))

welfare %>% filter(!is.na(sex),!is.na(income)) %>%
            select(sex,income) %>% group_by(sex) %>% 
            summarise(avg=mean(income)) -> incomebysex

# 평균 막대 그래프 geom_col()
# 빈도 막대 그래프 geom_bar()

library(plotly)

incomebysex %>% ggplot(aes(sex,avg,fill=sex)) + geom_col() + scale_fill_manual(values = c("red","blue"))

welfare %>% ggplot(aes(sex)) + geom_bar() -> incomebysex_plot
ggplotly(incomebysex_plot)

mpg -> df_mpg

mpg %>% group_by(manufacturer) %>% filter(class=="suv") %>% summarise(avg_cty=mean(cty)) %>% 
        arrange(desc(avg_cty)) %>% head(5) -> suvcty

suvcty %>% ggplot(aes(reorder(manufacturer,-avg_cty),avg_cty)) + geom_col()

mpg %>% ggplot(aes(class)) + geom_bar()


#---------

exam = read_csv("Data/csv_exam.csv")

exam = exam %>% group_by(class) %>% 
  summarise(math=mean(math),
            english=mean(english),
            science=mean(science))

exam[c("class","math")] -> exam_math
exam[c("class","english")] -> exam_english
exam[c("class","science")] -> exam_science


names(exam_math) <- c("class","mean")
names(exam_english) <- c("class","mean")
names(exam_science) <- c("class","mean")
exam_math$subject = "math"
exam_science$subject = "science"

rbind(exam_math[c("class","subject","mean")],
      exam_english[c("class","subject","mean")],
      exam_science[c("class","subject","mean")]) -> exam_long 

exam_long

gather(exam,key="subject",value = "mean",`math`,`english`,`science`) -> exam_long2

exam_long2

exam_long %>% ggplot(aes(class,mean,fill=subject)) + geom_col(position="dodge")

all(exam_long == exam_long2)                

#------------------------
read_csv("Data/csv_exam.csv") -> exam
library(sqldf)   
sqldf("
          select class,'math' as subject, avg(math) as mean from exam group by class
          union all          
          select class,'english' as subject, avg(english) as mean from exam group by class
          union all
          select class,'science' as subject, avg(science) as mean from exam group by class
        ") %>% 
  # group_by(class) %>% 
  #   summarise(math=mean(math),
  #             english=mean(english),
  #             science=mean(science)) %>% 
  #   gather("subject","mean",`math`,`english`,`science`) %>%
  mutate(class = factor(class,levels = 1:5,labels = paste(1:5,"반"))) %>% 
  mutate(subject=factor(subject,levels = c("math","english","science"))) %>% 
  ggplot(aes(class,mean,fill=subject)) + geom_col(position = "dodge")   #반별 과목
#ggplot(aes(subject,mean,fill=class)) + geom_col(position = "dodge")    #과목별 반


#-----------------------

ggplot(economics,aes(date,psavert)) + geom_line()
