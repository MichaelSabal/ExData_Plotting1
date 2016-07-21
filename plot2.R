plot2 <- function() {
	pc <- read.table("household_power_consumption.txt",sep=";",
		colClasses=c("character","character",rep("numeric",7)),header=TRUE,na.strings="?")
	pc <- pc[pc$Date=="1/2/2007" | pc$Date=="2/2/2007",]
	png("plot2.png",width=480,height=480)
	plot(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),
		 pc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
	dev.off()
}