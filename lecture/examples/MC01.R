


##########################################
# Experiment 1: Simulate a fair coin
##########################################

  x <- sample(0:1, 100, replace = TRUE)
  x

  # How does our simulation perform?
  hist(x,probability = TRUE)
  mean(x)
  
  abs(mean(x) - 0.5)
  
# Two further refinements of our first Monte Carlo Simulation exercise
  
# 1. Let's increase the sample size
  
  x <- sample(0:1, 100000, replace = TRUE)
  hist(x,probability = TRUE)
  
  mean(x)
  abs(mean(x)-0.5)
  
  
# 2. Reproducible Results
  
  set.seed(123456)
  x <- sample(0:1, 100000, replace = TRUE)
  hist(x,probability = TRUE)
  
  mean(x)
  abs(mean(x)-0.5)  
  
  
##########################################
# Experiment 2: Simulate a unfair coin
##########################################
  
  set.seed(123456)
  x <- sample(0:1, 100000, replace = TRUE, prob = c(0.8,0.2))
  mean(x)
  

  ##########################################
  # Lessons from the previous experiments
  ##########################################  

  # Suppose that these are really random, then we know that 
  
  # 1. When the sample size is large enough, we are getting closer to the truth.
  # 2. Even with the random variables being drawing from a true distribution, 
  #    the sample estiamtes are arbitrarily close to the truth, but never exact!
  
  
  
##########################################
# Experiment 3: Visualize the law of large numbers
##########################################
  
  # ensure producibility
  set.seed(123456)
  
  # Simulate a dataset 
  x<-sample(0:1, 300, replace = TRUE)
  
  # Create sum for datasets of different sizes
  sum <- cumsum(x)
  sample.size<-c(1:300)
  
  # Create mean for datasets of different sizes
  mean <- sum/sample.size
  
  # Combine it into a dataframe
  data<-data.frame(mean, sample.size)
  attach(data)
  plot(sample.size,mean)
  abline(h=0.5)
  
  
##########################################
# Experiment 4: How to play craps
##########################################
  
  
  set.seed(123456)
  
  # Create two dices
  dice1 <- sample(1:6,100000,replace=T)
  dice2 <- sample(1:6,100000,replace=T)
  
  # Create outcomes for 100000 experiments
  sum <- dice1 + dice2
  
  # Examine the histogram (PMF)
  hist(sum, breaks=c(1:12), probability = TRUE)  
  