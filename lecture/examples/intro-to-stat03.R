# Project: Introduction to Statistics (Part III)
# Author:  Le Wang

# This program illustrates two decomposition methods
# 1. classical decomposition method
# 2. STL method

library(quantmod)
getSymbols('UNRATE',src='FRED')
head(UNRATE)


## Classical Decomposition Method

  # 1. Let's try the decomposition command
  plot(decompose(UNRATE))

  # 2. Assign frequency and declare it as 
  #    a time series so that it can be recognized by
  #    R
  
  attr(UNRATE, 'frequency') <- 12
  time <- as.ts(UNRATE)

  # 3. Let's decompose the time series
  results <- decompose(time)

  # examine the results
  ls(results)
  plot(results)

  # 4. We can of course combine everything into one
  # line
  plot(decompose(as.ts(UNRATE)))

  # 5. We can construct the part with only trend and
  #    seasonal components. We do not have enough
  #    tools to model cycles yet!
  
  trendseason <- results$trend +  results$seasonal 
  plot(trendseason)



## STL Method
  
  results<-stl(time, t.window=13, s.window="periodic", robust=TRUE)
  autoplot(results)

  # How to predict?
  autoplot(time) +
    autolayer(stlf(time, h=20), PI=FALSE, series="Mean") +
    ggtitle("Forecasts for monthly unemployment rates") +
    xlab("Date") + ylab("Unemployment Rates") +
    guides(colour=guide_legend(title="Forecast"))
  