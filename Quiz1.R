setwd("C:\\Users\\Bahus\\Desktop\\Coursera\\Getting  and Cleaning Data")

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "

download.file(fileUrl, destfile="./survey.csv")

list.files("./")

survey<-read.table("./survey.csv", sep=",",header=TRUE)

library(data.table)

DT<-data.table(survey)

## Question 1
length(DT[DT$VAL=="24",VAL])

## Question 3

fileUrl2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl2,destfile="./Gas.xlsx")

library(xlsx)

cols<-7:15
rows<-18:23

dat<-read.xlsx("./Gas.xlsx",sheetIndex=1,rowIndex=rows,colIndex=cols)

sum(dat$Zip*dat$Ext,na.rm=T) 

## Question 4

library(XML)
fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc<-xmlTreeParse(fileUrl,useInternal=TRUE)

rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

data<-xpathSApply(rootNode,"//zipcode",xmlValue)

length(data[data=="21231"])

## Question 5

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

download.file(fileUrl,destfile="./community.csv")

DT<-fread("./community.csv")

system.time(mean(DT[DT$SEX==1,]$pwgtp15))
system.time(mean(DT[DT$SEX==2,]$pwgtp15))

mean(DT$pwgtp15,by=DT$SEX)
system.time(mean(DT$pwgtp15,by=DT$SEX))

tapply(DT$pwgtp15,DT$SEX,mean)
system.time(tapply(DT$pwgtp15,DT$SEX,mean))

DT[,mean(pwgtp15),by=SEX]
system.time(DT[,mean(pwgtp15),by=SEX])

sapply(split(DT$pwgtp15,DT$SEX),mean)
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])

