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
png("plot2.png",width = 480,height = 480)
# type = "l" is for lines 
plot(data$datetime,data$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
