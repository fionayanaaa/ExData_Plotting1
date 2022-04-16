## read the data into a datatable
DT <- read.table("household_power_consumption.txt", sep = ";",
                 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                 skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879)

## plot and save
png("plot1.png", width = 480, height = 480)
hist(DT$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red")
dev.off()
