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







