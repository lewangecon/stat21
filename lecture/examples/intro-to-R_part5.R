# Project:  Econ 5023 Statistics for Decision Making
# Author :  Le Wang

# This program illustrates how to manually read and output data 
# You should also check out Chapter 11 of R for Data Science

# Set your working directory first
# Note that this is my own directory and you need to modify it to yours
#  setwd("C:/Users/Le Wang/Dropbox/02 teaching/stat/03lectures/01-Intro-to-R-Studio/01_slides/")

# my Mac folder
  setwd("/Users/lewang/Dropbox/02\ teaching/stat/03lectures/01-Intro-to-R-Studio/01_slides/examples")


##########################################
# Read Data
##########################################    
  
  # Type 1: Text files
  #         Data sometimes come with headers 
  #         (the first row is variable names, not actual data!)
  #         You need to tell R that!
  
  kids<-read.table("Kids.txt",header=T)
  
  # Double click the kids data in the Session "Environment", you can 
  # have a spread-sheet type of view of the data. 
  
  # Let's call a variable in the data
  
  kids$Bday
  
  # Remember that the `$` operator is one way to access an individual variable from within a data.frame
  # object.
  
  kids
  
  # Type 2: CSV files
  kids2<-read.csv("Kids2.csv",header=T)
  kids2
  
  # Type 3: Delimited files  
  kids3<-read.delim("Kids3.prn",header=T)
  kids3
  
  
  # Type 4: Stata files
  library(haven)
  major <- read_dta("examples/major.dta")    
  
  
  # Type 5. Tidyverse
  
  kids4<-read_csv("examples/Kids2.csv")
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
  write_dta(major, "major.dta") 

  
##########################################
# Quantmod package from Yahoo
##########################################  
  
  # Install Quantmod package if you have not done so
  install.packages("quantmod")
  
  # Load the library
  library("quantmod")
  
  # Obtain the information on price and volume for Walmart
  getSymbols('AAPL')

  # Take a look at the data (first six rows/dates)
  head(WMT)
  
  # Let's plot all the price data and add some indicators such as
  # volumes (addVo()) and Bollinger Bands (addBBands())
  chartSeries(WMT, subset='2010::2010-04', 
              theme = chartTheme('white'),
              TA="addVo();addBBands()")    
  
  # Use the built-in command to generate daily returns
  # We will explain in more detail why this is not necessarily
  # the best practice. 
  
  ret2 <- dailyReturn(WMT$WMT.Adjusted)
  # Examine the data
  View(ret2)
  
  # Suppose that we are only interested in a subset of the data
  # We will explain in detail why this should be employed in practice
  
  # Note that the date variable is not in my dataset, how to obtain
  # it? Use index()!
  
  WMT.2011<-subset(ret2,index(ret2) >="2011-01-01" & index(ret2) <="2011-12-31")
  
  
  

  
  

  