powerCon <- read.table("./data/household_power_consumption.txt",sep=";",header=T)
powerCon$Date <- as.Date(powerCon$Date,format="%d/%m/%Y")
powerCon <- powerCon[powerCon$Date == "2007-02-02" | powerCon$Date == "2007-02-01",]
powerCon$Global_active_power <- as.numeric(as.character(powerCon$Global_active_power))
png(filename="plot1.png")
hist(powerCon$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()