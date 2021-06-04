##
## data1 get RSS URL for youtube channels
## data2 get RSS feeds
## data3 tweet and googlesheets update
##

library(tidyverse)
library(googlesheets4)
library(rtweet)

source("keys.R")

# published (old)
d0 <- read_sheet(ss = "https://docs.google.com/spreadsheets/d/1JexzY17No_DgfXtDU5GEqYAKR7hbmSUcmZQwm86yCZ8/", 
                 sheet = "d")
# complete list (new and old)
d1 <- read_csv("./data/feed.csv")

# just new
d <- d1 %>%
  filter(!entry_url %in% d0$entry_url) %>%
  mutate(yt_url = str_replace(string = entry_url, pattern = "yt:video:",
                              replacement = "https://www.youtube.com/watch?v="),
         tweet = paste0(emojis$code[2036], " ", entry_title, "\n\n", 
                        emojis$code[1739], " ", feed_title,  "\n\n", 
                        # "#poptwitter", 
                        yt_url))

create_token(app = keys$app, 
             consumer_key = keys$consumer_key, 
             consumer_secret = keys$consumer_secret,
             access_token = keys$access_token,
             access_secret = keys$access_secret)
            
if(nrow(d) > 0){
  for(i in 1:nrow(d)){
    post_tweet(status = d$tweet[1])
  }
  # save complete list to google sheets
  write_sheet(data = d1, ss = "https://docs.google.com/spreadsheets/d/1JexzY17No_DgfXtDU5GEqYAKR7hbmSUcmZQwm86yCZ8/", sheet = "d")
}


