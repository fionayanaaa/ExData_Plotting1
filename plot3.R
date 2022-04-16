## read the data into a datatable
DT <- read.table("household_power_consumption.txt", sep = ";",
                 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                 skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879)

dates <- DT$Date
times <- DT$Time
x <- paste(dates, times)
x <- strptime(x, format = "%d/%m/%Y %H:%M:%OS")

## plot and save
png("plot3.png", width = 480, height = 480)
plot(x, DT$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x, DT$Sub_metering_2, col = "red")
lines(x, DT$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
       