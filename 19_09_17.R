install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")

library("dplyr")
library("data.table")
library("ggplot2")



###### Set working directory
wd <- "C:/Users/PC39042/Downloads"
setwd(wd)

getwd()
list.files()


##### read data
data.file <- "ramen-ratings.csv"
data.raw <- fread(data.file, encoding="UTF-8")


class(data.raw)
data.raw %>% class()

dim(data.raw)
data.raw %>% dim()

data.raw %>% head()
data.raw

##### summary
summary(data.raw)

##### Country
### table
tb.data <- data.raw[,Country]
tb <- table(tb.data)
tb
tb.sort <-sort(tb, T)

# Sort는 기본적(default)으로 오름차순 정렬
tb.sort

# Sort 내림 차순 정리하는 법
tb.sort <- sort(tb, T)
tb.sort

### barplot
barplot(tb.sort)

### barplot - ggplot
tb.sort.dt <- as.data.frame(sort(tb))
names(tb.sort.dt) <- c("Country", "Freq")
tb.sort.dt %>% head()

ggplot(data= tb.sort.dt, aes(x=Country, y=Freq, fill=Country)) + geom_bar(stat="identity") +
  coord_flip()


ggplot(data=data.raw, aes(x=Country, fill=Country)) + geom_bar() + coord_flip()


summary(data.raw)


##### Stars
### table
tb.data <- data.raw[,Stars]
tb.data %>% table()

### filter
data.use <- data.raw %>% filter(Stars!="Unrated")
data.use %>% dim()
data.use %>% class()


# $이란, data의 Stars변수를 싹 다 가져온다.
data.use$Stars <- data.use$Stars %>% as.numeric()
data.use %>% head()


### boxplot
plot.value <- data.use$Stars
summary(plot.value)
boxplot(plot.value)
hist(plot.value)

### boxplot - ggplot
ggplot(data=data.use, aes(y=Stars)) + geom_boxplot

### Country - Top 3 
in.country <- c("Japan", "USA", "South Korea")
data.Country <- data.use %>% filter(Country %in% in.country) %>% select(Country, Stars)
data.Country %>% dim()
data.Country %>% head()

### boxplot
boxplot(Stars~Country, data=data.Country) 


### boxplot - ggplot
ggplot(data=data.Country, aes(x=Country, y=Stars, fill=Country)) + geom_boxplot()

install.packages("car")
library(car)
leveneTest(Stars~Country, data=data.Country)

fit <- aov(Stars~Country, data=data.Country)
summary(fit)
TurkeyHSD(fit)



# HyperOperator?











































