##
## data1 get RSS URL for youtube channels
## data2 get RSS feeds
## data3 tweet and googlesheets update
##

library(tidyverse)
library(tidyRSS)

y0 <- read_csv("./data/channels.csv")

y1 <- y0 %>%
  mutate(f = map(.x = url_feed, .f = ~tidyfeed(feed = .x)))

y2 <- y1 %>%
  select(url_feed, f) %>%
  unnest(f) %>%
  arrange(desc(entry_published))

y2 %>%
  select(entry_published, entry_url, entry_title, feed_title) %>%
  write_csv("./data/feed.csv")

# u = "https://vimeo.com/berkeleypopscience"
# u = "https://vimeo.com/berkeleypopscience/videos/sort:date/format:detail"
# 
# user = "berkeleypopscience"
# h <- read_html(x = u)
# vimeo_videos <- function(u, user) 
#   h <- read_html(x = u)
# h %>%
#   html_nodes("#browser li") %>%
#   .[1:12] %>%
#   html_nodes("a") %>%
#   html_attr("href") %>%
#   unique() %>%
#   str_subset(user, negate = TRUE)
# }
# 
# vimeo_video_details <- function(v) 
#   v = "https://vimeo.com/338128863"
# h <- read_html(x = v)
# h %>%
#   html_nodes("#browser li") %>%
#   .[1:12] %>%
#   html_nodes("a") %>%
#   html_attr("href") %>%
#   unique() %>%
#   str_subset(user, negate = TRUE)
# }
# 
# v %>%
#   html_nodes("#clearfix")
# xml_text() %>%
#   str_count("338086712")
# str_detect("video") 
# html_nodes("vp-video")
# 
