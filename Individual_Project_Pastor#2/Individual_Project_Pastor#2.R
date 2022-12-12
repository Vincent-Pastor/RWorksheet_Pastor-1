install.packages("tm")
install.packages("tidytext")
install.packages("plotly")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("dplyr")
install.packages("wordcloud2")
install.packages("syuzhet")
install.packages("magrittr")
install.packages("stringr")
install.packages("twitteR")

library(syuzhet)
library(wordcloud)
library(plotly)
library(tm)
library(tidytext)
library(dplyr)
library(RColorBrewer)
library(ggplot2)
library(magrittr)
library(stringr)
library(twitteR)

# SETUP CREDENTIALS.
CONSUMER_KEY <- "AVkKX52SdvJHVkL8FKkiWx1Zl"
CONSUMER_SECRET <- "rX4kXD8LJbeNa8p19MCQvEIjhNXLa5gyBBeAhorC3C2dCpgh1Y"
ACCESS_TOKEN <-  "1595206858142121986-NZNHhytlvCoFo7eAFlNomofNthZLFk"
ACCESS_SECRET <-  "K7qSpHI15utrwDkoI3OwOHHg6IlwKT5RO0QQXwgvhcdIu"

setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)


# EXTRACTING TWEETS.
trendTweets2 <- searchTwitter("#taylorswift", n=10000, lang="en", since="2022-12-01", until="2022-12-07", retryOnRateLimit = 120)
trendTweets2

# CONVERTING LIST DATA TO DATA FRAME.
trendTweetsDF2 <- twListToDF(trendTweets2)
class(trendTweetsDF2)
names(trendTweetsDF2)
View(trendTweetsDF2)
head(trendTweetsDF2)[1:5]
head(trendTweetsDF2$text)[1:5]

# SAVE DATA FRAME FILE.
save(trendTweetsDF2,file = "trendingTweetsDF1.Rdata")

# LOAD DATA FRAME FILE.
load(file = "trendingTweetsDF1.Rdata")

# SAVING FILE AS RDATA.
save(trendTweetsDF2, file = "tweetsDF2.Rdata")

# CHECKING FOR MISSING VALUES IN A DATA FRAME.
sap2 <- sapply(trendTweetsDF2, function(x) sum(is.na(x)))
sap2

# SUBSETTING TWEETS.
sub <- trendTweetsDF2 %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == FALSE)
sub
# GROUPING THE DATA CREATED. 
sub %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

grp <- sub %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
grp

sub %>% pull(created) %>% min() 
sub %>% pull(created) %>% max()

# Plot on tweets by time using the library(plotly) and ggplot().
plt2 <- ggplot(grp, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")


plt2 %>% ggplotly()

# ==============================================

# SUBSETTING RETWEETS.
sub2 <- trendTweetsDF2 %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == TRUE)
sub2

sub2 %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

grp2 <- sub2 %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
grp2

sub2 %>% pull(created) %>% min() 
sub2 %>% pull(created) %>% max()

# Plot on tweets by time using the library(plotly) and ggplot().
plt3 <- ggplot(grp2, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")


plt3 %>% ggplotly()

