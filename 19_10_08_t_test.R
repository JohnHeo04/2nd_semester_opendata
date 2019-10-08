install.packages("dplyr")
library(dplyr)


data(mtcars)

mtcars %>% head()
mtcars %>% dim()


# 연비가 수동이냐 자동이냐에 따라서 어떻게 다를지 관측해보자.
data.use <- mtcars %>% select(mpg, am)

# 1.수동인 집단
# 2.자동인 집단

boxplot(data.use$mpg)

boxplot(mpg~am, data=data.use)

# 등분산 검정

#1.모수적 방법
#   바틀렛 검정
#2.준모수적 방법
#   레벤티스트 검정
#3.비모수적 방법


install.packages("car")
library(car)


x <- data.use$mpg
y <- factor(data.use$am)

# or

x <- data.use$mpg
y <- data.use$am %>% factor()


leveneTest(x,y)

# 두집단의 분산이 다르다하는 정보를 넣어준다.
result.test <- t.test(mpg~am, data=data.use, var.equal=F)

result.test

# 귀무가설 두 집단의 평균이 같다. 대립가설 두 집단의 평균이 다르다.



# 결론

# 자동과 수동의 연비가 다르다.


# 수동의 평균이 더 높음.
# 수동이 자동보다 연비가 더 높다.






# 타이타닉데이터로 t-test해보기
choose.dir()
setwd("C:/Users/PC39041")
getwd()

titanic_train <- read.csv('train.csv')
titanic_train %>% names()



data.use <- na.omit(data.use)
# data.use <- titanic_train %>% select(Survived,Age)

#  Let's compare Survived and Age 

a <- data.use$Survived
b <- data.use$Age

boxplot(b~a, data=data.use)




# 분석 집단이 3개 이상일 때 'ANOVA' - 분산분석 

# 일원산 분산배치 분석


library(car)
data <- read.csv("machine.csv", header=T)
data$fmachine <- factor(data$machine)

###등분산 검정
leveneTest(strength~fmachine, data=data)

### 일원배치 분산분석
fir <- aov(strength~fmachine, data=data)

### 분산분석표
summary(fit)

### 등분산성, 정규성
plot(fit$fitted, fit$resid)
qqnorm(fit$resid)
qqline(fit$resid)


oneway.test(strength~fmachine, var.equal=TRUE, data=data)


choose.files

# 데이터가 없는 관계로 여기서 마감






# 타이타닉데이터 등분산 데이터 검정
choose.dir()
setwd("C:/Users/PC39041")
getwd()

data.raw <- read.csv('train.csv')
data.raw %>% names()

data.use <- data.raw %>% select(Pclass, Age) %>% na.omit()
data.use %>% head()
data.use %>% dim()

x <- data.use$Age
y <- data.use$Pclass %>% factor()
leveneTest(x,y)

# 세 집단의 값이 다르다.

# ANOVA테스트를 진행한다.
fit <- aov(Age~Pclass, data=data.use)
fit
# 값을 자세히 알아보려면 summary()함수를 쓴다.
fit %>% summary()

boxplot(Age~Pclass, data=data.use)


leveneTest(Age~Pclass, data=data.use)
fit <- aov(Age~Pclass, data=data.use)
fit
fit %>% summary()


# 논문등에서 내 주장을 서포트하기 위한 방법 : 사후 검정
# 사후 검정
TukeyHSD(fit)

install.packages("agricolae")
library(agricolae)

# Dunkan 사후검정
duncan.test(fit, "Pclass", console=T)
  #1번
  #2번
  #3번 
# 옆 group a,b,c가 의미하는 바는 다 다르다.


































































