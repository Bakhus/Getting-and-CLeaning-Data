setwd("C:\\Users\\dkh320\\Desktop\\Coursera\\Getting-and-Cleaning-Data")


# Question 1
# Answ: 2013-11-07T13:25:07Z


#Question 2
acs<-read.csv("./getdata-data-ss06pid.csv")
library(sqldf)
library(RSQLite)
#Answer: 
sqldf("select pwgtp1 from acs where AGEP < 50")

#Question 3
unique(acs$AGEP)
#Answer
sqldf("select distinct AGEP from acs")

#Question 4
con<-url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode<-readLines(con)
#Answer
nchar(htmlcode[10])
nchar(htmlcode[20])
nchar(htmlcode[30])
nchar(htmlcode[100])

#Question 5
x <- read.fwf("./getdata-wksst8110.for", skip=4, widths=c(12, 7,4, 9,4, 9,4, 9,4))
#Answer
sum(x[4])