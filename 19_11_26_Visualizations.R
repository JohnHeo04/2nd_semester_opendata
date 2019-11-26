install.packages("ggmap")
install.packages("dplyr")
install.packages("plotly")


library(ggmap)
library(dplyr)
library(plotly)


boxLocation <- c(127.25305, 36.23972, 127.51639, 36.47306)

krMap <- get_map(location=boxLocation, source="stamen",)



##### Violin plot
ggp <- ggplot(mpg, aes(class, cty)) + geom_violin(fill="plum")
        geom_line(aes(y=psavert, col="psavert"))+
        geom_line(aes(y=uempmed, col="uempmed"))

ggp

ggp %>%  ggplotly()

plot_ly(data=iris, x=~Sepal.Length, y=-pretal.Lengher)

htmlwidge





pal <- ("red", "blue","green")
plot_ly(data=iris, x= ~ Sepal,length, y=~Pot)


### Styled Scatter Plot
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,
        maker = list(
          size = 10, 
          color = 'rgba(255, 182, 193, .9)'
          line = list(color = 'rgba(152,0,0,.8)',
                      width = 2)
        ))

plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,
        marker = list(
          size = 10,
          color = 'rgba(255, 182, 193, .9)',
          line = list(color = 'rgba(152, 0, 0, .8)',
                      width = 2)))

plot_ly(mtcars, x = ~disp, y = ~hp, text = rownames(mtcars), type = 'scatter', mode =
          'markers', marker = list(size = ~cyl*5, opacity = 0.5))



plot_ly(mpg, y = ~cty, color = ~manufacturer, type = "box")















