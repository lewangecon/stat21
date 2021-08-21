# Project:  Econ 5023 Statistics for Decision Making
# Author :  Le Wang

# A Naive Sentiment Analysis with Twitter

# install.packages("twitteR")
# install.packages("textdata")


# Load this packages
# The following two approaches are equivalent
library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(SnowballC)
library(syuzhet)

# To use Twitter API you need to register an app with them first
# http://iag.me/socialmedia/how-to-create-a-twitter-app-in-8-easy-steps/


# save credentials 
# 1. dev.twitter.com
# 2. Roll down to "Manage Your Apps"
# 3. Log into your account
# 4. Keys and Access Tokens

requestURL = "https://api.twitter.com/oauth/request_token"
accessURL = "https://api.twitter.com/oauth/access_token"
authURL = "https://api.twitter.com/oauth/authorize"
consumerKey = "__________________________"
consumerSecret = "__________________________"

accessToken = "__________________________"
accessSecret = "__________________________"

setup_twitter_oauth(consumerKey,
                    consumerSecret,
                    accessToken,
                    accessSecret)

# Search Twitter

# Step 1: How to find geocode for a city: http://www.geocodesource.com/browse/location/us/ok/12185

tweets <- searchTwitter('OU Football', 
                             geocode='35.2225685120,-97.4394760132,20mi',  
                             n=500, retryOnRateLimit=1)


tweets.df <- twListToDF(tweets) 
View(tweets.df)

head(tweets.df$text)

# Removing hashtag , urls and other special charactersR

tweets.df2 <- gsub("http.*","",tweets.df$text)
tweets.df2 <- gsub("https.*","",tweets.df2)
tweets.df2 <- gsub("#.*","",tweets.df2)
tweets.df2 <- gsub("@.*","",tweets.df2)
tweets.df2 <- gsub("RT","",tweets.df2)


View(tweets.df2)

# Convert it to a data frame with string variables
# instead of a factor variable
data <- data.frame(tweets = as.character(tweets.df2), 
                   stringsAsFactors = FALSE)

# Tokenize the tweets into words
data <- data %>% 
    unnest_tokens(word, tweets)


# several sentiment lexicons (dictionary) in the sentiments dataset.
library(tidytext)
library(ggplot2)
library(forcats)
library(textdata)

sentiments

  # The three general-purpose lexicons are
  
  # AFINN from Finn Årup Nielsen,
  # bing from Bing Liu and collaborators, and
  # nrc from Saif Mohammad and Peter Turney.

sentiment <- get_sentiments("nrc")

data <- inner_join(data, sentiment, by = "word")

ggplot(data = data, aes(x = fct_rev(fct_infreq(sentiment)))) +
           geom_bar() +
           coord_flip()

