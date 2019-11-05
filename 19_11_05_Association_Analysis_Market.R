install.packages("dplyr")
library("dplyr")
install.packages("NbClust")
library("NbClust")

install.packages("arules")
library("arules")
install.packages("arulesViz")
library("arulesViz")




product.raw <- read.csv("C:/Users/order_products_aisles_group_re.csv")
product.raw %>% dim()
product.raw %>%  summary()


# Split에 들어가야하는건 첫번째 제품, 두번째 아이디를 넣으면 
# 분석에 넣을 수 있는 형태로 만들어짐
# split은 데이터를 연관성분석에 알맞은 형태로 변환하기 위해

# Ex)
# 1   A B C
# 2   B D
# 3   A D C
# 해석 : 1번 아이디를 가진 고객이 제품 A,B,C를 삼.

product.list <- split(product.raw$aisle,product.raw$order_id)
product.trans <- as(product.list, "transactions")

summary(product.trans)
image(product.trans)


product.rules <- apriori(product.trans, para=list(support=0.2, confidence=0.6))
plot(product.rules, method="graph", int=T)


class(arulesViz)


### support=0.1, confidence=0.8


product.rules_2 <- apriori(product.trans, para=list(support=0.1, confidence=0.8))
plot(product.rules_2, method="graph", int=T)












