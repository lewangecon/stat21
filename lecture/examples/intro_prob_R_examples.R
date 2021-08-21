# Project: Introduction to Probability Theory
# Author:  Le Wang

# This program illustrates how to in R
# 1) calculate the sample space 
# 2) counting
# 3) Law of Total Probability

# Install the package first if you have not done so
# install.packages("prob")
  
  library("prob")

#########################  
# Sample Space
#########################
  
# Sample space for the experiment of tossing 
# a coin repeatedly with the outcomes "H" or "T".
  tosscoin(1)
  
  # Sample space for the experiment of tossing 
  # a coin repeatedly with the outcomes "H" or "T".
  tosscoin(3)
  
# Sample space  for the experiment of rolling a die repeatedly.
  rolldie(1)
  
  
# A Standard Set of Playing Cards
  head(cards(), n = 15)
  
  S <- cards()
  head(S, n=20)  

#########################  
# Event
#########################
  
# Event: only cards in the suit Heart  
  subset(S, suit == "Heart")

# Event: rank in 7 to 9  
  subset(S, rank %in% 7:9)
  
  
  head(rolldie(3), n = 4)
  subset(rolldie(3), X1 + X2 + X3 >16)  
  

#########################  
# Naive Way to Assign Prob
#########################
  
  A <- subset(rolldie(3), X1 + X2 + X3 >16)
  S <- rolldie(3)
  Pr.A <- nrow(A)/nrow(S)
  Pr.A  
  
  
#########################  
# Counting
#########################
  
  # Factorial
  factorial(4)
  
  # N choose K
  choose(5, 2)
  
  # 4 different ways of counting
  nsamp(n=3,k=2, replace = TRUE, ordered = TRUE)
  nsamp(n=3,k=2, replace = FALSE, ordered = TRUE)
  nsamp(n=3,k=2, replace = TRUE, ordered = FALSE)
  nsamp(n=3,k=2, replace = FALSE, ordered = FALSE) 

#########################  
# Law of Total Prob
#########################    
  
  # fill in the name of the directory where you save the data
  FLvoters<-read.csv("_________/FlVoters.csv")
  FLvoters <- na.omit(FLvoters)
  mytable<-table(race=FLvoters$race,
                 gender=FLvoters$gender)
  FL.dist <- as.matrix(prop.table(mytable))
  FL.dist  
  
  # Sum the first column
  sum(FL.dist[,1])
  
  # Use column sum
  colSums(FL.dist)
  
  