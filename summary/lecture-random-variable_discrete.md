# Random Variables and Probability Functions (Discrete Variables)

## Detailed Topics to be covered

1. Random Variable: Definition and examples

2. Probability function

    1. Population vs Sample
    2. Frequency tables: Program by hand vs Histogram
    3. Probability Mass Function: Definition and Program in `R`
    4. Histogram, Classification, and Prediction
    5. Evaluation of Prediction Errors
    6. Cumulative Distribution Function: Definition and Program in `R`
    
3. Factor variables in `R`

    1. How to evaluate whether a variable is a factor variable `is.factor()`
    2. How to create a factor variable `factor(variable, label = )`
    3. How many unique values? `levels()`
    4. Ordering the categories of a factor variable `factor(variable,levels = )`
    5. Force R to recognize the arithmetic order of a factor variable `ordered(variable,levels=)`
    5. Naive ways to analyze factor variables `table()` and `plot()`, instead of `histogram()`.
    
4. Tidy Approaches -- Examples:

    1. IPUMS Data

## Reading and Useful Resources

### Required Readings

1. Chapter 2 in Lind et al. 
2. [Slides](../lecture/univariate_statistics_rv01.pdf)
3. [R Example: Discrete Variables (Basics)](../lecture/examples/discrete_variable_basics.R)
4. [R Example: Factor Variables (Basics)](../lecture/examples/discrete_variable_factor_basics.R)
5. [R Example: IPUMS Data R file](../lecture/examples/discrete_variable_factor_examples.R)
6. [R Example: IPUMS Data files (1)](../lecture/examples/cps_00019.dat); [R Example: IPUMS Data files (2)](../lecture/examples/cps_00019.xml); [R Example: IPUMS Data files (3)](../lecture/examples/cps_00019.R)

### R related Readings

1. [Penn State Stat 484: Topics in R Statistical Language Lesson 2.1-2.6](https://onlinecourses.science.psu.edu/stat484/node/210/)
2. [R for Data Science: Chapter 15 Factors](http://r4ds.had.co.nz/factors.html)
3. [Introduction to `ipumsr` - IPUMS Data in R](https://cran.r-project.org/web/packages/ipumsr/vignettes/ipums.html)
4. [Factor Variable: Example in Finance](https://www.datacamp.com/community/tutorials/intro-r-finance-factors)

