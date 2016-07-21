plot1 <- function() {
	pc <- read.table("household_power_consumption.txt",sep=";",
		colClasses=c("character","character",rep("numeric",7)),header=TRUE,na.strings="?")
	pc <- pc[pc$Date=="1/2/2007" | pc$Date=="2/2/2007",]
	png("plot1.png",width=480,height=480)
	hist(pc$Global_active_power,breaks = 18,col="orangered3",
		 xlab="Global Active Power (kilowatts)",main="Global Active Power")
	dev.off()
}