# Logistic regression

# 장점: 원인과 결과를 규명할 수 있다.
# 종속변수가 두 가지 결과만 가지는 경우의 회귀분석

install.packages("dplyr")
library("dplyr")

data(iris)
iris %>% summary()

iris.use <- iris %>% filter(Species %in% c("versicolor", "virginica"))

iris.use %>% summary()

plot.col <- iris.use$Species %>% as.integer()
plot(iris.use, col=plot.col)

model <- glm(Species ~ ., data=iris.use, family="binomial")

model %>% summary()

# 

pred <- predict(model, iris.use, type="response")
pred.val <- ifelse(pred>0.5, 1, 0)

# 교차표를 통해 얼마나 잘 됐는지 확인한다.

x <- pred.val
y <- iris.use$Species
table(x,y)
  
  
# 변수선택 - 모수 절약의 원칙(priciple of parisomy)
model.step <- step(model)
model.step %>% summary()
  
  
  
  
x <- pred.step.val
y <- iris.use$Species
table(x,y)
  
  
  
































