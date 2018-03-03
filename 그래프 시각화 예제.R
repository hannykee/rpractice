#그래프 실전예제들(정형데이터)
rm(list=ls())

setwd("c:\\r_temp")
data1 <- read.csv("2013년_서울_주요구별_병원현황.csv", header=T)
data1

barplot(as.matrix(data1[1:9,2:11]),
        main=paste("서울시 주요 구별 과목별 병원현황-2013년","\n",
                   "출처[국민건강보험공단]"), ylab="병원수",beside=T,
        col=rainbow(8),ylim=c(0,350))

abline(h=seq(0,350,10),lty=3,lwd=0.2)

name <- data1$표시과목
name

legend(75,350,name,cex=0.8,fill=rainbow(8),bg="white")

savePlot("hospital.png",type="png")





head(data1)

#2번 구별로 따로 그래프 출력하기
v1<- data1[1:9,2]*0.1  #강남구
v2<- data1[1:9,3]*0.1  #강동구
v3<- data1[1:9,4]*0.1
v4<- data1[1:9,5]*0.1
v5<- data1[1:9,6]*0.1
v6<- data1[1:9,7]*0.1
v7<- data1[1:9,8]*0.1
v8<- data1[1:9,9]*0.1
v9<- data1[1:9,10]*0.1
v10<- data1[1:9,11]*0.1

par(mfrow=c(2,5)) #2행 5열로 그래프 배치하기
name <- data1$표시과목
name

#강남구 그래프 그리기
gangnam <- barplot(as.matrix(v1),main="강남구 병원현황",
                   beside=T,axes=F,ylab="병원수(단위:10개)",
                   xlab="",cex.names=0.85, las=2,
                   ylim=c(0,40), col=rainbow(8), border="white",
                   names.arg=name)
axis(2,ylim=seq(0,35,10))   #실선 그리기
abline(h=seq(0,35,5),lty=2)  #눈금표 그리기


#강동구 그래프 그리기
gangnam <- barplot(as.matrix(v2),main="강동구 병원현황",
                   beside=T,axes=F,ylab="병원수(단위:10개)",
                   xlab="",cex.names=0.85, las=2,
                   ylim=c(0,40), col=rainbow(8), border="white",
                   names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

#강서구 그래프 그리기
gangnam <- barplot(as.matrix(v3),main="강서구 병원현황",
                   beside=T,axes=F,ylab="병원수(단위:10개)",
                   xlab="",cex.names=0.85, las=2,
                   ylim=c(0,40), col=rainbow(8), border="white",
                   names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)

#관악구 그래프 그리기
gangnam <- barplot(as.matrix(v4),main="관악구 병원현황",
                   beside=T,axes=F,ylab="병원수(단위:10개)",
                   xlab="",cex.names=0.85, las=2,
                   ylim=c(0,40), col=rainbow(8), border="white",
                   names.arg=name)
axis(2,ylim=seq(0,35,10))
abline(h=seq(0,35,5),lty=2)
