# instead of writing TRUE or FALSE, we can write T or F
# c(x,y) will create a container of the common type if c(numerica,string) -> string
# c(bool,numeric) -> c(numeric,numeric)
# as.logical(x) converts vector into vector of boolean values 
# as.numeric(x)
# m <- matrix(nrow = n, ncol = p) creates matrix with n rows and p cols
# dim(m) yields the dimension
# fill matrix columnwise m<- matrix(1:6, nrow = n, ncol = p)

#with given vector: m <- 1:10 can make a matrix by converting
# dim(m) <- c(2,5)  ie, two rows and 5 columns
#can bind column and row values, x<-1:3 y <-10:12
# cbind(x,y)
# 1  10
# 2  11
# 3  12

#rbind(x,y)
# 1  2  3
# 10 11 12

#R has list containers for mixed types
# x<- list(1,"a",T,1+4i) numeric, char,logical,complex in the R type lingo

# Everything is 1 indexed.

# Factors are another type that represent categorical data, value or ordered categorical var
# for linear models, will use functions lm() and glm()
# x <- factor(c("yes","yes","no","yes","no"))
# Levels: no yes
# table(x) makes a table representation of factors
# unclass(x)  makes a numeric representation
# attr(,"levels")
# "no"  "yes"


# can specify baseline level, otherwise will be alphabetical
# x <- factor(c("yes","yes","no","yes","no"),levels = c("yes","no"))

#missing values are NA (everything else) or NaN (mathematical)
# is.na() check for NA
# is.nan() check for NaN

# x<- c(1,2,NA,10,3)
# is.na(x)
# returns logical vector
# F F T F F
# is.na() will consider NaN as Na in test!!

# reading data frames, mixed types are ok unlike matrices which require 
# same type
# read.csv()
# read.table()

# dataframe can be converted to a matrix
# data.matrix() but has to be all same types and will coerce type to highest level
# make a data frame by 
# x <- data.frame()

# can associate names to values in a vector:
# x <- 1:3
#names(x) <- c("Happy", "Sad", "waffles")
#x
#Happy  Sad  waffles
#1       2    3

# can do the same to lists and matrices
# with matrices use dimnames(m) <- list(c("a","b"),c("c","d"))
# where a and b are the row names and c and d are the col names

# subsetting 
# single square bracket returns object of same class back
# [[ extract elements of a list or a data frame, only extracts single element
# $ is used to extract elements of a list or data frame by name. 

# x <- c("a","B","c","d")
# x[1:4]  returns first for elements
# x[x > "a"] returns all elements where element is greater than a, ie after a
# create logical vector that returns which elements have a property
# u <- x>"a"  returns F T T T
# matrix 
# x <- matric(1:6,2,3)
# x[1,2]  element at first row second column
# 3
# x[1,] first row
# x[,2] second col

# if you want a matrix returned instead of just an element
# x[1,2, drop = F] default is drop = T, will get a 1X1 matrix with element 3
# likewise x[1,] returns a vector instead of a matrix, 
# x[1,,drop=F] will return a matrix

# lists
# [[]] will give inner level of data, [] will return a list of that index
# x[c(1,3)] will return the first and third elements of the list in a list

# to filter out NA values
# the vector
# x <- c(1,2,NA,4,NA,5)
# vector of booleans corresponding to vector above
# bad <- is.na(x)
# select the complement of bad from x
# x[!bad]
# if multiple vectors
# good <- complete.cases(x,y)  returns the positions of both with non missing
# via a boolean vector
# x[good] returns the good values
# y[good]returns good values

# in a data frame, 
# return all rows where there are no missing values:
# good <- complete.cases(dataframe)
# dataframe[good,][colums,] where columns is a vector

# element wise arithmetic is same as regular arithmetic x+y will do element wise
# true matrix multiplication is x%*%y


# To estimate how much memory in RAM you'll need
# numRows * numCols * numBytes = bignum bytes
# bignum/2^(20) = num MB
# num/2^(10) = num2 GB

# need at least twice as much RAM as size of data file.
# if all data is numeric = 8 bytes


 
