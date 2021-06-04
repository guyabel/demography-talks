##
## data1 get RSS URL for youtube channels
## data2 get RSS feeds
## data3 tweet and googlesheets update
##

library(tidyverse)
library(rvest)

d <- read_csv("./data-raw/channels.csv")

d0 <- d %>%
  mutate(youtube = str_detect(string = url, pattern = "youtube"),
         vimeo = str_detect(string = url, pattern = "vimeo"),
         playlist = str_detect(string = url, pattern = "playlist"))

get_youtube_rss <- function(u){
  # u = y0$url[12]
  h <- read_html(x = u)
  rss <- NA
  if(!str_detect(string = u, pattern = "playlist")){
    rss <- h %>%
      xml2::xml_text() %>%
      str_extract("rssUrl*(.*?)*\\,") %>%
      str_remove("rssUrl") %>%
      str_sub(start = 4, end = -3)
  }
  return(rss)
}

y0 <- d0 %>%
  filter(youtube) %>%
  rowwise() %>%
  mutate(url_feed = get_youtube_rss(u = url)) %>%
  drop_na(url_feed) 
write_csv(y0, "./data/channels.csv")


