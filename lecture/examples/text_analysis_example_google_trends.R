# Example: Google Searches
# Le Wang

# Motivation: This is motivated by many examples about Google Searches in
# Everybody Lies Big Data, New Data, and What the Internet Can Tell Us About Who We Really Are
# by Seth Stephens-Davidowitz

install.packages("gtrendsR")
install.packages("reshape2")

library(gtrendsR)
library(reshape2)

library(tidyverse)
library(dplyr)
library(tidytext)


# Donwload data
# Default: world wide searches
# key word, from web, past 7 days
# type ?gtrends for more information on options

##

see the table on this website 
https://ahrefs.com/blog/how-to-use-google-trends-for-keyword-research/

for how all the information is calculated

You can think of this information as the relative probability of each subject to the maximum
probability

##


google.trends<-gtrends(c("OU football"), gprop = "web", time = "now 7-d")
plot(google.trends)



# Let's look at the data and what it consists of
View(google.trends)

# Read "interet_over_time"
data<-google.trends[[1]]

# Let's go to Google website to compare the data
# https://trends.google.com/trends/

# There is a download button on Google trend website
# we can download the CSV file and compare it to ours
tail(data)

# Who are searching for OU football ("interest_by_country")?

data<-google.trends[[2]]
head(data, n=20)

# What else do people search ("related_queries")?
data<-google.trends[[7]]
head(data, n=20)


# Default: Let's look at US and Canada only

google.trends<-gtrends(c("OU football"), 
                       geo = c("CA", "US"), 
                       gprop = "web", 
                       time = "now 7-d")
plot(google.trends)


# Default: Among all the Americans, who is looking?!
google.trends<-gtrends(c("OU football"), 
                       geo = c("US"), 
                       gprop = "web", 
                       time = "now 7-d")
View(google.trends)

# Interest by region
data<-google.trends[[3]]
head(data)
tail(data)

# Drop those no-hits regions
data <- data[(data$hits != "<1"),]
data <- data[(data$hits != ""),]

# Convert hits from a character to a numeric variable
data$hits <- as.numeric(data$hits)

# Lets visualize the frequency by states. 
ggplot(data = data, aes(x = reorder(location, hits), y = hits)) +
  geom_bar(stat = "identity") + 
  coord_flip()



