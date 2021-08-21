# Example: Joins 
# Le Wang

# This program illustrates several simple ways to merge
# or filter data (adapted from R for Data Science)


# Let's visualize the various "join" commands

examples/example_dplyr_joins_summary.pdf

library("dplyr")

# Generate some artificial data
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)

# The simplest type of join is the inner join. 
# An inner join matches pairs of observations whenever their keys are equal:

x %>% 
  inner_join(y, by = "key")

# An inner join keeps observations that appear in both tables. 
# An outer join keeps observations that appear in at least one of the tables. 

# A left join keeps all observations in x.
x %>% 
  left_join(y, by = "key")

# A right join keeps all observations in y.
x %>% 
  right_join(y, by = "key")


# A full join keeps all observations in x and y.
x %>% 
  full_join(y, by = "key")

##################################
# Filtering Joins
##################################



# Filtering joins match observations in the same way as mutating joins, 
# but affect the observations, not the variables. There are two types:
  
# semi_join(x, y) keeps all observations in x that have a match in y.
x %>% 
  semi_join(y, by = "key")


# anti_join(x, y) drops all observations in x that have a match in y.
x %>% 
  anti_join(y, by = "key")
