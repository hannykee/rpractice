setwd("c:\\r_temp")
install.packages("ggmap")
install.packages("stringr")
install.packages("KoNLP")

library(KoNLP)

library(ggmap)
library(stringr)


loc <- read.csv("서울_강동구_공영주차장_위경도.csv", header=T)
loc
#header csv중에 첫번째 글은 열머리 글 처리 해라


  #지도의 중심 가져와주세요
kd <- get_map("Amsa-dong",zoom=13,maptype = "roadmap")
  #점 찍어주세요
 #(암사동 중심 빈지도 만들기 ggmap(kd))

kor.map <- ggmap(kd) +geom_point(data=loc, aes(x=LON,y=LAT),
                                 size=3,alpha=0.7,color="red")
  #글자 찍어주세요
kor.map + geom_text(data=loc, aes(x=LON, y= LAT +0.001, label=주차장명)
                  ,size=3)
                    #글씨크기

#저장!
ggsave("c:\\r_remp/kd.png",dpi=500)



#시인지 구인지에 따라서 색 다르게 지정하기

loc2 <- str_sub(loc$주차장명, start=-2, end=-2)
loc2

colors <-c()
for (i in 1:length(loc2)){
  if(loc2[i]=='구'){
    colors <- c(colors,"red")}
  else{
    colors <- c(colors,"blue")}
  }

kd <- get_map("Amsa-dong",zoom=13, maptype="roadmap")

kor.map <- ggmap(kd) + geom_point(data=loc ,aes(x=LON,y=LAT),
                                  size=3, alpha=0.7,color=colors)
                      #색 지정할 때 순대로 사용한다.
kor.map + geom_text(data=loc, aes(x=LON, y=LAT+0.001,label=주차장명),
                    size=3)


#서울 지역별 장애인 도서관 위치 표시하기
loc <- read.csv("지역별장애인도서관정보.csv",header=T)
loc

kor <- get_map("seoul",zoom=11,maptype="roadmap")
kor.map <- ggmap(kor)+geom_point(data=loc,aes(x=LON,y=LAT),
                                 size=5, alpha=0.7)
                                        #낮을수록 점 불투명함
kor.map + geom_text(data=loc,aes(x=LON,y=LAT+0.001,label=자치구명),size=3)
ggmap("c:\\r_temp/lib.png",dpi=500)







###########################################중요

#필요한 데이터만 뽑아서 3개를 가지고 활용
#pop에서 추출해서 새로운 데이터프레임을 만듦
#데이터의 크기 기준에 따라 점의 진한 농도와 크기가 달라진다.

setwd("c:\\r_temp")
library(ggmap)
library(grid)
pop <- read.csv("지역별인구현황_2014_4월기준.csv",header=T)
pop
lon <- pop$LON
lat <- pop$LAT
data <- pop$총인구수
df <- data.frame(lon,lat,data)
df
map1 <- get_map("Jeonju",zoom=7,maptype='roadmap')
#map1 <- get_map("Jeonju",zoom=7,maptype='terrain')
map1 <- ggmap(map1)  #위치 잡은 지도를 변수에 넣어줌.
map1 +geom_point(aes(x=lon,y=lat,colour=data,size=data),
                 data=df)
                #아까 넣어준 데이터 프레임
ggsave("pop.png",scale=1,width=7,height=4,dpi=1000)


#지도 다른 유형
#원은 geom_point
#사각형은 stat_bin2d(colour,fill)

map3 <- get_map("Jeonju",zoom=7,maptype="satellite")
map3 <- ggmap(map3)
map3 + geom_point(aes(x=lon,y=lat,colour=data,size=data),
                  data=df)
ggsave("pop3.png",scale=1,width=7,height=4,dpi=1000)


# 하이드리드
map4 <- get_map("Jeonju",zoom=7,maptype="hybrid")
map4 <- ggmap(map4)
map4 + geom_point(aes(x=lon,y=lat,colour=data,size=data),data=df)
ggsave("pop4.png",sacle=1,width=7,height=4,dpi=700)

map5 <- get_map("Jeonju",zoom=7,maptype='roadmap')
map5 <- ggmap(map5)
map5 + stat_bin2d(aes(x=lon,y=lat,colour=data,fill=factor(data),
                      size=data),data=df)
ggsave("pop5.png",scale=2,width=7,height=4,dpi=700)




#미션-1 서울시 위치
loc <- read.csv("서울시구청위치정보_new.csv", header=T)
loc
#header csv중에 첫번째 글은 열머리 글 처리 해라


#지도의 중심 가져와주세요
kd <- get_map("seoul",zoom=11,maptype = "roadmap")
#점 찍어주세요
#(암사동 중심 빈지도 만들기 ggmap(kd))

kor.map <- ggmap(kd) +geom_point(data=loc, aes(x=LON,y=LAT),
                                 size=3,alpha=0.7,color="green")
#글자 찍어주세요
kor.map + geom_text(data=loc, aes(x=LON, y= LAT +0.001, label=name)
                    ,size=3)
#글씨크기

#저장!
ggsave("c:\\r_remp/kd.png",dpi=500)


#실습2
#서울지하철2호선위경도정보.csv

loc <- read.csv("서울지하철2호선위경도정보.csv", header=T)
loc
#header csv중에 첫번째 글은 열머리 글 처리 해라


#지도의 중심 가져와주세요
kd <- get_map("yongsan-gu",zoom=11,maptype = "roadmap")
#점 찍어주세요
#(암사동 중심 빈지도 만들기 ggmap(kd))

kor.map <- ggmap(kd) +geom_point(data=loc, aes(x=LON,y=LAT),
                                 size=3,alpha=0.7,color="black")
#글자 찍어주세요
kor.map + geom_text(data=loc, aes(x=LON, y= LAT +0.001, label=역명)
                    ,size=3)
#글씨크기

#저장!
ggsave("c:\\r_remp/kd.png",dpi=500)




#서울시장난감도서관위치현황.csv
loc <- read.csv("서울시장난감도서관위치현황.csv", header=T)
loc
head(loc)
kd <- get_map("yongsan-gu",zoom=11,maptype = "roadmap")
#점 찍어주세요
#(암사동 중심 빈지도 만들기 ggmap(kd))

kor.map <- ggmap(kd) +geom_point(data=loc, aes(x=LON,y=LAT),
                                 size=3,alpha=0.7,color="black")
#글자 찍어주세요
kor.map + geom_text(data=loc, aes(x=LON, y= LAT +0.001, label=이름)
                    ,size=3)
#글씨크기

#저장!
ggsave("c:\\r_remp/kd.png",dpi=500)


#실습4
loc1 <- read.csv("서울시장난감도서관위치현황.csv", header=T)
loc2 <- read.csv("지역별장애인도서관정보.csv",header=T)
head(loc1)
#header csv중에 첫번째 글은 열머리 글 처리 해라


#지도의 중심 가져와주세요
kd <- get_map("yongsan-gu",zoom=11,maptype = "roadmap")
#점 찍어주세요
#(암사동 중심 빈지도 만들기 ggmap(kd))

kor.map <- ggmap(kd) +geom_point(data=loc1, aes(x=LON,y=LAT),
                                 size=3,alpha=0.7,color="green")+
  geom_point(data=loc2, aes(x=LON,y=LAT),size=3,alpha=0.7,color="red")
#글자 찍어주세요
kor.map + geom_text(data=loc1, aes(x=LON, y= LAT +0.001, label=기관명)
                    ,size=3) +
  geom_text(data=loc2, aes(x=LON, y= LAT +0.001, label=자치구명) ,size=3)
#글씨크기

#저장!
ggsave("c:\\r_remp/kd.png",dpi=500)







#실습5

#서울지하철2호선위경도정보.csv

loc1 <- read.csv("서울지하철2호선위경도정보.csv", header=T)
loc2 <- read.csv("서울지하철3호선역위경도정보.csv", header=T)
loc1
head(loc2)
#header csv중에 첫번째 글은 열머리 글 처리 해라


#지도의 중심 가져와주세요
kd <- get_map("yongsan-gu",zoom=11,maptype = "roadmap")
#점 찍어주세요
#(암사동 중심 빈지도 만들기 ggmap(kd))

kor.map <- ggmap(kd) +geom_point(data=loc1, aes(x=LON,y=LAT),
                                 size=3,alpha=0.7,color="green")+
          geom_point(data=loc2, aes(x=LON,y=LAT),size=3,alpha=0.7,color="red")
#글자 찍어주세요
kor.map + geom_text(data=loc1, aes(x=LON, y= LAT +0.001, label=역명)
                    ,size=3) +
  geom_text(data=loc2, aes(x=LON, y= LAT +0.001, label=역명) ,size=3)
#글씨크기                                 선 타입 2는 점선

#저장!
ggsave("c:\\r_remp/kd.png",dpi=500)





4-5555
#경로 선으로 연결하기
jeju <- read.csv("제주도여행코스_1일차.csv",header=T)
jeju
jeju1 <- get_map("Hallasan",zoom=10,maptype="hybrid")
jeju.map<- ggmap(jeju1)+geom_point(data=jeju,
                                   aes(x=LON,y=LAT),size=3,alpha=0.7,col="red")
#geom_path 함수 사용
jeju.map + geom_path(data=jeju,aes(x=LON,y=LAT),size=1,linetype=2,col="blue")+
  geom_text(data = jeju, aes(x=LON, y=LAT+0.01, label=장소),size=3)
ggsave("jeju_1.png",dpi=700)



#4-6 3호선 연결
loc <- read.csv("서울지하철3호선역위경도정보.csv", header=T)
loc
#header csv중에 첫번째 글은 열머리 글 처리 해라


#지도의 중심 가져와주세요
kd <- get_map("yongsan-gu",zoom=11,maptype = "roadmap")

kor.map <- ggmap(kd) +geom_point(data=loc, aes(x=LON,y=LAT),
                                 size=3,alpha=0.7,color="red")
#글자 찍어주세요
kor.map + geom_path(data=loc,aes(x=LON,y=LAT),size=1,linetype=2,col="green")+
  geom_text(data=loc, aes(x=LON, y= LAT +0.001, label=역명)
                    ,size=3)
#글씨크기

#저장!
ggsave("c:\\r_remp/kd.png",dpi=500)


#보고서
soc <- read.csv("서울관광지.csv", header=T)
soc
head(soc)
kd <- get_map("ankuk-dong",zoom=15,maptype = "roadmap")

kor.map <- ggmap(kd) +geom_point(data=soc, aes(x=LON,y=LAT),
                                 size=3,alpha=0.7,color="red")
#글자 찍어주세요
kor.map + geom_path(data=soc,aes(x=LON,y=LAT),size=1,linetype=2,col="green") +
  geom_text(data=soc, aes(x=LON, y= LAT +0.001, label=관광지)
                    ,size=3)

#보고서
boc <- read.csv("부산관광지.csv", header=T)
boc
head(boc)
kd <- get_map("busan",zoom=11,maptype = "roadmap")

kor.map <- ggmap(kd) +geom_point(data=soc, aes(x=LON,y=LAT),
                                 size=5,alpha=0.7,color="red")
#글자 찍어주세요
kor.map + geom_path(data=soc,aes(x=LON,y=LAT),size=1,linetype=2,col="green") +
  geom_text(data=soc, aes(x=LON, y= LAT +0.001, label=관광지)
            ,size=5)

