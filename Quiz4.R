setwd("C:\\Users\\dkh320\\Desktop\\Coursera\\Getting-and-Cleaning-Data")

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileUrl, destfile="getdata-data-ss06hid.csv")
acs<-read.csv("getdata-data-ss06hid.csv")


#---------- Question 1 ------------------------------------------
splitName<-strsplit(names(acs),"wgtp")
splitName[[123]]
#----------------------------------------------------------------

#---------- Question 2 ------------------------------------------
gdpUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdpUrl, destfile="gdp.csv",mode="wb")

gdp<-read.csv("gdp.csv", skip=5, blank.lines.skip=TRUE, stringsAsFactors=TRUE,
              skipNul=TRUE, colClasses = c(NA,NA,"NULL",NA,NA),header=FALSE)
gdp<-gdp[1:190,1:4]
names(gdp)<-c("CountryCode", "Ranking", "Economy", "GDP")
gdps<-gsub(",","",gdp$GDP)
gdps<-as.numeric(gdps)
mean_gdp<-mean(gdps)
mean_gdp
#----------------------------------------------------------------------


#------------ Question 3 ------------------------------------------
countryNames<-gdp$Economy
length(grep("^United",countryNames))
#----------------------------------------------------------------

#---------- Question 4 ------------------------------------------
eduUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(eduUrl, destfile="edu.csv",mode="wb")
edu<-read.csv("edu.csv", header=TRUE, stringsAsFactors=TRUE)

mergedData<- merge(gdp,edu,by.x="CountryCode",by.y="CountryCode")
nrow(mergedData[grepl("Fiscal year end: June",mergedData$Special.Notes),])
#----------------------------------------------------------------

#---------- Question 5 ------------------------------------------
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
years<-year(sampleTimes)

n2012<-years[years==2012]
nMondays2012<-sampleTimes[year(sampleTimes)==2012 & weekdays(sampleTimes)=="Monday"]

length(n2012)
length(nMondays2012)

#----------------------------------------------------------------
