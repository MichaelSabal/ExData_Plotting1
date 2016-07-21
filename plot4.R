plot4 <- function() {
	pc <- read.table("household_power_consumption.txt",sep=";",
		colClasses=c("character","character",rep("numeric",7)),header=TRUE,na.strings="?")
	pc <- pc[pc$Date=="1/2/2007" | pc$Date=="2/2/2007",]
	png("plot4.png",width=480,height=480)
	par(mfrow=c(2,2))
	# Upper left
	plot(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),
		pc$Global_active_power,type="l",ylab="Global Active Power",xlab="")
	# Upper right
	plot(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),
	    pc$Voltage,type="l",ylab="Voltage",xlab="datetime")
	# Lower left
	plot(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),
		pc$Sub_metering_1,type="l",ylim=c(0,30),ylab="Energy sub metering",xlab="",col="black")
	lines(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),pc$Sub_metering_2,type="l",
		ylim=c(0,30),col="blue")
	lines(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),pc$Sub_metering_3,type="l",
		ylim=c(0,30),col="red")
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		lty=c(1,1),col=c("black","blue","red"))
	# Lower right
	plot(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),
		pc$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="datetime")
	dev.off()
}