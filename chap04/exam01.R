# R 자료구조(변수)
# 1.verctor (1차원, 모든 원소의 타입이 같다)
# 2.matrix (2차원, 모든 원소의 타입이 같다)
# 3.array (n차원, 모든 원소의 타입이 같다)
# 4.factor(1차원, enum)
# 5.list (dictionary,key-value, 다른 원소의 타입을 저장할 수 있다)
# 6.data.frame(2차원, 다른원소의 타입을 저장할 수 있다)

#원소(값)의 타입
#1. integer(정수) 10L
#2. numeric(실수) 10 5.2
#3. complex(복소수) 10 + 20i
#4. charactor(문자열) 'xxx', "yyyy"
#5. logical(논리) TRUE, FALSE, T, F
#6. NA(Not Availble)

c(10L,NA,20L) -> v_integer
c(10,NA,20) -> v_numeric
c(10i,NA,20i) -> v_complex
c("10",NA,"20") -> v_character
c(T,NA,FALSE) -> v_logical


#data.frame 생성

english <-c(60,50,30,70)
math <-c(10,40,50,60)

df_exam <- data.frame(english,math)

df_exam

read.csv('Data/csv_exam.csv') -> df_csv

library(readxl)
read_excel("Data/excel_exam.xlsx") -> df_excel

df_excel

#colunm
df_csv$class
#row
df_csv[c(2,5,10),c("class","math")]
df_csv[df_csv$class==2,c("class","math")]

library(sqldf)

sqldf("
      select class from df_csv
      ")

sqldf("
      select class, math
      from df_csv
      where class=2
      ")
