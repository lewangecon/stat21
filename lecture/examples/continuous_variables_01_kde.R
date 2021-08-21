# This program illustrates a naive kernel density estimation

# Generate Some artificial Data
set.seed(123456)
X <- rnorm(10)

# Specify the x value that we would like to calculate 
# the density for
x <- c(0)

# specify the bandwidht
h <- 0.5

# Calculate the distance between every data point and x
# and normalize the distance
(X - x)/h

# Assign one to the data points falling in the interval
k <- ifelse((X-x)/h<=1, 1, 0)
k

# Use the formulae to obtain kernel density estimate

N <- length(X)
1/(N*h)*sum(1/2*k)

