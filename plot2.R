power <-  read.csv2("household_power_consumption.txt", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), dec=".")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- power[power$Date == as.Date("2007-02-01","%Y-%m-%d") | power$Date == as.Date("2007-02-02","%Y-%m-%d"), ]
power$dateTime   <- as.POSIXlt(paste(power$Date, power$Time, sep=" "))

png("plot2.png")
with(power, plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()