# K-means
library("dplyr")

iris %>%  head()
newiris <- iris %>%  select(-Species)


newiris %>%  head()

kc <- kmeans(newiris, 3)

pred <- kc$cluster
target <- iris$Species

table(target, pred)

# 3번째 변수와 4번째 변수에 대해 그림을 그림
plot.col <- target %>%  as.integer()
plot(newiris[3:4], pch=pred, col=plot.col)


# 군집수 결정
install.packages("NbClust")
library("NbClust")

nc <- NbClust(newiris, min.nc=2, max.nc=10, method="kmeans")
