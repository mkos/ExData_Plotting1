power <-  read.csv2("household_power_consumption.txt", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), dec=".")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- power[power$Date == as.Date("2007-02-01","%Y-%m-%d") | power$Date == as.Date("2007-02-02","%Y-%m-%d"), ]
power$dateTime   <- as.POSIXlt(paste(power$Date, power$Time, sep=" "))

png("plot3.png")
with(power, plot(dateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(power, lines(dateTime, Sub_metering_1))
with(power, lines(dateTime, Sub_metering_2, col = "red"))
with(power, lines(dateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()