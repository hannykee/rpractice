v1 <- c(100,120,140,160,180)
v2 <- c(210,130,150,140,170)
v3 <- c(140,170,120,110,160)

qty <-data.frame(BANANA=v1,
                 CHERRY=v2,
                 ORANGE=v3)
barplot(as.matrix(qty),main="Fruit's Sales QTY",
        beside=T,col=rainbow(nrow(qty)),ylim=c(0,400))
legend(14,400,c("MON","THU","WED","THU","FRI"),cex=0.8,
       fill=rainbow(nrow(qty)))
      # 네모모양 무지개색깔(qty 행만큼)
 #행열형태로 취급


#전치행렬 t(qty) 로 그래프를 그리면 방향을 바꿀 수 있다!


#조건별로 색칠하기
peach <- c(180,200,250,198,170)
colors <-c()
for (i in 1:length(peach))
{if(peach[i] >=200 )
{colors <- c(colors,"red")}
  else if (peach[i]>=180)
  {colors <- c(colors,"yellow")}
  else
  {colors <- c(colors,"green")}
}

barplot(peach,main="Peach Sales QTY",
        names.arg=c("MON","TUE","WED","THU","FRI"),col=colors)


#히스토그램
par(mfrow=c(1,2),oma=c(2,2,0.1,0.1))
hist <- c(1,1,2,3,3,3)
hist(hist)
plot(hist,main="Plot")


#파이 차트는 반시계방향(시계방향은 clockwise=F)


par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
p1 <- c(10,20,30,40)

#round 반올림

pct <- round(p1/sum(p1) *100,1) #소수점 첫번째 자리 안에서 반올림
lab1 <- c("Week1","Week2","Week3","Week4")
lab2 <- paste(lab1, "\n",pct,"%")
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),label=lab2)
