# Example: Factor Variables in R using IPUMS data
# Le Wang

# This program illustrates
# 1. How to work with the IPUMS data and convert it to a factor variable
# 2. the tidy approach to visualize frequency for an unordered factor variable
# 3. the tidy approach to visualize PMF for an unordered factor variable
# 4. Alternative Approach to visualize the PMF

library(ipumsr)
library(dplyr, warn.conflicts = FALSE)
library(forcats)
library(tidyverse)

##############################################################
#
# Set your working directory before running this program and make
# sure that the following files are saved in the same folder
# 
##############################################################

# 1. discrete_variable_factor_examples.R
# 2. cps_XXXXX.xml
# 3. cps_XXXXX.R
# 4. cps_XXXXX.dat

# Read in the CPS data
# You have to change the R file name to the one that you download from IPUMS-CPS Website
source("cps_00019.R")

# Lets examine the data 
str(data)

# Lets examine the variable labels (too many to display!)
ipums_val_labels(data$RACE)

  # It is not a facto variable yet
  levels(data$RACE)

# Declare RACE variable as a factor variable AND include it in the dataset
# Remove labels that do not appear in the data
  
data <- data %>% 
    mutate(race1 = as_factor(lbl_clean(RACE))) 
  
  levels(data$race1)
  
# Lets plot the graph
  ggplot(data = data, aes(x = race1)) + 
    geom_bar()
  
  # It display some information, but not quite intuitive nor straghtforward

  
# Lets sort it based on its frequency

data <- data %>% 
  mutate(race2 = as_factor(lbl_clean(RACE))  %>% fct_infreq()) 

# See what has changed in terms of labels
levels(data$race2)  

ggplot(data = data, aes(x = race2)) + 
  geom_bar() +
  coord_flip()
  
    
# Lets sort it based on its frequency

  data <- data %>% 
    mutate(race3 = as_factor(lbl_clean(RACE))  %>% fct_infreq() %>% fct_rev()) 
  
  # See what has changed in terms of labels
  levels(data$race3)  
  
  ggplot(data = data, aes(x = race3)) + 
    geom_bar() +
    coord_flip()  
  
  # You actually do not need to manipulate the data
  # Instead, you can manipulate it only when generating the graph without
  # adding a new variable to the data set. 
  ggplot(data = data, aes(x = fct_rev(fct_infreq(as_factor(RACE))))) + 
    geom_bar() +
    coord_flip()
  
# As we can see, there are relatively few observations in many of the 
# racial categories. For statistical analysis, we often collapse some
# some of them into a larger category, say, others. Here, we simply
# illustrate how to do it with a hypothetical example. 

  data %>%
    mutate(newrace = fct_collapse(race1,
                                  white = c("White"),
                                  black = c("Black/Negro"),
                                  native = c("American Indian/Aleut/Eskimo",  "White-American Indian", 
                                             "Black-American Indian", 
                                             "White-Black-American Indian",
                                             "Hawaiian/Pacific Islander only"),
                                  asian = c("Asian only"),
                                  other = c("White-Black","White-Asian","White-Hawaiian/Pacific Islander",
                                            "Black-Asian","Black-Hawaiian/Pacific Islander","American Indian-Asian",
                                            "Asian-Hawaiian/Pacific Islander", "White-Black-Asian",
                                            "White-American Indian-Asian","White-Asian-Hawaiian/Pacific Islander",
                                            "White-Black-American Indian-Asian", "American Indian-Hawaiian/Pacific Islander",
                                            "White-Black--Hawaiian/Pacific Islander","Black-American Indian-Asian",
                                            "White-American Indian-Asian-Hawaiian/Pacific Islander","Two or three races, unspecified",
                                            "Four or five races, unspecified")
    )) %>%
    count(newrace)
  
# Or, you simply would like to lump together several small groups for a simplified table or graph

  data %>% 
    mutate(newrace2 = fct_lump(race1)) %>% 
    ggplot(aes(x = fct_rev(fct_infreq(newrace2)))) + 
    geom_bar() +
    coord_flip()
  
# Or, you can decide how many groups that you would like to keep  
  data %>% 
    mutate(newrace2 = fct_lump(race1, n = 4)) %>% 
    ggplot(aes(x = fct_rev(fct_infreq(newrace2)))) + 
    geom_bar() +
    coord_flip() 
  
# Or, you can report probability mass function. 
  data %>% 
    mutate(newrace2 = fct_lump(race1, n = 4)) %>% 
    ggplot(aes(x = fct_rev(fct_infreq(newrace2)))) + 
      geom_bar(aes(y = (..count..)/sum(..count..))) +
      coord_flip()  +
      ylab("Probability") +
      xlab("Race")
  
# Alternative approach to visualize the PMF
# Word cloud
  
  library(wordcloud)
  data <- data.frame(table(data$race3))
  data
  
  wordcloud(data$Var1, data$Freq)  

  