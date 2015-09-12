setwd("C:\\Users\\Bahus\\Desktop\\Coursera\\Getting  and Cleaning Data")
acs<-read.csv("./getdata-data-ss06pid.csv")

library(sqldf)
library(RSQLite)


unique(acs$AGEP)

sqldf("select distinct AGEP from acs")

con<-url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode<-readLines(con)
nchar(htmlcode[10])

x <- read.fwf("./getdata-wksst8110.for", skip=4, widths=c(12, 7,4, 9,4, 9,4, 9,4))

sum(x[4])