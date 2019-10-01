library("MASS")
install.packages("dplyr")
library("dplyr")
install.packages("data.table")
library("data.table")
install.packages("ggplot2")
library("ggplot2")
install.packages("plotly")
library("plotly")

data(survey)
survey %>% dim()
survey %>% head()
survey %>% summary()

data.use <- survey %>% select(Sex,Exer)
data.use %>% dim()
data.use %>% head()

tb <- table(data.use$Sex, data.use$Exer)
barplot(tb, beside=T)

# 남여간 운동량 차이가 있는지 검토해보자
# 검정을 시작한다.
# 카이제곱 = chisq.test()
chisq.test(tb)

# 실제로 여자와 남자의 운동 차이가 없다.



# Sex와 Survived 생존률 차이가 있나 없나

data.file <- "C:\\Users\\PC39042\\train.csv"
data.raw <- fread(data.file)

# dim은 데이터 양, 피쳐 개수 
data.raw %>% dim()
# head는 전체 데이터의 앞 부분만 가져온다.
data.raw %>% head()
# summary는 각 피쳐 값 요약 
data.raw %>% summary()


ti <- table(data.raw$Sex, data.raw$Survived)
barplot(ti, beside=T)


# 교수님 코드

lab <- c("no", "yes")

idx <- c(1,2,1,2)
lab[idx]

# 0,1을 yes, no로 바꿀 수 있음.
ids <- data.raw$Survived + 1
factor(lab[ids])

x <- 5:10
x[3]
x[c(3,5)]

tb.x <- data.raw$Survived
tb.y <- data.raw$Sex
tb <- table(tb.y, tb.x)

barplot(tb, beside=T)

ggp.bar <- ggplot(data.raw, aes(x=Survived, fill=Sex)) + geom_bar(position="dodge")
ggp.bar
plotly(ggp.bar)


# Survived 와 Pclass 비교해본다.

sp.x <- data.raw$Survived
sp.y <- data.raw$Pclass
sp <- table(sp.x, sp.y)

barplot(sp, beside=T)

ggp.bar <- ggplot(data.raw, aes(x=Survived, fill=Pclass)) + geom_bar(position="dodge")
ggp.bar
ggplotly(ggp.bar)

chisq.test(sp)

# p-value가 유의수준 0.05보다 작으므로 대립가설을 채택


# 정규분포를 따르면 t-검정(t-test)을 시행하면 됨.
# 아니라면 t-test쓰면 안 됨.
# 지금의 t-test는 정규성을 띈다는 가정하에 이루어 지고 있다.


# 비모수 방법은 정규분포를 따르지 않아도 된다. 
wilcoxon 

윌코슨? 검정??
  


data(mtcars)
mtcars %>% dim()
mtcars %>% head()
mtcars %>% summary()

# mpg는 연비임
# am:1=수동, 2=자동
am.mpg <- mtcars %>% filter(am==1) %>% select(mpg)

t.test(am.mpg, mu=20)
# t = 2.5682 는 t값 
# 마지막에 mean of x 는 24.39xxx 
# 그렇기 때문에 20보다 크다고 볼 수 있다. 

# 만약 평균이 20보다 작게 나오면 연비가 20보다 작다고 볼 수 있다.

t.test(am.mpg, mu=24) # p-value = 0.8224 굉장히 높음 
# SOooooooooo Interesting!!!!!!!!!!!!
# hahahahahahaha



























