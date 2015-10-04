#fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "

#download.file(fileUrl, destfile="./community.csv")

#list.files("./")

survey<-read.table("./community.csv",sep=",", header=TRUE)

head(survey)

library(data.table)

DT<-data.table(survey) 
length(DT[DT$VAL=="24",VAL])



fileUrl2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

download.file(fileUrl2, destfile="./gas.xlsx")

library(xlsx)
