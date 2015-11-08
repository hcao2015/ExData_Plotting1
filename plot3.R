##Reading the file into data frame and choose only date 1/2/2007 and 2/2/2007
filename="household_power_consumption.txt"
dat=read.table(filename,sep=";", header=T, na.strings = "?",stringsAsFactors=F)
data=dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]

##Switch the format of Time column into day:month:year hour:minute:second
data$Time=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

##Creating graph of Time versus energy sub-metering No. 1, No.2 and No.3 as 3 different colors lines
png(file="plot3.png",width=480, height=480)
with(data,{
	plot(data$Time,data$Sub_metering_1,col="black",type="l",
		xlab="", ylab="Energy sub metering")
	lines(data$Time,data$Sub_metering_2,col="red",type="l")
	lines(data$Time,data$Sub_metering_3,col="blue",type="l")
	legend("topright",lty=1,col=c("black","red","blue"),
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.off()