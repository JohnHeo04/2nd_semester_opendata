install.packages("ggmap")
install.packages("dplyr")

install.packages("mapview")
install.packages("sp")

library(ggmap)
library(dplyr)

geocode("Korea", source="dsk")

boxLocation <- c(127.33305, 36.28972, 127.46639, 36.42306)

krMap <- get_map(location=boxLocation, source="stamen", maptype = "toner")

?get_map

ggmap(krMap)


location.df <- read.csv(choose.files(), header=T)
location.df %>%  dim()
location.df %>%  head()
location.df %>%  summary()


get_map(location=boxLocation, source="stamen",
        maptype="terrain")
ggmap(krMap) + geom_point(data=location.df, 
                          aes(경도, 위도, colour=구분))


library(mapview)
library(sp)

df.use <- location.df

coordinates(df.use) <- ~경도 + 위도
proj4string(df.use) <- "+init=epsg:4326"


mapview(df.use, zcol="구분", burst=T)








