install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")

library(dplyr)
library(data.table)
library(ggplot2)

# t-test하기전에 등분산 먼저 해보기
# 두개의 집단이 분산이 같은지
# 
data.chickwts <- chickwts




1.
boxplot(weight~feed, data=chickwts)

2.(2) "casein"과 "sunflower" 두 종류의 사료에 대하여 
닭의 무게가 차이가 있는지 검정하려고 한다. 두 종류의 
사료와 무게 자료를 추출하여 data.1 변수에 저장하시오.

data.casein <- data.chickwts %>% filter(feed == "casein")

data.casein <- chickwts %>% select(casein, sunflower)

  


# 3.사후



# 4.각각에 대한 산점도를 해야함.
# 두번째 변수가 코스트
# 












