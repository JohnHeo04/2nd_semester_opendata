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
























































































































