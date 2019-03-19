library(ggplot2)
csv = read.csv("Data/csv_exam.csv")
df_mpg = as.data.frame(mpg)

csv
colnames(csv)
rownames(csv)
csv$class
csv[c("class",'science')]
csv[c(2,5)]
rownames(csv)[1] = "one"
csv["one",]
x = c(T,T,F,F,F,F,F,F,F,T,F,F,F,F,F,F,F,F,F,F)
csv[x,]

csv$math >=80
csv[csv$math>= 80,]
csv[csv$math>= 80 & csv$english >=90,]
csv$teacher = "xxx"


csv[c("teacher","class","math","english","science")] -> csv2
csv2[csv2$class==1,]$teacher = "홍길동"
csv2[csv2$math %in% c(50,45),"math"]=100
csv2
csv[c("teacher","class","math","english","science")] -> csv3
csv3
fn$sqldf(c("
        update csv3 set math=100 where math in(50,45)
      "," select * from csv3")) -> csv3

csv3

csv[c("teacher","class","math","english","science")] -> csv4
csv4[csv4$class!=2,] -> csv4
csv4

csv[c("teacher","class","math","english","science")] -> csv5
sqldf(c("
        delete from csv5 where class=2","select * from csv5")) -> csv5
csv5

csv[c("teacher","class","math","english","science")] -> csv6
csv6
one = data.frame(teacher="홍길동",class=1,math=60,english=80,science=70)
one
rbind(csv6,one) -> csv6

csv[c("teacher","class","math","english","science")] -> csv7
sqldf(c("insert into csv7 values ('홍순이',1,90,95,100)","select * from csv7")) ->csv7
csv7











library(sqldf)
sqldf("
      select * from csv where math >=80 and english>=90
      ")

df_mpg
colnames(df_mpg)
rownames(df_mpg)
