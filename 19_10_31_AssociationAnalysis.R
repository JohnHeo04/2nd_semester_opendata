install.packages("arules")
library("arules")
install.packages("arulesViz")
library("arulesViz")


dvd <- read.csv("C:/dvdtrans.csv", stringsAsFactors=F)
dim(dvd); head(dvd)


### 자료 변환
dvd.list <- split(dvd$Item, dvd$ID)
dvd.trans <- as(dvd.list, "transactions")
summary(dvd.trans)
image(dvd.trans)

### 최소 지지도에 의한 가지치기 알고리즘
dvd.rules <- apriori(dvd.trans, para=list(support=0.2, confidence=0.6))



### 연관성 분석 시각화
library("arulesViz")
plot(dvd.rules, method="graph", int=T)
class(arulesViz)








