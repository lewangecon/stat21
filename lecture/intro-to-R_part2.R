# Project: Tutorial on R and R Studio (Part II)
# Author:  Le Wang

# This program illustrates some basic programming philosophy
# and R operations

########################################
# Program Styles
# 1. Comments
# 2. Half window rule
# 3. Indent (and indent again!)
# 4. Block
########################################

# Whenever possible, use comments! 
# Anything following the symbol "#" will not be run in R

# Comments are notes we leave ourselves so we know: 
# 1. Exactly who wrote the code (important in companies where many people may work on a project) 
# 2. The purpose of the code!

# For example

# Set seed number so that all the results based on random samples 
# are reproducible.
  set.seed(12345)

# Then create a normally distributed random variable, x, with 500 
# observations.
  x <- rnorm(500)

  # Notice "<-" is the universal assignment operator in R

  ####################
  # Quiz 1 (-cont.-) 
  ####################
  
  # Use the previous script and write the following comments
  # 1. The project
  # 2. The author
  # 3. The purpose of this program    

  
  
########################################
# 
#  R Basics
#  1. Arithmetic
#  2. Logical comparison
#
########################################  
  
#  1. Arithmetic
  
  #add numbers
  1 + 1

  #subtract them
  8 - 4

  #divide
  13/2

  #multiply
  4*pi

  #exponentiate
  2^10   
  
  ####################
  # Quiz 1 -cont.-
  ####################
  
  # Compute the difference between 2018 and the year you 
  # started at this university and divide this by the 
  # difference between 2018 and the year you were born. 
  # Multiply this with 100 to get the percentage of your 
  # life you have spent at this university. Use brackets 
  # if you need them.  
  
  
#  2. Logical comparison
  
  3 < 4
  3 > 4

  #contrast with 3 = 4; see section about variables below
  3 == 4
  3 != 4
  
  10 - 6 == 4
  
  # Notice the difference between single and double equal signs

#  3. Strings (text)
  
  
  #R delimits strings with EITHER double or single quotes.
  #  There is only a very minimal difference
  
  'Econometrics is awesome'  
  "Econometrics is still awesome"  
  
#  4. Variables (you can think of it as a cup)
#  Assignment to a variable happens from right to left - 
#  the value on the right side gets assigned to the name on 
#  the left side. You can use nearly anything as a variable 
#  name in R. The only rules are:
    
    # "." and "_" are OK, but no other symbols.
    # Your variable name must not start with a number or 
    # _ (2squared and  _one are illegal).  
  
    # [A note for those of you who have programming experience:
    # while R supports object-oriented programming, periods "." 
    # do not have a special meaning in the language. 
    # For historical reasons, R programmers often use periods 
    # in place of underscores in variable names, but either 
    # works. Just be consistent to keep your code readable.]  
  
  
    x <- 42
    x / 2
    
    x = 42
    
    # redefine x
    x <- x + 3
    x
    
    #if we assign something else to x,
    #  the old value is deleted        
    x <- "Melody to Funkytown!"
    x
    
    # R cannot put a together a numerical and a string variable together
    # R will automatically convert numerical to string.
    x <- c("melody",1)
    
    foo <- 3
    bar <- 5
    foo.bar <- foo + bar
    foo.bar

    # To remove all variables in memory (otherwise all the objects that 
    # you create using R remain in existence until you delete them or 
    # you conclude the session):
    
    rm(list=ls())

