#그래픽 기초

plot(y축 데이터, 옵션)
plot(x축 데이터, y축 데이터, 옵션)

par(옵션) 
#main=제목
#xlab 문자 -> x축 문자열
#ann=F 제목 미지정 후 따로 만든다.
#axes = F (x,y축을 표시하지 않습니다.)-> 내가 따로 만든다.
#type="p"기본값으로 점모양 그래프
#lty=0, 혹은 lty=solid... 선의 모양
#col=1 혹은 "blue" 점의 색상
#lwd="숫자" 선의 굵기
#cex="숫자" 문자의 두께

var1 <-c(1,2,3,4,5)
plot(var1)

x<- 1:3
y<- 3:1
plot(x,y,xlim=c(1,10),ylim=c(1,5))
              #한계선 설정 (축 간격은 자동 설정)

plot(x,y,xlim=c(1,10),ylim=c(1,5),
     xlab="X축 값",ylab="Y축 값",main="Plot Test")
#안 나올 경우에는 빗자루로 Plots창을 청소하든지

#그림 그리기 전에 스케치북 넘겨주듯이 사용
plot.new()
dev.new()를 활용하면 plot 팝업창을 새로 만들어준다.

axis(1이면 x축 2이면 y축 그린다.)


#좀 더 멋진 그래프

v1<- c(100,130,120,160,150)
#그래프 선그리기
plot(v1,type='o',col='red',ylim=c(0,200),
     axes=FALSE, ann=FALSE)
#옵션 1이니까 x축 그리기 0부터 200까지
axis(1,at=1:5,
     lab=c("MON","TUE","WED","THU","FRI"))
#옵션 2이니까 y축 그리기 0부터 200까지
axis(2,ylim=c(0,200))
#제목 붙여진다.
title(main="FRUIT", col.main="red",font.main=4)
title(xlab="DAY",col.lab="black")
title(ylab="PRICE",col.lab="blue")



#그래프 배치 조정하기  #마크다운 방식이라 발달
v1 <- c(100,130,120,160,150)
par (mfrow = c(행의 수, 열의 수))
par(mfrow=c(1,3))
plot(v1,type="o")
plot(v1,type="s")
plot(v1,type="l")


#원형그래프 
par(mfrow=c(1,3))
barplot(v1)  #바플롯!
pie(v1)
plot(v1,type="o")


#여백 조정하기
a <- c(1,2,3)
plot(a,xlab="aaa")
par(mgp=c(0,1,0)) #0부터 0,1,2,3가능
                  #그래프가 딱 붙음(마지막)
plot(a,xlab="aaa")




par(mgp=c(0,1,0)) 제목 위치, 지표값 위치, 지표선위치
plot(a,xlab="aaa")

#oma를 이용하면 그래프의 위치를 조정할 수 있다(그래프 전체의 여백 조정)
par(oma=c(2,1,0,0)) #아래,왼,위,오른쪽 여백
plot(a,xlab="aaa")
아래쪽, 왼쪽, 위, 오른쪽





플롯은 무조건 하나만 그린다.
#여러 개의 그래프를 하나의 페이지에 중첩으로 그리기
플롯은 무조건 하나만 그린다.

par(mfrow=c(1,1))
v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3<- c(3,4,5,6,7)

#잘못된 예시 plot은 무조건 하나#
plot(v1, type="s",col="red",ylim=c(1,5))
par(new=T)
plot(v2, type="o",col="blue",ylim=c(1,5))
par(new=T) ##추가할 때마다 그려줌
plot(v3, type="l",col="green")

#옳은 예시 plot하나와 다른 함수들 사용#
plot(v1,type="s",col="red",ylim=c(1,10))
lines(v2,type="o",col="blue",ylim=c(1,5))
lines(v3,type="l",col="green",ylim=c(1,15))

#범례만들기
legend(4,9,c("v1","v2","v3"),cex=0.9,col=c("red","blue","green"),lty=1)
                            #점 크기, 점 색상, 라인 굵기


rm(list=ls())

#실습문제 보고서
#1.
c1 <- c(3,4,5,6,7)
plot(c1)

#2.
c2 <- c(3,3,4,4)
plot(c2)

#3.
c3 <- c(3,3,3)
c4 <- c(2,3,4)
plot(c3,c4)

#4.
c5 <- c(10,20,30,40,50,60,70,80,90)
c6 <- c(10,9,8,7,6,5,4,3,2)
plot(c5,c6)

#5.
c8 <- c(2,4,6,8)
c7 <- c(16,17,19,18)
plot(c8,c7,xlim=c(0,10),ylim=c(15,20),xlab="a",ylab="b")

#실습문제(2) 보고서
#1
par(mgp=c(2,1,0))  #제목 위치, 지표값 위치, 지표선위치
plot(c8,c7,xlim=c(0,10),ylim=c(15,20),xlab="a",ylab="b")

par(mgp=c(4,2,0))
plot(c8,c7,xlim=c(0,10),ylim=c(15,20),xlab="a",ylab="b")



#2 그래프 여백
par(oma=c(4,0,0,0)) #아래,왼,위,오른쪽 여백
plot(c8,c7,xlim=c(0,10),ylim=c(15,20),xlab="a",ylab="b")

par(oma=c(0,4,0,0)) #아래,왼,위,오른쪽 여백
plot(c8,c7,xlim=c(0,10),ylim=c(15,20),xlab="a",ylab="b")

par(oma=c(0,0,4,0)) #아래,왼,위,오른쪽 여백
plot(c8,c7,xlim=c(0,10),ylim=c(15,20),xlab="a",ylab="b")

par(oma=c(0,0,0,4)) #아래,왼,위,오른쪽 여백
plot(c8,c7,xlim=c(0,10),ylim=c(15,20),xlab="a",ylab="b")


#3
a1<- c(12,13,14,15,16,17,18)
a2 <- c(30,31,33,32,28,27,30)

plot(a1,a2,xlim=c(10,20),ylim=c(26,34),xlab="7월의 날짜(일)",
     ylab="최고 기온",main="일주일간 최고 기온변화")


b1<- c(1.0,2.0,2.0)
b2<- c(99,98,100)

plot(b1,b2,xlim=c(0.0,3.0),ylim=c(95,100),xlab="4학년(반)",
     ylab="점수(점)",main="4학년 1~3등반 분포")

#(4)보고서
p1 <- c(1,2,3,4,5)
p2 <- c(5,7,7,6,1)
plot(p1,p2,type="b",col="red",ann=FALSE,axes=FALSE)
title(main="학점별 학생수",col.main="red",font.main=4)
title(xlab="학점(점)")
title(ylab="점수(점)",col.lab="blue")
axis(1,at=1:5, lab=c("A","B","C","D","E"))
axis(2,ylim=c(0,8))


p3 <- c(1,2,3,4)
p4 <- c(12,13,20,22)
plot(p3,p4,type="b",col="red",ann=FALSE,axes=FALSE)
title(main="반별 어린이수",col.main="blue",font.main=4)
title(xlab="반이름")
title(ylab="인원수(명)")
axis(1,at=1:4, lab=c("나리","구슬","송이","난초"))
axis(2,ylim=c(10,24))

#5번 보관완료

#6번 두 그래프를 한 화면에 표시 1행 2열
par(mfrow=c(1,2))
p1 <- c(1,2,3,4,5)
p2 <- c(5,7,7,6,1)
plot(p1,p2,type="b",col="red",ann=FALSE,axes=FALSE)
title(main="학점별 학생수",col.main="red",font.main=4)
title(xlab="학점(점)")
title(ylab="점수(점)",col.lab="blue")
axis(1,at=1:5, lab=c("A","B","C","D","E"))
axis(2,ylim=c(0,8))


p3 <- c(1,2,3,4)
p4 <- c(12,13,20,22)
plot(p3,p4,type="b",col="red",ann=FALSE,axes=FALSE)
title(main="반별 어린이수",col.main="blue",font.main=4)
title(xlab="반이름")
title(ylab="인원수(명)")
axis(1,at=1:4, lab=c("나리","구슬","송이","난초"))
axis(2,ylim=c(10,24))



#(7) 보고서
v1 <- c(75,74,80,75,78,94)
v1_2 <- c(1,2,3,4,5,6)
v2 <- c(74,71,77,71,70,76)
plot(v1_2,v2,type="b",col="blue",ylim=c(70,90),ann=FALSE)
lines(v1,type="b",col="red")
title(xlab="Index")
title(ylab="v1")
legend(1,90,c("2003","2013"),cex=0.9,col=c("red","blue"),lty=1)

par(oma=c(0,0,4,0))
par(mfrow=c(1,1))
plot(v1_2,v2,type="b",ann=FALSE,axes=FALSE,col="blue")
lines(v1,type="b",col="red")
title(xlab="Index")
title(ylab="v1")
title(main="연령대별 평균 소비성향",col.main="blue",font.main=4)
axis(1,at=1:6, lab=c("20대","30대","40대","50대","60대","70대"))
axis(2,ylim=c(70,90))


#(8) 보고서
v1 <- c(37.4,50.3,63.6,67.2,81.1)
v1_2 <- c(1,2,3,4,5)
v2 <- c(82.2,88.1,84.7,77.2,56.3)
plot(v1_2,v2,type="b",col="blue",xlim=c(1,6),ylim=c(40,100),ann=FALSE)
lines(v1,type="b",col="red")
title(xlab="Index")
title(ylab="v1")
title(main="연령대별TV,스마트폰 이용률",col.main="blue",font.main=4)
legend(4,100,c("TV","스마트폰"),cex=0.9,col=c("red","blue"),lty=1)

par(oma=c(0,0,4,0))
par(mfrow=c(1,1))
plot(v1_2,v2,type="b",ann=FALSE,axes=FALSE,col="blue")
lines(v1,type="b",col="red")
title(xlab="연령")
title(ylab="미디어 이용률(%)")
title(main="연령대별 TV,스마트폰 이용률",col.main="blue",font.main=4)
axis(1,at=1:6, lab=c("10대","20대","30대","40대","50대","60대"))
axis(2,ylim=c(40,100))
legend(1,90,c("TV","스마트폰"),cex=0.9,col=c("red","blue"),lty=1)
