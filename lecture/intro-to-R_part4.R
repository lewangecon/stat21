# Project: Tutorial on R and R Studio (Part II)
# Author:  Le Wang

# This program illustrates two things that we communicate with R

##################################################
# Create Directory and Set working directory
##################################################

# Set your working directory to a folder called ec5023 on your desktop

  # Windows
  setwd("C:/users/[your user name]/Desktop/ec5023/")
  setwd("C:\\users\\[your user name]\\Desktop\\ec5023/")
  
  # Mac
  setwd("~/Desktop/ec5023")
  
  

# Check the wd is correct
  getwd()

# List the folders in your directory
  dir

# Create a new folder in your directory
  dir.create()
  
  
  # Example:
  # teaching_folder_organization_template.R (online)


##################################################
# Function
##################################################
  
  myvector <- c(1,2,3,4,5)
  
  oklahoma <- c(81.8, 57.6,72.4,73.3,81.0, 73.1, 79.2, 79.2, 57.1, 72.4, 65.6, 74.1, 73.5)
  
  # Sum up the values and divide by the number of observations
  # Step 1. Addition
  sum(oklahoma)
  
  # STep 2. Counting
  length(oklahoma)
  
  # Step 3. Division
  sum(oklahoma)/length(oklahoma)
  
  # Mean function (all three steps done internally)
  mean(oklahoma)
  
##################################################
# Package
##################################################  
  
  
  # I use a dataset that comes with the base installation of R, called "cars", and # put it in the memory.
  attach(cars) 
  # Calculate the mean (average) of one of the variables called "speed"
  mean(speed) 
  
  # Now try to  calculate Skewness and Kurtosis (We will use these A LOT later!)
  skewness(speed)
  
  # install packages  
  install.packages(moments)
  
  # Now that you have the moments package installed and in use, try again!
  search()
  
  # Let's add this package to the search list
  library("moments")
  skewness(x)  

  # same command but returns a logical value whether or not the package
  # has been installed. Useful when you need to write a generic program
  require("moments"")

  return <- require("moments")
  return
  
  # Detach a package in case there are conflicting names such as skewness
  detach("package:vegan", unload=TRUE)
  