install.packages("dplyr")
library("dplyr")
install.packages("NbClust")
library("NbClust")


cus <- read.csv("C:/Users/Customer2001.csv")



cus %>% head()


cus.spe <- cus %>% filter(cus$Peak_calls_Sum, cus$OffPeak_calls_Sum, cus$Weekend_calls_Sum, cus$AvePeak, cus$AveOffPeak, cus$AveWeekend)

cus.spe <- cus %>% select("Peak_calls_Sum", "OffPeak_calls_Sum", "Weekend_calls_Sum", "AvePeak", "AveOffPeak", "AveWeekend")


pred <- kc$cluster
target <- cus

### 최종 분류된 kmeans를 바탕으로 집단을 나누고 어떤 상품을 최종적으로 추천해줄지 결과물 도출하기
### 까지가 기말보고서

nc <- NbClust(cus.spe, min.nc = 2, max.nc = 10, method = "kmeans")

kc2 <- kmeans(cus.spe,2)

kc3 <- kmeans(cus.spe,3)

kc$cluster
kc$centers


############ 교수님 코드

data.raw <- read.csv("C:/Users/Customer2001.csv")
data.raw %>% dim()
data.raw %>% head()

library("NbClust")
nc <- NbClust(data.raw, min.nc=2, max.nc=10, method="kmeans")
kc <- kmeans(data.raw, 2)

kc$cluster
kc$centers

kc.3 <- kmeans(data.raw, 3)
kc.3$cluster







