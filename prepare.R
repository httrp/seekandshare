###########################################################################
#                                                                         #
# short intro into automated reports using R
# prepare.R
#                                                                  >>>>>>
# 2015 Dec 03
# Dominik Hattrup
#                                                                         #
###########################################################################

# regular R file to import and prepare data


# load packages/libraries -------------------------------------------------

# packages to connect to sql server
# if (!require(RODBC)) { install.packages(RODBC); library(RODBC) }
# if (!require(DBI)) { install.packages(DBI); library(DBI) } 
# if (!require(RMySQL)) { install.packages(RMySQL); library(RMySQL) }
if (!require(reshape2)) { install.packages(reshape); library(reshape2) }
if (!require(ggplot2)) { install.packages(ggplot2); library(ggplot2) }

# import data -------------------------------------------------------------

# SQL-Server using RODBC
# via ODBC Connection "ognlogs" (must be created in odbc administrator beforehand!)
# con <- odbcConnect("ognlogs")

# Queries
# query.weeklydata <- "SELECT * FROM [dbo].[OgnReporting] ORDER BY [Year], [Week]"
# query.weeklydata_bycompany <- "SELECT * FROM [dbo].[OgnReporting_Company] ORDER BY [Year], [Week]"

# SELECT DATA
# ogn <- sqlQuery(con, query.weeklydata)
# ogn2 <- sqlQuery(con, query.weeklydata_bycompany)
# rm(query.weeklydata, con)
# rm(query.weeklydata_bycompany, con)

# csv files
ognstats <- read.table("ognstats.csv", sep=";", header=T)

# manipulate data ---------------------------------------------------------

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

# regular plots -----------------------------------------------------------

plot.uu <- barplot(ognstats$UniqueUser, main = "UniqueUsers")

# plots using ggplot2 -----------------------------------------------------

(( 
  barplot.users <- p <- ggplot(data=ogn.users, aes(x=YearWeek, y=count, fill=factor(years))) + 
    geom_bar(stat = "identity", width=.7) + ggtitle("Unique User over \n") + xlab("week") + ylab("Unique User") + 
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) + scale_fill_grey(start = .6, end = .2, name="year") 
))

