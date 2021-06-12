##
## data1 get RSS URL for youtube channels
## data2 get RSS feeds
## data3 tweet and googlesheets update
##

library.path <- .libPaths()
# print(library.path)
.libPaths(c("C:/Users/abel/Documents/R/R-4.0.3/library", .libPaths()))
library.path <- .libPaths()
# print(library.path)
wd <- "C:/Users/abel/Documents/GitHub/demography-talks/"

library(tidyverse)
library(googlesheets4)
library(rtweet)

source(paste0(wd, "/keys.R"))

# published (old)
# d0 <- read_sheet(ss = "https://docs.google.com/spreadsheets/d/1JexzY17No_DgfXtDU5GEqYAKR7hbmSUcmZQwm86yCZ8/", 
#                  sheet = "d")
# complete list (new and old)
d0 <- read_csv(paste0(wd, "./data/feed.csv"))
# d0 <- d0 %>% slice(-3)
d1 <- read_csv(paste0(wd, "./data/feed_new.csv"))

# just new
d <- d1 %>%
  filter(!entry_url %in% d0$entry_url) %>%
  mutate(yt_url = str_replace(string = entry_url, pattern = "yt:video:",
                              replacement = "https://www.youtube.com/watch?v="),
         tweet = paste0(emojis$code[2036], " ", entry_title, "\n\n", 
                        emojis$code[1739], " ", feed_title,  "\n\n", 
                        # "#poptwitter", 
                        yt_url))

token <- create_token(app = keys$app, 
             consumer_key = keys$consumer_key, 
             consumer_secret = keys$consumer_secret,
             access_token = keys$access_token,
             access_secret = keys$access_secret)

# print(token)
# print(rtweet::get_timeline(user = "guyabelguyabel"))
# post_tweet("testing")
            
if(nrow(d) > 0){
  for(i in 1:nrow(d)){
    post_tweet(status = d$tweet[1])
  }
  # save complete locally
  write_csv(d1, paste0(wd, "/data/feed.csv"))
  # save complete list to google sheets
  d1 %>%
    mutate(url = str_replace(string = entry_url, pattern = "yt:video:",
                             replacement = "https://www.youtube.com/watch?v=")) %>%
    select(-entry_url) %>%
    arrange(entry_published) %>%
    write_sheet(ss = "https://docs.google.com/spreadsheets/d/1JexzY17No_DgfXtDU5GEqYAKR7hbmSUcmZQwm86yCZ8/", sheet = "d")
}
