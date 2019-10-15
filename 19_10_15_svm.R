# SVM
# 주로 분류

# 신경망이 SVM을 따라가고 있음?

install.packages("e1071")
library("e1071")

iris %>% head()
?svm
model.svm <- svm(Species ~ ., data=iris)

model.svm %>% summary()


pred <- predict(model.svm, iris)


x <- pred
y <- iris$Species
table(x,y)


# svm에 cost및 gamma 값에 따라 많이 달라지기도 함.

#요거 돌리면 gamma, cost 최적의 값이 나옴 
model.svm.tune <- tune.svm(Species ~ ., data=iris, gamma=2^(-1:1), cost=2^(2:4))


model.svm <- svm(Species ~ ., data=iris, gamma=0.5, cost=4)
pred <- predict(model.svm, iris)


x <- pred
y <- iris$Species
table(x,y)




model.svm.tune %>% plot()



