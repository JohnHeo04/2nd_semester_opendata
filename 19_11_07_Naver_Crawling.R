# 네이버 뉴스 크롤링

install.packages("rvest")
install.packages("dplyr")

library("rvest")
library(dplyr)


url <- "https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid2=250&sid1=102&date=20191107&page="

page.num <- 1:10
url.page <- paste(url, page.num, sep="")
url.page

idx.page <- 1


url.html <- url.page[idx.page] %>%  read_html()
url.html %>%  str()


# html_nodes()은 tag, class(.), id(#)를 검색
url.html %>%  
  html_nodes("div.list_body.newsflash_body") %>% 
  html_nodes("dt") %>% 
  html_nodes("a") %>% 
  html_attr("href") %>%  unique()


















