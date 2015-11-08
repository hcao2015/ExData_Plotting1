##Reading the file into data frame and choose only date 1/2/2007 and 2/2/2007
	
filename="household_power_consumption.txt"
dat=read.table(filename,sep=";", header=T, na.strings = "?",stringsAsFactors=F)
data=dat[dat$Date=="1/2/2007"|dat$Date=="2/2/2007",]

##Creating a histogram graph of Global active power for household

png(file="plot1.png",width=480, height=480)
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", 
	ylab="Frequency", main=" Global Active Power",col="red")
dev.off()
