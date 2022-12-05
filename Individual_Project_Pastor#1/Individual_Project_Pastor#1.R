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
trendTweets1 <- searchTwitter("#Wednesday -filter:retweets", n=10000, lang="en", since="2022-11-22", until="2022-11-29", retryOnRateLimit = 120)
trendTweets1

# CONVERTING LIST DATA TO DATA FRAME.
trendTweetsDF1 <- twListToDF(trendTweets1)
class(trendTweetsDF1)
names(trendTweetsDF1)
View(trendTweetsDF1)
head(trendTweetsDF1)[1:5]
head(trendTweetsDF1$text)[1:5]

# SAVE DATA FRAME FILE.
save(trendTweetsDF1,file = "trendingTweetsDF.Rdata")

# LOAD DATA FRAME FILE.
load(file = "trendingTweetsDF.Rdata")

# SAVING FILE AS RDATA.
save(trendTweetsDF1, file = "tweetsDF2.Rdata")

# CHECKING FOR MISSING VALUES IN A DATA FRAME.
sap1 <- sapply(trendTweetsDF1, function(x) sum(is.na(x)))
sap1

# SUBSETTING USING THE dplyr() PACKAGE.
tweetsDF2 <- trendTweetsDF1 %>%
  select(screenName,text,created,statusSource)
tweetsDF2

# GROUPING THE DATA CREATED. 
tweetsDF2 %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

mutatee1 <- tweetsDF2 %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
mutatee1

tweetsDF2 %>% pull(created) %>% min() 
tweetsDF2 %>% pull(created) %>% max()

# Plot on tweets by time using the library(plotly) and ggplot().
plt1 <- mutatee1 %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = 'Number of Tweets per Hour')

plt1 %>% ggplotly()

# ==============================================

ggplot(data = tweetsDF2, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

# PLOTTING STATUS SOURCE.
encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){  
    "facebook"
  }else {
    "others"
  }
}


tweetsDF2$tweetSource = sapply(tweetsDF2$statusSource, 
                               encodeSource)

tweet_appSource1 <- tweetsDF2 %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count))

ggplot(tweetsDF2[tweetsDF2$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

# ACCOUNTS WHICH TWEET ABOUT FIRST LOVE.
tweet_appScreen1 <- tweetsDF2 %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

#convert to Corpus
namesCorpus1 <- Corpus(VectorSource(tweetsDF2$screenName))  #using ScreenName
class(tweetsDF2$screenName)

cls_data1 <- class(VectorSource(tweetsDF2$screenName))
cls_data1

str(namesCorpus1)

class(namesCorpus1)

nms1 <- namesCorpus1
nms1

# WORDCLOUD FOR SCREEN_NAMES.
pal11 <- brewer.pal(8, "Dark2")
pal21 <- pal11[-(1:4)]
set.seed(123)

par(mar = c(0,0,0,0), mfrow = c(1,1))

wordcloud(words = namesCorpus1, scale=c(3,0.5),
          max.words=10000,
          random.order=FALSE,
          rot.per=0.5,
          use.r.layout=TRUE,
          colors=pal11)

