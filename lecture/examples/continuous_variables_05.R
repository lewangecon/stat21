# This program illustrates how to estimate 
# 1. Variance and Semi-variance
# 2. Skewness and Kurtosis
# 3. Government Intervention



# Variance

x1 <- c(-10,0,10)
x2 <- c(-100,0,100)

mean(x1);mean(x2)
median(x1);median(x2)
var(x1);var(x2)


# Semi-variance (focusing on the lower tail)
x1 <- rnorm(1000)
sum(x1[x1 < mean(x1)]-mean(x1))^2/length(x1[x1<mean(x1)])

var(x1)



# Skewness

library(moments)
x5<-c(-10,0,10, 100)
x6<-c(-100,-10,0,10)

mean(x5)
median(x5)

mean(x5)
median(x6)

# Calculate skewness
skewness(x5)
skewness(x6)

# Kurtosis 

kurtosis.data <- rnorm(100)
plot(density(kurtosis.data))

kurtosis(kurtosis.data)

# Everything in Tidyverse

#install.packages("tidyquant")
library(tidyverse)
library(tidyquant)


mpg %>% 
  summarise(mean = mean(hwy),
            median = median(hwy),
            sd = sd(hwy),
            IQR = IQR(hwy),
            MAD = mad(hwy),
            quantile = quantile(hwy, .5),
            min = min(hwy),
            max = max(hwy),
            skew = skewness(hwy),
            kurt = kurtosis(hwy))



# Government Intervention

set.seed(123456)
return<- rnorm(50)
return

var(return)

# Let's add more investment opportunites with zero returns
return2<- c(return, rep(0,50))
return2

var(return)
var(return2)