# Project: Introduction to Statistics (Part I)
# Author:  Le Wang


# This program illustrates some basic things
# with time series plots in R

  # 1. quantmod()
  # 2. plot()
  # 3. ggplot2()

  # Obtain the data
  library(quantmod)
  getSymbols('UNRATE',src='FRED')
  
  # examine the data
  head(UNRATE)
  
  tail(UNRATE)

  # Approach 1
  chartSeries(UNRATE, theme="white")
  
  # Approach 2
  plot(UNRATE)
  
  abline(h = 10, col = "salmon")  
  
  
  # Approach 3: Data frame
  data.unrate <- data.frame(UNRATE)
  data.unrate$date <- as.Date(rownames(data.unrate))
  colnames(data.unrate)[1] = 'unrate'
  head(data.unrate)
  
  library(ggplot2)
  ggplot(data=data.unrate) + 
    geom_line(mapping = aes(x=date,y=unrate))
  
  # add some theme
  ggplot(data=data.unrate) + 
    geom_line(mapping = aes(x=date,y=unrate)) + 
    theme_bw() 
  
  # Efficient code
  ggplot(data=data.unrate, mapping = aes(x=date,y=unrate)) + 
    geom_line() + 
    geom_smooth() + 
    theme_bw()    
  
  