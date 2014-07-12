Sys.setlocale("LC_TIME", "English") 
powerCon <- read.table("./data/household_power_consumption.txt",sep=";",header=T)
powerCon$Date <- as.Date(powerCon$Date,format="%d/%m/%Y")
powerCon <- powerCon[powerCon$Date == "2007-02-02" | powerCon$Date == "2007-02-01",]
powerCon$Global_active_power <- as.numeric(as.character(powerCon$Global_active_power))
powerCon$dateTime <- paste(powerCon$Date,powerCon$Time,sep=" ")
powerCon$dateTime <- strptime(powerCon$dateTime,format="%Y-%m-%d %H:%M:%S")
png(filename="plot4.png")
par(mfrow=c(2,2))
#1
plot(powerCon$dateTime,powerCon$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#2
plot(powerCon$dateTime,powerCon$Voltage,type="l",ylab="Voltage",xlab="datetime")
#3
plot(powerCon$dateTime,powerCon$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(powerCon$dateTime,powerCon$Sub_metering_2,type="l",col="red")
lines(powerCon$dateTime,powerCon$Sub_metering_3,type="l",col="blue")
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#4
plot(powerCon$dateTime,powerCon$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()