# read power consumption data from "household_power_consumption.txt" for February 1st 2007 - February 2nd 2007
read_power_consumption_data <- function() {
        power_consumption_all <- read.csv("household_power_consumption.txt", sep = ";", dec = '.', na.strings = "?")
        power_consumption_all$Time <- strptime(paste(power_consumption_all$Date, power_consumption_all$Time), "%d/%m/%Y %H:%M:%S")
        power_consumption_all$Date <- as.Date(power_consumption_all$Date, format = "%d/%m/%Y")
        power_consumption <- subset(power_consumption_all, Date >= "2007-02-01" & Date <= "2007-02-02")
        rm(power_consumption_all)
        power_consumption
}

create_png4 <- function() {
        power_consumption <- read_power_consumption_data()
        png(file = "plot4.png", width = 480, height = 480, units = "px")
        
        par(mfrow = c(2,2))
        with(power_consumption, plot(Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt = "n"))
        axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
        
        with(power_consumption, plot(Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt = "n"))
        axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
        
        with(power_consumption, plot(Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "", xaxt = "n"))
        with(power_consumption, points(Sub_metering_2, type = "l", col = "red"))  
        with(power_consumption, points(Sub_metering_3, type = "l", col = "blue"))
        legend("topright", pch = NA, lty = 1, col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
        
        with(power_consumption, plot(Global_reactive_power, type = "l", xlab = "datetime", xaxt = "n"))
        axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
        
        dev.off()
}