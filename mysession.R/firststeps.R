###########################################################################
#                                                                         #
# a very short introduction to R
# firststeps.R
#                                                                  >>>>>>
# 2015 Dec 03
# Dominik Hattrup
#                                                                         #
###########################################################################


# 01 SOME [R] PRINCIPLES --------------------------------------------------

# 1. R is not Excel
# 2. R is not Excel!
# 3. Think in objects rather than tables
# 4. Don't look at the data, analyse it!
# 5. Don't save the environment! Save your Scripts!
# ...

# 02 BASIC CALCULATIONS ---------------------------------------------------

1+1
1 +1
1 + 1
1 +  1
1+1 # +1
3*4
7/5
sqrt(9)
(9+4)/4*2
9+4/4*2
(9+4/4)*2
2^4
cos(3)
sin(35)

# 03 assign values to variables -------------------------------------------

x = 1
x

y <- 2
y

3 -> y
y

3 <- z
z

rm(x,y) # remove objects

median(x = 1:10)
x

median(x <- 1:10)
x 

x = (y = 5)
x

(x = y) = 5
x
  
x <- 3*5
x

a <- c(5,5,5) # assigning a vector; 
a # is now a sequence of elements of the same type called components or members (of the sequence)

a.logical <- c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE)
a.logical

b <- 1:10
b

x
x <- x + 1
x

a
a <- a + 1
a

a.logical <- a.logical + 1 # SURPRISE
a.logical

a.logical.1 <- c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE)
a.logical.2 <- a.logical*a.logical
a.logical.3 <- a.logical.1*c(TRUE, FALSE, FALSE, TRUE, FALSE, TRUE)
a.logical.1
a.logical.2
a.logical.3

b
b <- b + 1
b

# 04 BASIC DATA TYPES -----------------------------------------------------

# numeric (Decimal Values)
x <- 7.5
class(x)
x <- 10
x
class(x) # integers saved as numeric!
is.numeric(x)
is.integer(x) # !!
y = as.integer(10)
is.integer(y)
z = as.integer(x)
class(z)
z

# logical
as.integer(TRUE) 
as.integer(FALSE)

x <- 1
y <- 2
z = x > y
z
class(z)

# character
a <- "Hello World"
class(a)

as.integer(a)
a
class(a)

a <- as.character(7.99)
a

first <- "Hello"
last <- "World"
paste(first, last)
hw <- paste(first, last)
hw
class(hw)
hw2 <- c(first, last)
hw2
class(hw2)
length(hw)
length(hw2)

# sprintf
sprintf("Die Antwort auf %s ist %d !!!", "Alles", 42) 

# substr
substr("Die Antwort auf Alles ist 42 !!!", start=26, stop=28)

# sub
sub("42","7", "Die Antwort auf Alles ist 42")

# vector: 
# - sequence of data elements of the same basic type
# - members in a vector are called components
c(22,19,3)
v <- c(8,4,-2)
v
length(v)
y <- c(1,2,3)
z <- c(2,3)
v*2
v*y
v*z
length(z)

my.vec <- c("Hello","World")
my.vec

my.vec.2 <- c(1,2)
my.vec.2

my.vec*my.vec.2

my.vec.3 <- c(1,"Hello")
my.vec.3

my.vec.4 <- c(1,"TRUE", TRUE)
my.vec.4

my.vec.5 <- c(1, TRUE, TRUE)
my.vec.5

# combining vectors
my.vec.2 +  my.vec.5
my.new.vec <- c(my.vec.2, my.vec.5)
my.new.vec


# Recycling Rule
a <- c(8,8,8)
b <- c(1,2,3,4,5)
a/b
b/a

# indexing
b[2]
b[2:4]
b[5:3]
b[-2]

# naming vector components

b
names(b) <- c("Kobe","Shaq")
b

b["Shaq"]

# 05 Matrices and data.frames ---------------------------------------------

# Matrix
A = matrix(
  c(1,2,3,4,5,6), 
  nrow = 3,
  ncol = 2,
  byrow = T
)
A

B = matrix(
  c(1,2,3,4,5,6), 
  nrow = 3,
  ncol = 2
)
B

A[3,1]
A[,1]
A[3,]
A[1:2,1]

dimnames(A) = list(
  c("row 1","row 2","row 3"),
  c("col 1","col 2")
)

A
A["row 1",]

# Transpose Matrix
C <- t(A)
C

# Deconstruction
c <- c(C)
c

# data.frames

name <- c("Mr Black", "Mr White")
age <- c(45,55)
fav.color <- c("green","blue")

my.data <- data.frame(name, age, fav.color)
my.data

my.data$name
my.data["age"]

# 06 install.packages and load libraries ----------------------------------

library(MASS)
fractions(.4)

library(ggplot2)
install.packages(ggplot2)
if (!require(ggplot2)) { install.packages(ggplot2); library(ggplot2) }

.libPaths() # get library location
library()   # see all packages installed
search()    # see packages currently loaded

detach("package:MASS", unload=TRUE) # detach libraries
detach("package:ggplot2", unload=TRUE)
detach("package:MASS", unload=TRUE)

library(MASS,ggplot2) 

# 07 HELP -----------------------------------------------------------------

?c
help("c")
??c
   # https://www.r-project.org/other-docs.html
   # https://cran.r-project.org/manuals.html
   # use "[R]" in Google instead of "R"  
   # http://www.statmethods.net/

# 08 IMPORT DATA ----------------------------------------------------------

# get and set working directory
getwd()
#setwd("...")


# import CSV file
ognstats = read.table("ognstats.csv", sep=";", header=T)

head(ognstats)

# 09 Manipulate Data ------------------------------------------------------

# create new data.frame licences table

tab.users.lic <- data.frame(ognstats$YearWeek, ognstats$LicensesStandardUsed3M, ognstats$UniqueUser, ognstats$PageImpressions)
names(tab.users.lic)[1] <- "week"
names(tab.users.lic)[2] <- "used standard icenses"
names(tab.users.lic)[3] <- "unique user"  
names(tab.users.lic)[4] <- "page impressions"
#knitr::kable(tab.users.lic)

## build data.frame to plot Unique Users and Power Users
vars <- c("YearWeek","UniqueUser","UniqueUserActive") # notwendige Variablen aus ognstats
ogn.users <- ognstats[vars] # create new data.frame ogn.users
names(ogn.users)[2] <- "Normal Users"
names(ogn.users)[3] <- "Power Users"
ogn.users <- melt(ogn.users, id="YearWeek")
ogn.users$years <- substring(ogn.users$YearWeek, 1, 4) # new var with year
ogn.users$week <- substring(ogn.users$YearWeek, 6, 7) # new var with week
names(ogn.users)[2] <- "type"
names(ogn.users)[3] <- "count"

# 10 Analyse Data ---------------------------------------------------------

# Summary Statistics

summary(ognstats)

median(ognstats$PageImpressions)

# Plotting

plot.uu <- barplot(ognstats$UniqueUser, main = "UniqueUsers")

# plots using ggplot2

(( 
  barplot.users <- p <- ggplot(data=ogn.users, aes(x=YearWeek, y=count, fill=factor(years))) + 
    geom_bar(stat = "identity", width=.7) + ggtitle("Unique User over \n") + xlab("week") + ylab("Unique User") + 
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) + scale_fill_grey(start = .6, end = .2, name="year") 
))









