install.packages("rvest")
install.packages("dplyr")

library("rvest")
library("dplyr")

url <- "https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid2=250&sid1=102&date=&page="

page.num <- 1:20
url.page <- paste(url, page.num, sep="")
url.page


idx.page <- 1

# for문으로 전체 수행
for(idx.page in page.num){

url.html <- url.page[idx.page] %>%  read_html()

url.a <- url.html %>%
      html_nodes("div.list_body.newsflash_body") %>% 
      html_nodes("dt") %>%  
      html_nodes("a") %>%  
      html_attr("href") %>% 
      unique()

i <- 1
# 뉴스가 다 20개로 정해진건 아님 유동적으로 만들어 주기위해
# 아래의 for문을 만들어줌
for(i in 1:length(url.a)){

url.a.html <- url.a[i] %>%  read_html()

# 기사 제목 데이터 출력
news.title <- url.a[i] %>%  
      read_html() %>% 
      html_nodes("#articleTitle") %>% 
      html_text()

# 날짜 데이터 출력
news.datatime <- url.a.html %>%  
      html_nodes("span.t11") %>% 
      html_text()


# 정규표현식으로 필요없는 문장제
news.body <- url.a.html %>% 
        html_nodes("#articleBodyContents") %>% 
        html_text()


news.body <- sub("^.*(\\{\\}\n)[:space:]*", "", news.body) 
news.body <- gsub("(\r|\n|\t)+", "", news.body)

new.data <- cbind(news.title, news.datatime[1], news.body)

write.table(new.data, "네이버뉴스_사회_교육.txt", sep="\t", append=T, row.names=F, col.names=F)
}
}



?write.table















