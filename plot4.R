##Reading the file into data frame and choose only date 1/2/2007 and 2/2/2007
filename="household_power_consumption.txt"
dat=read.table(filename,sep=";", header=T, na.strings = "?",stringsAsFactors=F)
data=dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]

##Switch the format of Time column into day:month:year hour:minute:second
data$Time=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

##Creating graphs
png(file="plot4.png",width=480, height=480)
par(mfrow=c(2,2))

##Row1:plot1 Time versus Global minute-averaged active power as lines graph
plot(data$Time,data$Global_active_power,col="black",type="l",
		xlab="", ylab="Global Active Power")

##Row1:plot2 Time versus Minute-averaged Voltage as lines graph 
plot(data$Time,data$Voltage,col="black",type="l",
		xlab="datetime", ylab="Voltage")

##Row2:plot1 Time versus energy sub-metering No. 1, No.2 and No.3 
##            as 3 different colors lines

with(data,{
	plot(data$Time,data$Sub_metering_1,col="black",type="l",
		xlab="", ylab="Energy sub metering")
	lines(data$Time,data$Sub_metering_2,col="red",type="l")
	lines(data$Time,data$Sub_metering_3,col="blue",type="l")
	legend("topright",lty=1,bty= "n", col=c("black","red","blue"),
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

##Row2:plot2 Time versus Global minute-averaged reactive power as lines graph

plot(data$Time,data$Global_reactive_power,col="black",type="l",
		xlab="datetime", ylab="Global_reactive_power")
dev.off()
