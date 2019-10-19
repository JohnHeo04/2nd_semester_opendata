install.packages("dplyr")
#install.packages("data.table")
install.packages("ggplot2")
install.packages("agricolae")
install.packages("car")

#system("defaults write org.R-project.R force.LANG en_US.UTF-8")

library(dplyr)
#library(data.table)
library(car)

mtcars
# t-test하기전에 등분산 먼저 해보기
# 두개의 집단이 분산이 같은지
# 
data.chickwts <- chickwts




######## 1.(1)
boxplot(weight~feed, data=chickwts)

####### 1.(2) 
# "casein"과 "sunflower" 두 종류의 사료에 대하여 
# 닭의 무게가 차이가 있는지 검정하려고 한다. 두 종류의 
# 사료와 무게 자료를 추출하여 data.1 변수에 저장하시오.


data.casein <- data.chickwts %>% filter(feed == "casein")
data.sunflower <- data.chickwts %>% filter(feed == "sunflower")

data1 <- rbind(data.casein,data.sunflower)   # rbind는 밑으로 데이터를 붙인다.



# c는 옆에 row로 붙인다. 그래서 작동안함.
#data1 <- c(data.casein, data.sunflower)


######## 1.(3)

# 두 종류의 사료에 대한 닭 무게의 분산이 동일하다고 볼 수 있는가? 
# 가설을 제시하고, 검정하시오

# 가설
# 귀무가설 : Casein과 sunflower에 대한 닭 무게의 분산은 같다.
# 대립가설 : Casein과 sunflower에 대한 닭 무게의 분산은 다르다.

#data5 <- subset(chickwts, select=c(data.casein, data.sunflower))

# 요놈이 찐이다. (3)
leveneTest(data1$weight, as.factor(data1$feed))


# as.numeric(unlist(data1)
# leveneTest(data1)



#as.numeric(unlist(data3))

#as.numeric(unlist(data4))
#as.numeric(data4)

#leveneTest(data3)
#as.numeric(data4)




######## 1.(4) 
# 두 종류의 사료에 대한 닭 무게의 평균이 동일하다고 볼 수 있는가? 가설을 제시하고, 검정하시오
t.test(data1$weight~data1$feed)
#t.test(data1$weight)
# 귀무가설을 채택한다.



########## 2.(1)
### 귀무가설과 대립가설을 설정하시오.

# 귀무가설: 세 집단간의 분산은 차이가 없다.
# 대립가설: 적어도 하나 이상의 집단간에 차이가 있다.

########## 2.(2) 분산분석을 이용하여 아래의 분산분석표를 작성하시오.

A <- c(36,41,42,49)
B <- c(40,48,39,45,44)
C <- c(35,37,42,34,32)

data8<-c(A,B,C)

class <- c('A','A','A','A','B','B','B','B','B','C','C','C','C','C')

fit<-aov(data8~class)
summary(fit)

####### 2.(3)
# p-value=0.05보다 작게 나왔으므로 귀무가설 기각하고 대립가설 채택한다.
# 적어도 하나 이상의 집단간에 차이가 있다.

####### 2.(4)
TukeyHSD(fit)
# 세 집단 간의 차이가 없다.

library(agricolae)
#duncan.test(,console=TRUE) 
duncan.test(fit,"class",alpha = 0.05, console = TRUE)



####### 3.(1)

# 귀무가설 : 6개 사료에 대한 닭의 무게는 같다.
# 대립가설 : 적어도 1개 사료에 대한 닭의 무게는 다르다.

####### 3.(2)

aov(weight~feed, data=chickwts) %>% summary()


####### 3.(3)
out <- aov(weight~feed, data=chickwts)
duncan.test(out,"feed",alpha = 0.05, console = TRUE)

#답 Sunflower와 Casein평균이 같고, meatmeal과 soybean이 같고, soybean과 linseed가 같다. horsebean은 혼자다.


####### 4.(1).
#각각에 대한 산점도를 해야함.
# 두번째 변수가 코스트
# 

nuclear = read.csv('C:/Users/sky49/Documents/카카오톡 받은 파일/nuclear.csv')
nuclear

pairs(nuclear)


####### 4.(2)
nuclear.use <- nuclear[,c('cost','t1','t2','cap','pr','ne','ct','bw','cum.n','pt')]


####### 4.(3)

lm(cost ~ ., data=nuclear.use) %>% summary()


####### 4.(4)
# AIC=???2logL+2K
out <- lm(cost ~ ., data=nuclear.use)

model.step <- step(out)
model.step %>% summary()

# cost ~ t1 + t2 + cap + pr + ne + pt


####### 4.(5)
#
par(mfrow=c(2,2))
plot(out)


