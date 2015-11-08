##Reading the file into data frame and choose only date 1/2/2007 and 2/2/2007
filename="household_power_consumption.txt"
dat=read.table(filename,sep=";", header=T, na.strings = "?",stringsAsFactors=F)
data=dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]

##Switch the format of Time column into day:month:year hour:minute:second
data$Time=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

##Creating line graph for Time versus Global active power
png(file="plot2.png",width=480, height=480)
plot(data$Time,data$Global_active_power,col="black",type="l",
	xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
