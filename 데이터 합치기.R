#20180111 김환희(앞에 봐야함)

#가로로 합치기
test1<- data.frame(id=c(1,2,3,4,5),
                   midterm=c(60,70,80,90,85))
test2<- data.frame(id=c(1,2,3,4,5),
                   final=c(70,83,65,95,80))
total <- left_join(test1,test2, by="id")

##다른 데이터를 활용해 변수 추가하기
name <- data.frame(class = c(1,2,3,4,5),
                   teachter=c("kim","lee","park","choi","jung"))
exam_new <- left_join(exam,name,by="class")
exam_new

#세로로 합치기
group_a <- data.frame(id=c(1,2,3,4,5),
                      test=c(60,80,70,90,85))
group_b <- data.frame(id=c(6,7,8,9,10),
                      test=c(70,83,65,95,80))
group_all <- bind_rows(group_a, group_b)

group_all

#id와 test 변수명이 같다. 
#변수 명이 다르다면 rename()을 활용해 동일하게 맞춘 후에 합치면 된다.

library(googleVis)
library(ggplot2)
library(stringr)
library(sqldf)
library(dplyr)
head(mpg)

fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_f1=c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
fuel

mpg_1<-left_join(mpg,fuel,by="fl")

