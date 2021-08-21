# Project:  Econ 5023 Statistics for Decision Making
# Author :  Le Wang

# This program illustrates how to manually read and output data 
# You should also check out Chapter 11 of R for Data Science


# Let's follow the following steps to use this code

  1. Create a folder
  2. Run my code to create subfolders
  3. move all the data into a subfolder for data
  4. Now lets practice how to obtain data from the subfolder
  

# Set your working directory first
# Note that this is my own directory and you need to modify it to yours
#  setwd("C:/Users/Le Wang/Dropbox/02 teaching/stat/03lectures/01-Intro-to-R-Studio/01_slides/")

# my Mac folder
  setwd("/Users/lewang/Dropbox/02\ teaching/stat/econ5023")


##########################################
# Read Data
##########################################    
  
  # Type 1: Text files
  #         Data sometimes come with headers 
  #         (the first row is variable names, not actual data!)
  #         You need to tell R that!
  
  kids<-read.table("00example/Kids.txt",header=TRUE)
  
  # Double click the kids data in the Session "Environment", you can 
  # have a spread-sheet type of view of the data. 
  
  # Let's call a variable in the data
  
  
  kids$Bday
  kids["Bday"]
  

  # Remember that the `$` operator is one way to access an individual variable from within a data.frame
  # object.
  
  kids
  
  # Type 2: CSV files
  kids2<-read.csv("00example/Kids2.csv",header=T)
  kids2
  
  # Type 3: Delimited files  
  kids3<-read.delim("00example/Kids3.prn",header=T)
  kids3
  
  
  # Type 4: Stata files
  library(haven)
  major <- read_dta("00example//major.dta")    
  
  
  # Type 5. Tidyverse

  kids4<-read_csv("00example//Kids2.csv")
  kids4  
  
  read_csv("The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3", skip = 2)
  
  read_csv("# A comment I want to skip
  x,y,z
  1,2,3", comment = "#")  
  
  
##########################################
# Output Data
##########################################

# Create a matrix of data values
# This 2 by 3 matrix is called "major"  
  major<-matrix(c(632,576,435,520,623,397),nrow=2,byrow=T)
  major

# Let's give names to these columns (treated as variables)
  colnames(major)<-c("Sciences","Liberal Arts","Business")

# row names
  rownames(major)<-c("Male","Female")

# Let's look at the data again
  major

# Save the data in working directory in case you want
# to use this data again
  write.table(major, file="major2.txt",row.names=FALSE)

# Save To A Tab Delimited Text File
  write.table(major, file="major.txt",row.names=FALSE,sep="\t")

# Or, Save to a Stata file
# export data frame to Stata binary format 
  library(haven)
  write_dta(major, "00example/major_new.dta") 
  
  # First fix
  major <- data.frame(major)
  write_dta(major, "00example/major_new.dta") 
  
  # Second fix
  names(major)  <- c("Sciences","Liberal_Arts","Biz")
  write_dta(major, "00example/major_new.dta") 
  

  
##########################################
# Quantmod package from Yahoo
##########################################  
  
  # Install Quantmod package if you have not done so
  install.packages("quantmod")
  
  # Load the library
  library("quantmod")
  
  # Obtain the information on price and volume for Walmart
  getSymbols('OKE')
  View(OKE)

  # Take a look at the data (first six rows/dates)
  head(AAPL)
  
  tail(AAPL)
  
  # Let's plot all the price data and add some indicators such as
  # volumes (addVo()) and Bollinger Bands (addBBands())
  chartSeries(OKE, 
              theme = chartTheme('black'),
              TA="addVo();addBBands()")    
  
  # Use the built-in command to generate daily returns
  # We will explain in more detail why this is not necessarily
  # the best practice. 
  
  ret2 <- dailyReturn(AAPL$AAPL.Adjusted)
  # Examine the data
  View(ret2)
  
  # Suppose that we are only interested in a subset of the data
  # We will explain in detail why this should be employed in practice
  
  # Note that the date variable is not in my dataset, how to obtain
  # it? Use index()!
  
  AAPL.2011<-subset(ret2,index(ret2) >="2011-01-01" & index(ret2) <="2011-12-31")
  
  
  

  
  

  