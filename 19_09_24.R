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


data.air %>% left_join(data.tmp, by="hour")

























































































