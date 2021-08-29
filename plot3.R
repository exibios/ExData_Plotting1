# The source is data.csv, base.r file gets the data ready to use
# base.r does this with the original source file 
## Here is the calculation of memory required, 
## row count of txt file
## change null values from ? to null
## subset of dates required 20070201 and 20070202
## change of date format

data <- read.table("data.csv",header=TRUE,sep = ",")
data$Date<-as.Date(data$Date)
## I'm in Mexico so I have to change the locale to English
Sys.setlocale("LC_TIME","English")
## to change it to Spanish again
#Sys.setlocale("LC_TIME","Spanish")

data$dayname<-weekdays(data$Date)
# create a datetime variable
data$datetime<-as.POSIXct(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

# png 480x480
png("plot3.png",width = 480,height = 480)
# only 1 graph
par(mfrow=c(1,1))
# base graph 
plot(data$datetime,data$Sub_metering_1,type="n",ylab = "Energy sub metering",xlab="")
# black Sub_metering_1
lines(data$datetime,data$Sub_metering_1,type="l")
# black Sub_metering_2
lines(data$datetime,data$Sub_metering_2,type="l",col="red")
# black Sub_metering_3
lines(data$datetime,data$Sub_metering_3,type="l",col="blue")
# lwd makes the line, using this instead of the char vector of "-" symbols
legend("topright",
       #pch=c("-","-","-"),
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex = 1,
       lwd = 1
       )
# closing graph device
dev.off()
