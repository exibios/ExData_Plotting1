# The source is data.csv, base.r file gets the data ready to use
# base.r does this with the original source file 
## Here is the calculation of memory required, 
## row count of txt file
## change null values from ? to null
## subset of dates required 20070201 and 20070202
## change of date format

data <- read.table("data.csv",header=TRUE,sep = ",")
data$Date<-as.Date(data$Date)
# png 480x480
png("plot1.png",width = 480,height = 480)
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
