library(ggplot2)
library(dplyr)

# 문제1. ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.
library(ggplot2)
library(dplyr)

df_midwest = midwest

View(df_midwest)
str(df_midwest)
head(df_midwest)
tail(df_midwest)
summary(df_midwest)


# 문제2. poptotal(전체인구)을 total로, popasian(아시아 인구)을 asian으로 변수명을 수정하세요.

rename(df_midwest, total=poptotal, asian=popasian) -> df_midwest2

names(df_midwest2[5])
names(df_midwest2[10])


# 문제3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보세요.

df_midwest2$ratio = df_midwest2$asian/df_midwest2$total*100
hist(df_midwest2$ratio)


# 문제4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요

mean(df_midwest2$ratio)

df_midwest2$group = ifelse(df_midwest2$ratio > mean(df_midwest2$ratio), "large", "small")


# 문제5. "lage"와 "small"에 해당하는 지역이 얼마나 되는지, 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.

table(df_midwest2$group)
qplot(df_midwest2$group)