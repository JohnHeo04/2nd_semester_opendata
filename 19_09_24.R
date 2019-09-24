rm(list=ls())

install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")

library("dplyr")
library("data.table")
library("ggplot2")



?left_join

band_members
band_instruments

cbind(band_members, band_instruments)


# dplyr에 있는 함수가 기본 merge보다 더 빠름
# "Mutating" joins combine variables from the LHS and RHS
bnad members %>% inner_join(band_instruments)
band_members %>% left_join(band_instruments)
band_members %>% right_join(bnd_instruments)
band_members %>% full_join(band_instruments)

# It's exactly espression
band_members %>% left_join(band_instruments, by="name")


# 살짝의 잔머리
choose.dir()
wd <- "C:\\Users\\PC39042\\Downloads"
setwd(wd)

choose.files()


data.file.air <- "C:\\Users\\PC39042\\Downloads\\대기정보_20190924.txt"
data.air <- fread(data.file.air, encoding="UTF-8")
data.air %>% dim()
data.air %>% head()

choose.files()
data.file.tmp <-"C:\\Users\\PC39042\\Downloads\\기온정보_20190924.txt"
data.tmp <- fread(data.file.tmp, encoding="UTF-8")
data.tmp %>% dim()
data.tmp %>% head()


data.air.tmp <- data.air %>% left_join(data.tmp, by=c("date","hour"))


x <- data.air.tmp$hour
y <- data.air.tmp$PM_10
plot(x, y, type="o")

ggplot(data.air.tmp, aes(x=hour, y=PM_10, color=기온)) + 
  geom_line(size=10, lineend="square") + 
  geom_point(size=5) + 
  scale_color_gradientn(colours=rainbow(10))


# 브라우저에서 그래프 출력하기
install.packages("plotly")

library(plotly)

ggp.line <-ggplot(data.air.tmp, aes(x=hour, y=PM_10, color=기온)) + 
  geom_line(size=10, lineend="square") + 
  geom_point(size=5) + 
  scale_color_gradientn(colours=rainbow(10))

ggp.line

ggplotly(ggp.line)



# 코드가 정어려울때 불러서 쓰는 패키지
install.packages("Rcmdr")


library(Rcmdr)







































































