read.csv("Data/welfare_utf8.csv")->welfare
read.csv("Data/welfare_utf8.csv",stringsAsFactors = F)-> welfare_no


welfare_no[welfare_no$sex=='male',] -> welfare_male
welfare_no[welfare_no$sex=='female',] -> welfare_female

table(welfare_male$sex)
table(welfare_female$sex)

write.csv(welfare_male,file = "Data/welfare_male.csv")
write.csv(welfare_female,file = "Data/welfare_female.csv")

save(welfare_male,welfare_female,file="Data/welfare.rda")

load("Data/welfare.rda")
