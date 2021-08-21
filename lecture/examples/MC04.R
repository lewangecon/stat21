# This program illustrates the concept of Central Limit Theorem

# Set seed number to ensure reproducibility
set.seed(123456)

# Define a vector to hold our sample means
means <- vector(,10000)

# Generate 1000 samples of size n and store their means
for (i in 1:10000){
  
  # Draw from the "fair-coin" distribution
  # Does not matter what distribution you draw 
  # the data from
  
  sample   <- sample(0:1, 1000, replace = TRUE)
  means[i] <- mean(sample)
  
}



plot(density(means))