##
## data1 get RSS URL for youtube channels
## data2 get RSS feeds
## data3 tweet and googlesheets update
##

library(tidyverse)
library(googlesheets4)
library(twitteR)

d <- read_csv("./data/feed.csv")
d_old <- read_sheet(ss = "https://docs.google.com/spreadsheets/d/1JexzY17No_DgfXtDU5GEqYAKR7hbmSUcmZQwm86yCZ8/", sheet = "d")

d_new <- d %>%
  filter(!entry_url %in% d_old$entry_url)

api_key <- 
api_secret<- 
access_token <- 
access_token_secret <- 

setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

twitteR::use_oauth_token()
twitteR::
rtweet::post_tweet(status = "This test tweet. #testtweet")

tw = twitteR::searchTwitter('#realDonaldTrump + #HillaryClinton', n = 1e4, since = '2016-11-08', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)



# Create a token containing your Twitter keys
create_token(
  app = "demography-talks-tweets",  # the name of the Twitter app
  consumer_key = Sys.getenv("kqstaCjkdzgsgrVwDKQY6ORph"),
  consumer_secret = Sys.getenv("8GIHN3AbUuIZst5BDyQEai6gRdy8ybygR8AIAX5t5PS8fJNzMO"),
  access_token = Sys.getenv("1395271160795860992-wRo8l3VIBXK1O5Rj7mzml6IzOwpQSA"),
  access_secret = Sys.getenv("bKNkm7obqUjMO4zpaiRPKSJ5hqBlbjU7zfsnnLLdl99cb")
)


api_key <- Sys.getenv("kqstaCjkdzgsgrVwDKQY6ORph")
api_secret <- Sys.getenv("8GIHN3AbUuIZst5BDyQEai6gRdy8ybygR8AIAX5t5PS8fJNzMO")
access_token <- Sys.getenv("1395271160795860992-wRo8l3VIBXK1O5Rj7mzml6IzOwpQSA")
access_token_secret <- Sys.getenv("bKNkm7obqUjMO4zpaiRPKSJ5hqBlbjU7zfsnnLLdl99cb")
options(httr_oauth_cache = TRUE)

setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

options(httr_oauth_cache = TRUE)
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

get_oauth_sig() 
twitteR::lookupUsers("guyabelguyabel")
rtweet::post_tweet(status = "This a test tweet. #testtweet")
get_followers('arjbarker', n = 10) 

kqstaCjkdzgsgrVwDKQY6ORph
api_key <- Sys.getenv("twitter_api_key")
api_secret <- Sys.getenv("twitter_api_secret")
access_token <- Sys.getenv("twitter_access_token")
access_token_secret <- Sys.getenv("twitter_access_token_secret")
options(httr_oauth_cache = TRUE)
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

# d <- d %>%
#   slice(-(1:2))
write_sheet(data = d, ss = "https://docs.google.com/spreadsheets/d/1JexzY17No_DgfXtDU5GEqYAKR7hbmSUcmZQwm86yCZ8/", sheet = "d")
