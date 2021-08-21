# Project: Random Variable, PMF and CDF
# Author:  Le Wang


# This program illustrates how to obtain
# 1. Frequency table
# 2. Histogram
# 3. PMF
# 4. PMF and Forecasting
# 5. CDF 


library(tidyverse)
# Create an artificial dataset
  
  x<-c(6,7,6,3,10,3,2,1,10,7)
  x
  
# Part 1: Frequency Table (By Hand)
  
  x
  sort(x) 
  unique(x)
  
  table(x)
  table(diamonds$cut)
  
  
  # Tidyverse approach
  # Need to convert it to a data frame first
  data <- data.frame(x = x)

  data %>% 
    group_by(x) %>% 
    count()
  
  ______ %>% 
    group_by(____) %>% 
    count()
  
  data %>% 
    count(x)
  
  ______ %>% 
    count(_____)
  
  
  

  
#############################################    

  
  
# Let's introduce the concept in our slides
  
  
  
  
  
#############################################    

# Part 2. Histogram

  # Histogram
  hist(x)  
  
  # Refined histogram
  hist(x,breaks = c(0:10), freq = TRUE)
  
  # c(0:10): A short-cut to create a vector of all integer values between 1 and 10.             
  # breaks = c(0:10): means that I want to calculate more accurate counts for all
  #                   possible values, instead of only some groups of values. 
  # freq = TRUE: gives you number of counts of each value   
  
  # Bar Plot
  barplot(table(x))
  
  # Tidyverse approach
  # Approach 1: geom_bar()
  ggplot(data = data) +
    geom_bar(mapping = aes(x = x))
  
  # Approach 2: geom_col()
  results <- data %>% 
    count(x)
  
  ggplot(data = results) +
    geom_col(mapping = aes(x = x, y = n))
  
  
#############################################    
  
  
  
# Let's introduce the concept in our slides
  
  
  
  
  
#############################################   
  
# Part 3. PMF

  x<-c(1,2,3,4,5)
  x  

  
  # PMF when x = 1
  sum(x == 1)/length(x)
  
  # A detailed explanation of the code above
  x
  x == 1
  sum(x == 1)
  length(x)
  sum(x == 1)/length(x)  

  # Histogram (with PMF)  
  # We can calculate it for every value
  hist(x,breaks = c(0:10), probability = TRUE)
  
  # Tidyverse approach
  data <- data.frame(x = x)
  
  # Approach 1: geom_bar()
  ggplot(data = data) +
    geom_bar(mapping = aes(x = x, y = ..prop.., group = 1))


  # Approach 1: geom_col()
  # Step 1. Calculate probability mass function 
  
    results <- data %>% 
      count(x) %>% 
      mutate(prop = n/sum(n))
  
  # Step 2. Plot it without transforming our data 
    ggplot(data = results) +
      geom_col(mapping = aes(x = x, y = prop))
    
    
########################################################    
# See slides:    
#    
#    Two variables with the same distribution are not necessarily equal!    
#    
########################################################
    
# Part 4. PMF and Forecasting  

  # Lets look at a larger dataset!
  sample <- sample(1:10,300, replace = TRUE)
  sample
  
  hist(sample, breaks = c(0:10), probability = TRUE)
  

########################################################    
# See slides for football examples
#    
#        
#    
########################################################    
  
  
# Part 5. CDF
  data <- data.frame(x = x)
  
  # 1. by hand
  
  sum(data$x<=4)/length(data$x)
  data$x<=4
  
  # 2. Built-in Command
  ecdf(data$x)(4)
  
  
  results <- ecdf(data$x)
  results(data$x)
  
  plot(ecdf(data$x))
  
  # 3. Tidyverse approach
  
  data %>% 
    mutate(cdf = cume_dist(x))
  
  