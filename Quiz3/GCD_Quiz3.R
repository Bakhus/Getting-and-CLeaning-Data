setwd("C:\\Users\\dkh320\\Desktop\\Coursera\\Getting-and-Cleaning-Data\\Quiz3")


fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

if(!file.exists("data")){
    dir.create("data")
    
}
download.file(fileUrl, destfile="./data/getdata-data-ss06hid.csv")
acs<-read.csv("./data/getdata-data-ss06hid.csv",header=TRUE)


#---------- Question 1 ------------------------------------------
acs$agricultureLogical=ifelse(acs$ACR==3 &acs$AGS==6,TRUE, FALSE)
which(acs$agricultureLogical)
#----------------------------------------------------------------

#---------- Question 2 ------------------------------------------
library(jpeg)
picUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(picUrl, destfile="./data/jeff.jpg",mode="wb")
jeff<-readJPEG("./data/jeff.jpg",native=TRUE)
quantile(jeff,c(0.3,0.8))
#----------------------------------------------------------------

#---------- Question 3 ------------------------------------------
gdpUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
eduUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(gdpUrl, destfile="./data/gdp.csv",mode="wb")
download.file(eduUrl, destfile="./data/edu.csv",mode="wb")

gdp<-read.csv("./data/gdp.csv", skip=5, blank.lines.skip=TRUE, stringsAsFactors=TRUE,
              skipNul=TRUE, colClasses = c(NA,NA,"NULL",NA,NA),header=FALSE)
gdp<-gdp[1:190,1:4]
names(gdp)<-c("CountryCode", "Ranking", "Economy", "GDP")

edu<-read.csv("./data/edu.csv", header=TRUE, stringsAsFactors=TRUE)

mergedData<- merge(gdp,edu,by.x="CountryCode",by.y="CountryCode")

# number of matching IDs
nrow(mergedData)

library(plyr)
mergedData<-arrange(mergedData,desc(as.numeric(as.character(Ranking))))
mergedData[13,c("CountryCode","Economy")]
#----------------------------------------------------------------

#---------- Question 4 ------------------------------------------
OECD<-mergedData[mergedData$Income.Group=="High income: OECD", "Ranking"]
nonOECD<-mergedData[mergedData$Income.Group=="High income: nonOECD", "Ranking"]

mean(as.numeric(as.character(OECD)))
mean(as.numeric(as.character(nonOECD)))
#----------------------------------------------------------------

#---------- Question 5 ------------------------------------------
library(Hmisc)
gdpGroups<-cut2(as.numeric(as.character(mergedData$Ranking)),g=5)
table(gdpGroups,mergedData$Income.Group)
#----------------------------------------------------------------

