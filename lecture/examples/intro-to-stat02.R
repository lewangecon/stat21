# Project: Introduction to Statistics (Part II)
# Author:  Le Wang

# This program illustrates some simple forecasting
# methods

library(quantmod)
library(fpp2)
getSymbols("UNRATE",src="FRED")
attr(UNRATE,'frequency') <- 12
time <- ts(UNRATE, start = 1948, frequency = 12)


#  with Data from Jan 1948 to Feb 2018

  time2 <- window(time,start=1948,end=c(2018,2))
  
  # Plot some forecasts
  autoplot(time) +
    autolayer(meanf(time2, h=5), PI=FALSE, series="Mean") +
    autolayer(naive(time2, h=5), PI=FALSE, series="Naïve") +
    autolayer(snaive(time2, h=5), PI=FALSE, series="Seasonal naïve") +
    autolayer(rwf(time2, drift=TRUE, h=5), PI=FALSE, series="Drift") +
    ggtitle("Forecasts for monthly unemployment rates with Data from Jan 1948 to Feb 2018") +
    xlab("Date") + ylab("Unemployment Rates") +
    guides(colour=guide_legend(title="Forecast"))

# with Data from Jan 2010 to Feb 2018

  time2 <- window(time,start=2010,end=c(2018,2))
  time3 <- window(time,start=2010)
  
  # Plot some forecasts
  autoplot(time3) +
    autolayer(meanf(time2, h=5), PI=FALSE, series="Mean") +
    autolayer(naive(time2, h=5), PI=FALSE, series="Naïve") +
    autolayer(snaive(time2, h=5), PI=FALSE, series="Seasonal naïve") +
    autolayer(rwf(time2, drift=TRUE, h=5), PI=FALSE, series="Drift") +
    ggtitle("Forecasts for monthly unemployment rates with Data from Jan 2010 to Feb 2018") +
    xlab("Date") + ylab("Unemployment Rates") +
    guides(colour=guide_legend(title="Forecast"))