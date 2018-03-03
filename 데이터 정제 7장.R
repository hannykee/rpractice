#7장 데이터 정제 -빠진 데이터, 이상한 데이터 제거하기
library(googleVis)
library(ggplot2)
library(stringr)
library(sqldf)
library(dplyr)




df <- data.frame(sex = c("M","F",NA,"M","F"),
                 score = c(5,4,3,4,NA))
df

#결측지 확인하기 
is.na(df)
table(is.na(df))  #결측치 빈도 출력

table(is.na(df$sex)) #sex에서 결측치 빈도 출력
table(is.na(df$score))


#NA가 들어있지 않은 행만 추출해서 함수 적용

#############################참고만##############
df %>% filter(is.na(score)) #NA 데이터만 출력
df %>% filter(!is.na(score)) #score 결측치 제

#그래서 결측치 제거된 채로 함수 적용하는 방법

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)



###1) 여러 변수 동시에 결측치없는 데이터 추출하기
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))



##결측치가 하나라도 있으면 제거하는 함수

df_nomiss2 <- na.omit(df)
#주의! 분석에 필요한 데이터까지 손실될 가능성이 크다.'

####################################################



# ****************실제 결측치 제거 방법***********

그래서 na.rm=TRUE 라는 기능을 주로 사용한다.

mean(df$score, na.rm=T)
sum(df$score, na.rm=T)

setwd("c:\\r_temp")
exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA


exam %>% summarise(mean_math = mean(math)) #평균 산출
exam %>% summarise(mean_math = mean(math,na.rm=T),
                   sum_math = sum(math,na.rm=T),
                   median_math = median(math,na.rm=T))
                              #median(중앙값 산출)



###결츨치 대체법 대표값(평균,최빈값) 등으로 일괄 대체
# 혹은 통계분석 기법으로 예측값 추정해서 대체


mean(exam$math, na.rm=T)
exam$math <- ifelse(is.na(exam$math),55,exam$math) #**************
table(is.na(exam$math))
exam
mean(exam$math)



##이상치 제거하기--1 존재할 수 없는 값
outlier <- data.frame(sex=c(1,2,1,3,2,1),
                      score=c(5,4,3,4,2,6))
outlier
table(outlier$sex)  #분포 확인 값 3은 이상치
table(outlier$score)  #분포 확인 값 6은 이상치

#     이상치 ifelse구문으로 NA로 변경함
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$score <- ifelse(outlier$score ==6, NA, outlier$score)

#NA값 지우고 분석함
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))



##이상치 제거하기--2 극단적인 값

mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)  #주로 boxplot으로 극단적인 값 확인
boxplot(mpg$hwy)$stats #아래 극단치값 12, 위 극단치값 37 사이 외는 이상치로 봄

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy >37, NA,mpg$hwy)  #12~37 밖 이상치 NA처리
table(is.na(mpg$hwy))  #NA 값 확인(TRUE 3개 NA값)

mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy, na.rm = T))



#혼자서 해보기 문제

mpg <- as.data.frame(ggplot2::mpg)
head(mpg,10)

mpg[c(10,14,58,93),"drv"] <- "k"
mpg[c(29,43,129,203),"cty"] <- c(3,4,39,42)
#1
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv=='k',NA,mpg$drv)
table(is.na(mpg$drv))

#2
boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26,NA,mpg$cty)
boxplot(mpg$cty)

#3
mpg%>%
  filter(!is.na(mpg$drv))%>%
  group_by(drv)%>%
  summarise(mean_cty=mean(cty,na.rm=T))


#분석 도전- 보고서 첨부


midwest
#1
mid <- as.data.frame(ggplot2::midwest)
mid<-mid%>%
  mutate(ratio=((poptotal-popadults)/poptotal)*100)
head(mid)
#2
mid%>%
  arrange(desc(ratio))%>%
  select(county,ratio)%>%
  head(5)
#3
mid_1<-mid%>%
  mutate(ratio_class=ifelse(ratio>= 40,'large',
                            ifelse(ratio<30,'small','middle')))
head(mid_1)
table(mid_1$ratio_class)

#4
mid%>%
  mutate(ratio_r=(popasian/poptotal)*100)%>%
  arrange(ratio_r)%>%
  select(state,county,ratio_r)%>%
  head(10)
