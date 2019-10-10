install.packages("DAAG")
install.packages("car")
install.packages("dplyr")

library(DAAG)
library(car)
library(dplyr)

dim(allbacks);head(allbacks)
### 행렬 산점도 
plot(allbacks)
### linear model


# 단순선형회귀분석
allbacks.lm <- lm(weight~volume, data=allbacks)
allbacks.lm

# Intercept는 보통 해석하지 않음
allbacks.lm %>% summary

x <- allbacks$volume
y <- allbacks$weight
plot(x,y)
abline(allbacks.lm, col="red")

allbacks.lm <- lm(weight~volume+area, data=allbacks)
allbacks.lm %>% summary

# <회귀진단>
# 모형이 제대로 됐는지 진단 해야함. = 회귀진단
# 논문에서 검정은 필수로 해야함.

par(mfrow=c(2,2))
plot(allbacks.lm)














