# Example: Text Analysis Comparing Authors
# Le Wang

# Motivation: Do the authors have the same styles?
# This example illustrate we can analyze text data as we do with discrete data
# Meanwhile, we can also explore different ways to present the results.
# Keep seeing such example will help us understand how natural language processing
# moves away from formal analysis of language such as grammar, but to consider 
# statistical aspect of language.

# We compare Brontë sisters, whose lives overlapped with Jane Austen’s somewhat but 
# who wrote in a rather different style, to 

install.packages("gtrendsR")
install.packages("reshape2")
install.packages("gutenbergr")

library(tidyverse)
library(gtrendsR)
library(reshape2)
library(gutenbergr)
library(dplyr)
library(tidytext)

# 1. Let's download the data
#  The Time Machine, The War of the Worlds, The Invisible Man, and The Island of Doctor Moreau. 

hgwells <- gutenberg_download(c(35,36,5230,159))
View(hgwells)

# 2. Tokenize the book into one word per line
hgwells.token <- unnest_tokens(hgwells,word,text)
#                              ~~~~~~~

# 3. Remove all the stop words such as "the" "of" "to" 
stop_words

hgwell.tidy <- anti_join(hgwells.token,stop_words)
#                        ~~~~~~~~~~~~~

# Returns the rows of the first data where it canNOT find a match in the second data
# Cheat Sheet:https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
?anti_join()

# More about commands to merge data
# http://stat545.com/bit001_dplyr-cheatsheet.html

# 2-3 can be combined using pipe operator 
tidy_hgwells <- hgwells %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

# Let's analyze the frequency
# Obtain the marginal distribution (PMF for every word)
pmf.hgwells <- as.data.frame(prop.table(table(tidy_hgwells$word)))

# rename the variables in the data
names(pmf.hgwells) <- c("word", "freq")


# Example of order()
a <- c(45,50,10,96)
order(a)
a[order(a)]

# Sort by descending
head(pmf.hgwells[order(-pmf.hgwells$freq),], n=10)

   #  Note that it is empty after the comma, which means we will have all the columns
   #  we use "-" in front of the variable on which we sort. This is descending order.

# Let's visualize the distribution

library(ggplot2)

# Let's select only those with frequencies larger than 0.002
  ggplot(pmf.hgwells[pmf.hgwells$freq>=0.002,], mapping = aes(x=word,y=freq)) +
  geom_bar(stat="identity") + # the heights of the bars to represent values in the data, use stat="identity"
  coord_flip() # Horizontal bar plot
  
# We can reorder the data so that it is easy to read the graph  
  
  ggplot(pmf.hgwells[pmf.hgwells$freq>=0.002,], mapping = aes(x=reorder(word,freq),y=freq)) +
    geom_bar(stat="identity") +
    coord_flip()
  
inform1 <-   ggplot(pmf.hgwells[pmf.hgwells$freq>=0.002,], mapping = aes(x=reorder(word,freq),y=freq)) +
    geom_bar(stat="identity") +
    coord_flip()
  

# Again, another way to visualize this? Word cloud!
  library(wordcloud)
  wordcloud(pmf.hgwells$word, pmf.hgwells$freq, min.freq = 0.002)  
    
# Part II. Repeat this process for Bronte sisters' books
# Let's obtain Brontë sisters, whose lives overlapped with Jane Austen’s somewhat but 
# who wrote in a rather different style. 
# Let’s get Jane Eyre, Wuthering Heights, The Tenant of Wildfell Hall, Villette, and Agnes Grey. 

bronte <- gutenberg_download(c(1260, 768, 969, 9182, 767))
tidy_bronte <- bronte %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

# Let's analyze the frequency
# Obtain the marginal distribution
pmf.bronte <- as.data.frame(prop.table(table(tidy_bronte$word)))

# rename the variables in the data
names(pmf.bronte) <- c("word", "freq")

# Sort by descending
head(pmf.bronte[order(-pmf.bronte$freq),],n=10)

# We can also visualize the information
ggplot(pmf.bronte[pmf.bronte$freq>=0.002,], mapping = aes(x=reorder(word,freq),y=freq)) +
  geom_bar(stat="identity") +
  coord_flip()

inform2 <- ggplot(pmf.bronte[pmf.bronte$freq>=0.002,], mapping = aes(x=reorder(word,freq),y=freq)) +
  geom_bar(stat="identity") +
  coord_flip()

# to arrange multiple grobs on a page.

library(gridExtra)
grid.arrange(inform1, inform2, ncol=2)

  # For more information, see https://cran.r-project.org/web/packages/gridExtra/vignettes/arrangeGrob.html



# Conclusions: At least at the surface (without actually testing), these two authors 
# appear to be different. They use different words, and HG Wells seemed to use some words
# a lot more frequently, but Bronte sisters used words more equally?
