# Ch2:  Data in Statistics and in R_______________________________________________________


# Factors
'Description:           Categorical, unordered.  Example:  Names, States, etc. 
 Creation:              factor()
'
names_test <- c('Todd', 'Brian', 'Joe')
names_factor <- factor(names_test)
print(names_factor)

'Syntax:    D = [60,70):    Means an interval between 60 and 70, including 60 but not 70.   SO this is 60-69'
grade <- LETTERS[1:4]
scores <- runif(100, min = 0, max = 100)
grade_letters <- cut(scores, breaks = c(0, 70, 80, 90, 100), labels = grade, right = FALSE)
grade_letters
table(grade_letters)                              # return count of grades in a table. 


# Ordered Factors
'To set an order to factors'

grade.factor <- factor(grade)
grade.levels <- factor(grade, ordered = TRUE)     # set order to factors
grade.levels
is.ordered(grade.levels)                          # check if object is ordered


# Dates
'Intro to using dates'
Sys.Date()
Sys.time()
Sys.timezone()

# Objects that Hold Data
'Types:           
            Lists:          Can contian arbitrary data types or objects.  Access single values using [[]] not single.  Single brackets are used for accessing elements of an array or vector.  
            Vectors:        dim 1 and length of at least 0. The ith element of a vector is accessed via v[i]. 
            Matrices:       k dimensions. wo dimensional arrays.   They are rectangular.  The intersection of the element in the ith row and jth column m[i,j]. Arrays have k dimensions. 
            Arrays:         Have n dimensions.  The distinction between a vector and an array is that an array has an attribute for dimensions. 
                            For example, a matrix object is a two-dimensional array.  It therefore has this dim attribute.   Its dimension vector has a length of 2.  The first
                            element indicates the number of rows and the second the num of columns. 
            Dataframes:     
            cbind(), rbind()  Dont forget about these functions. 
'


v <- 1:10
is.vector(v); is.array(v)      # vector, not an array

dim(v) <- c(10)
is.vector(v); is.array(v)      # array, not a vector. 

m <- matrix(0, ncol = 3, nrow = 2)       # matrix with 3 columns and 2 rows. 
is.array(m); is.matrix(m); attributes(m)

v <- 1:24; (a <- array(v ,dim = c(3,5,2)))  # create an array, 3 rows, 5 columns
help(array)

a <- 1
b <- 2
l <- list(a, b, letter = c('a', 'b'))             # List that contains objects 'a' and 'b'
l
mode(l)                     # returns 'list'
l$letter                    # access attribute. 



### Dataframes---------------------------------------------------
composers = c('Sibelius', 'Wagner', 'Shostakovitch')
grandiose = c(1,3,2)
df_music = data.frame(composers, grandiose)
df_music

# Coerce Data
as.data.frame(matrix(1:24, nrow = 4, ncol = 6))  # Coerce data into dataframe with as.data.frame

# Refer to columns
df_music$composers        # By Name
df_music[, 1]             # By index
df_music[, 'composers']   # By name - index

# Data Organization
univariate = 'data that describe or measure a single attribute'
Bivariate = 'data represented in pairs'
Multivariate = 'data are composed fo a set of observations on objects.'

data("airquality")
head(airquality)        # print head of dataframe
names(airquality)       # call column names


### Import & Export of Data ----------------------------------------------------

getwd()
setwd('home/ccirelli2/Desktop')
complaints_2019_01_28_19_55$Product    # loaded via gui. 


# Data Connections
install.packages("RODBC")
installed.packages()

# Connect to MySQL---------------------------------------------------------------
install.packages("RMySQL")
library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='root', host = 'root')  # Failes to connect.

# Stack

?stack()
require(stats)
pg = unstack(PlantGrowth)
pg                         # pg has three columns, ctlr, trt1, trt2, all of which have numerical values. No row names. 
stack(pg)                  # stack(pg) returns two columns, one with all of the numerical values and another with the col labels from above. 



# Bind, Merge, Union --------------------------------------------------------

letters = c('A', 'B', 'C', 'D')
numbers = c(1,2,3,4)
letters.numbers = cbind(letters, '|' = '|', numbers)
letters.numbers            # Note the output and how the columns are split with "|"

l.n.merged = merge(letters, numbers)
l.n.merged

l.n.union = union(letters, numbers)
l.n.union


# String Operations ----------------------------------------------------------------

# Substr()
string.1 = 'Today is a good day to code'
string.2 = substr(string.1, 1, 2)           # returns the partial of a string.  syntax substr(string, start, stop)
string.3 = substr(string.1, 1, 5)           # note that R indexing starts from 1 and not 0 like with Python. 

# Concatenation w/ paste()
string.4 = paste('Today', 'is', 'a', 'good', 'day', 'to', 'code', sep = '-')
string.4

# Convert to Upper and Lowercase
string.4.upper = toupper(string.4)
string.4.lower = tolower(string.4)

# Grouping Data in a DataFrame by Column
install.packages("sqldf")                   # R package for executing SQL select statements.  syntax looks weird. 



# dplyr Package
rm(list= ls())
library(dbplyr)

sales.1 = c(100, 200, 120, 1, 400, 200, 342, 2)
groups.1 = c('A', 'B', 'A', 'C', 'A', 'C', 'E', 'W')
df = data.frame(sales.1, groups.1)
df
documentation = 'https://datacarpentry.org/R-genomics/04-dplyr.html'






