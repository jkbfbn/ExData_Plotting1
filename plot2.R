Sys.setlocale("LC_TIME", "English") 
powerCon <- read.table("./data/household_power_consumption.txt",sep=";",header=T)
powerCon$Date <- as.Date(powerCon$Date,format="%d/%m/%Y")
powerCon <- powerCon[powerCon$Date == "2007-02-02" | powerCon$Date == "2007-02-01",]
powerCon$Global_active_power <- as.numeric(as.character(powerCon$Global_active_power))
powerCon$dateTime <- paste(powerCon$Date,powerCon$Time,sep=" ")
powerCon$dateTime <- strptime(powerCon$dateTime,format="%Y-%m-%d %H:%M:%S")
png(filename="plot2.png")
plot(powerCon$dateTime,powerCon$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()


