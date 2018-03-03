#지도 사용하기 (ggmap, ggiraphExtra)
install.packages("ggiraphExtra")
library(ggiraphExtra)
library(ggplot2)
library()

#class 전체 틀 확인
#str 안 쪽에 들어있는 요소 타입 값

#미국 범죄율 데이터-1) 준비하기
str(USArrests)
head(USArrests)

#행 제목으로 들어간 것을 실제 데이터로 사용할 경우에 사용한다.
library(tibble)

crime <- rownames_to_column(USArrests, var= "state")
# 행 이름을 state 변수로 바꿔 데이터 프레임 생성
crime$state <- tolower(crime$state)
# 지도 데이터와 동일하게 맞추기 위해 state 값을 소문자로 수정
# 주별 범죄현황과 주별 위경도 데이터 포맷을 맞춰 줘야 한다.

str(crime)


#미국 주 지도 데이터-2) 준비하기
library(ggplot2) #ggplot의 데이터를 이용하기 위함
states_map <- map_data("state")
str(states_map)


#단계 구분도 만들기
ggChoropleth(data = crime,
             aes(fill=Murder,map_id=state),
             map=states_map)

            #지도에 표현할 데이터 -1,
            #색깔로 표현할 변수 지정(state(-1데이터에만 듦), fill이란 색깔로 표현할 변수)
            #지도데이터 -2 (long, lat, region이 반드시 들어있어야 한다.)
str(crime)
str(states_map)


#색깔 interactive로 변경하기
ggChoropleth(data = crime,
             aes(fill=Murder,map_id=state),
             map=states_map,
             interactive=T)



#대한민국 시도별 인구 단계 구분도 만들기- kormaps2014패키지

install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)
#내장 데이터 korpop1 이용

str(changeCode(korpop1))  #인코딩 UTF-8을 CP949로 변경한 후 깨지지 않도록 구조 읽기

library(dplyr) #한글로 된 변수명을 오류나지 않게 영문자로 바꾸기
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name= 행정구역별_읍면동)

#대한민국 시도 지도 데이터 준비하기 -kormap1(2014년 시도별 행정지도)
#kormap2 시군구별, kormap3(읍면동별)

str(changeCode(kormap1))
head(kormap1)


#단계 구분도 만들기 
#korpop1의 시도별 인구 변수, kormpa2의 시도별 위경도 데이터 #분류기준은 code(지역)

ggChoropleth(data=korpop1,
             aes(fill=pop,
                 map_id=code,
                 tooltip=name),
             map=kormap1)
# 지도에 표현할 데이터, 색깔로 표현할 변수, 
#지역 기준 변수, tooltip 지도 위에 표시할 지역명
#지도 데이터 ( 인터렉티브)

#인터렉티브 옵션(웹 문서)
ggChoropleth(data=korpop1,
             aes(fill=pop,
                 map_id=code,
                 tooltip=name),
             map=kormap1,
             interactive=T)



#대한민국 시도별 결핵 환자 수 단계 구분도 만들기 - 내장 tbc 데이터
#NewPts(결핵환자 수 변수)
str(changeCode(tbc))
ggChoropleth(data=tbc,
             aes(fill=NewPts,
                 map_id=code,
                 tooltip=name),
             map=kormap1,
             interactive=T)
