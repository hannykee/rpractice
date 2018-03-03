#ggplot2

배경 그리고 + 종류 그리고 + 세부사항설정(축,범위,색,표식)
#더하기 기호로 확장이 된다.


#산점도
library(ggplot2)
ggplot(data = mpg, aes(x=displ, y=hwy)) + geom_point() +xlim(3,6)
#배경 위에 표식을 추가한다.                #그래프 종류  #x값 3부터 6

#함수 별로 줄을 바꿔서 가독성을 높이자

ggplot(data=mpg,aes(x=displ,y=hwy)) +
  geom_point() +
  xlim(3,6) +
  ylim(10,30)

qplot() 전처리 단계 데이터 확인용 간단하게
ggplot() 최종보고용 세부 조작 용이


ggplot(data=mpg, aes(x=cty,y=hwy)) + geom_point()
ggplot(data=midwest, aes(x=poptotal,y=popasian)) +
  geom_point() +
  xlim(0,500000) +
  ylim(0,10000)

#10만 단위가 넘는 숫자는 지수 표기법으로 표시되므로 이를 해제하기 위해서는
#정수로 표현하기 options(scipen = 99)
#지수로 표현하기 options(scipen = 0)



#원재료 그대로 할 때는 주로 geom_bar()   -> 빈도수(x값에 의해 y값 자동 결정)
#가공을 거친 요약표를 사용할 때는 geom_col()    -> x축과 y축에 대한 정보 다 줘야함



#막대 그래프 1 - 평균 막대 그래프 만들기 (각 집단의 평균값 막대 길이)
library(dplyr)

df_mpg <- mpg%>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy))
df_mpg

ggplot(data = df_mpg, aes(x=drv,y=mean_hwy)) + geom_col()
#         축 값을 다 그리고 (x,y값 정확하게 지정)-> 이 함수를 사용(막대그래프)

#순서를 바로 결정해서 정렬하기

ggplot(data = df_mpg, aes(x=reorder(drv, -mean_hwy), y=mean_hwy)) + geom_col()
                          #reorder(x기준값 , 정렬의 기준 *-붙으면 내림차순 정렬)

#####geom_bar는 y축의 기준 없이
 #x축만 있어야 사용 가능
ggplot(data=mpg,aes(x=drv)) +geom_bar()
ggplot(data = df_mpg, aes(x=reorder(drv, -mean_hwy))) + geom_bar()

ggplot(data=mpg,aes(x=hwy)) +geom_bar()



#3. 선그리기
head(economics)
ggplot(data=economics, aes(x=date,y=unemploy)) + geom_line()


#4. 상자 그림 - 집단 간 분포 차이 표현하기 (극단치나 이상치를 찾아낼 때)
ggplot(data=mpg,aes(x=drv,y=hwy)) + geom_boxplot()

head(mpg)
#1번
df <-mpg %>%
  filter(class=="suv") %>%
  group_by(manufacturer)%>%
  summarise(mean_cty=mean(cty))%>%
  arrange(desc(mean_cty))%>%
  head(5)
  
#2번
ggplot(data=df, aes(reorder(manufacturer,-mean_cty), y=mean_cty)) + geom_col()


#1번(198쪽)
df1 <- mpg %>%
  filter(class %in% c("compact","subcompact","suv"))
ggplot(data=df1, aes(x=class,y=cty)) + geom_boxplot()

