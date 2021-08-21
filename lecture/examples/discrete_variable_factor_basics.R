# Example: Factor Variables in R (Basics)
# Le Wang

# This program illustrates some basic
# operations with a factor variable

# Let's randomly sample 30 observations from integers
# {1,2,3}

  set.seed(123456)
  sample <- sample(1:3, 30, replace = TRUE)
  sample

# 1. Evaluate whether this variable is saved 
# as a factor variable

  is.factor(sample)
  is.numeric(sample)
  
  
# 2. Create a factor variable with some labels
  
  sample.factor <- factor(sample, label = c("High", "Middle","Low"))
  sample.factor
  is.factor(sample.factor)

# 3. How many unique values
  
  levels(sample.factor)
  
  # Not reflecting the true order (only alphabetical order)

# 4. Assign correct order
  
  sample.factor <- factor(sample.factor, levels = c("Low", "Middle", "High"))
  levels(sample.factor)

# 5. Force R to recognize the arithmetic order
  sample.ordered <- ordered(sample.factor, levels = c("Low", "Middle", "High"))  
  sample.ordered
  
  sample.factor < "Middle"
  sample.ordered < "Middle"

# 6. Naive way to describe a factor variable
  
  hist(sample.ordered)
  
  # 6.a Frequency table
  table(sample.ordered)
  
  # 6.b Histogram Like Graph
  plot(sample.ordered)
  
  
  
  