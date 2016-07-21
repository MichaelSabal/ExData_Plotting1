plot3 <- function() {
	pc <- read.table("household_power_consumption.txt",sep=";",
		colClasses=c("character","character",rep("numeric",7)),header=TRUE,na.strings="?")
	pc <- pc[pc$Date=="1/2/2007" | pc$Date=="2/2/2007",]
	png("plot3.png",width=480,height=480)
	plot(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),
		 pc$Sub_metering_1,type="l",ylim=c(0,30),ylab="Energy sub metering",xlab="",col="black")
	lines(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),pc$Sub_metering_2,type="l",
		  ylim=c(0,30),col="blue")
	lines(strptime(paste(pc[,1],pc[,2]),format="%d/%m/%Y %H:%M:%S"),pc$Sub_metering_3,type="l",
		  ylim=c(0,30),col="red")
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		   lty=c(1,1),col=c("black","blue","red"))
	dev.off()
}