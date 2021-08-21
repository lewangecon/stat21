# This program illustrates how to estimate mean 
# and examines various properties of mean or its sample counterparts. 

# Property 1: Mean of a constant is still a constant

x <- c(1,1,1,1)
x

mean(x)


# Property 2: Expectation of a linear function of a variable
#             is equal to the same linear function of the expectation
#             of the original variable

  y <- c(1,2,3,4)
  y
  mean(y)

  # New Variable: A linear function of y
  a <- 2
  b <- 1
  z <- a*y + b
  mean(z)
  
  # Equal Expectations

  a*mean(y)+b
  
# Property 3: Expectation of a linear combination of variables is
#             equal ot the same linear combination of the expectations
#             of all variables
  
  
  y1 <- c(1,2,3,4)
  y2 <- c(6,7,8,9)
  
  y1
  y2
  
  # New Variable: A linear combination of two different variables
  c1 <- 2
  c2 <- 1
  z <- c1*y1 + c2*y2
  mean(z)
  
  # Equal expectation: a linear combination of their respective means
  c1*mean(y1)+c2*mean(y2)